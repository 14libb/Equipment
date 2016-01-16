//
//  ThirdViewController.swift
//  Equipment
//
//  Created by Betsy Li on 1/15/16.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit


class ThirdViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var equipmentInput: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var netidInput: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        nameList.append(nameInput.text!)
        nameInput.text = ""
        dateList.append(getCurrentTime())
        equipmentList.append(equipment)
        print(nameList)
        print(equipmentList)
        print(dateList)
        //equipmentInput.text = ""
        NSUserDefaults.standardUserDefaults().setObject(nameList, forKey: "nameList")
        NSUserDefaults.standardUserDefaults().setObject(equipmentList, forKey: "equipmentList")
        NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
        if thinkpad > 0 {
        thinkpad--
        }
        else {
        thinkpad = 0
        }
    }
    
    func getCurrentTime() -> String {
        
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .ShortStyle
        let stringValue = formatter.stringFromDate(date)
        return stringValue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.nameInput.delegate = self
        equipmentInput.text = equipment
        //self.equipmentInput.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //KeyBoard functions
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textfieldShouldReturn(textField:UITextField!) -> Bool{
        nameInput.resignFirstResponder()
        return true
    }
}