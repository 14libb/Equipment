//
//  ThirdViewController.swift
//  Equipment
//
//  Created by Betsy Li on 1/15/16.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit

var pickerData: [String] = [String]()
class ThirdViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var equipmentInput: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var netidInput: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var idNumber: UIPickerView!
    
    @IBAction func submit(sender: AnyObject) {
        if ((password.text == "CEID") && (equipid != "")) {
             self.performSegueWithIdentifier("passwordSegue", sender: self)
                nameList.append(nameInput.text!)
                nameInput.text = ""
                dateList.append(getCurrentTime())
                equipmentList.append(equipment)
                equipidList.append(equipid)
                print(nameList)
                print(equipmentList)
                print(dateList)
                print(equipidList)
                NSUserDefaults.standardUserDefaults().setObject(nameList, forKey: "nameList")
                NSUserDefaults.standardUserDefaults().setObject(equipmentList, forKey: "equipmentList")
                NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
                NSUserDefaults.standardUserDefaults().setObject(equipidList, forKey: "equipidList")
            
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
        pickerData = ["Equipment #","1", "2", "3", "4", "5", "6"]
    }
    
    override func viewDidAppear(animated: Bool) {
        equipmentInput.text = equipment
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    // Capture the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row != 0 {
        equipid = "\(row)"
        }
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