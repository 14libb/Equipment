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
        if password.text == "CEID" {
            nameList.append(nameInput.text!)
            nameInput.text = ""
            dateList.append(getCurrentTime())
            equipmentList.append(equipment)
            print(nameList)
            print(equipmentList)
            print(dateList)
            NSUserDefaults.standardUserDefaults().setObject(nameList, forKey: "nameList")
            NSUserDefaults.standardUserDefaults().setObject(equipmentList, forKey: "equipmentList")
            NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
        
            if (equipmentInput.text == "ThinkPad Laptop" && thinkpad.count > 0) {
                thinkpad.removeAtIndex(0)
            }
            else if (equipmentInput.text == "SparkFun Kit" && sparkFun.count > 0) {
                sparkFun.removeAtIndex(0)
            }
            else {
            }
            equipment = ""
        }
        else {
            print(nameList)
            print(equipmentList)
            print(dateList)
            NSUserDefaults.standardUserDefaults().setObject(nameList, forKey: "nameList")
            NSUserDefaults.standardUserDefaults().setObject(equipmentList, forKey: "equipmentList")
            NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
        }
    }
    
//    override func shouldPerformSegueWithIdentifier(password: String, sender: AnyObject!) -> Bool {
//        if password == "CEID" {
//            nameList.append(nameInput.text!)
//            nameInput.text = ""
//            dateList.append(getCurrentTime())
//            equipmentList.append(equipment)
//            print(nameList)
//            print(equipmentList)
//            print(dateList)
//            NSUserDefaults.standardUserDefaults().setObject(nameList, forKey: "nameList")
//            NSUserDefaults.standardUserDefaults().setObject(equipmentList, forKey: "equipmentList")
//            NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
//            if thinkpad > 0 {
//                thinkpad--
//            }
//            else {
//                thinkpad = 0
//            }
//            
//            if sparkFun > 0 {
//                sparkFun--
//            }
//            else {
//                sparkFun = 0
//            }
//            
//            return true
//        }
//        else {
//            return false
//        }
//    }
    
    
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
    }
    
    override func viewDidAppear(animated: Bool) {
        equipmentInput.text = equipment
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