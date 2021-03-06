//
//  ThirdViewController.swift
//  Equipment
//
//  Created by Betsy Li on 1/15/16.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit

//Set up for inventory and UIPickerView
var pickerData: [String] = [String]()
var thinkPadData = ["Equipment #","1", "2", "3", "4"]
var sparkFunData = ["Equipment #","1", "2", "3", "4", "5", "6"]

class ThirdViewController: UIViewController,UITextFieldDelegate {
    
    //Text fields for submit form
    @IBOutlet weak var equipmentInput: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var netidInput: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var idNumber: UIPickerView!
    
    //Require password and available equipment # to submit, update lists, store
    @IBAction func submit(sender: AnyObject) {
        if ((password.text == "CEID") && (equipid != "")) {
             self.performSegueWithIdentifier("passwordSegue", sender: self)
                nameHistory.append(nameInput.text!)
                netidHistory.append(netidInput.text!)
                equipmentHistory.append(equipment)
                equipidHistory.append(equipid)
                dateHistory.append(getCurrentTime())
                let history = [[nameHistory],[netidHistory],[equipmentHistory],[equipidHistory],[dateHistory]]
                print(history)
            
                nameList.append(nameInput.text!)
                nameInput.text = ""
                dateList.append(getCurrentTime())
                equipmentList.append(equipment)
                equipidList.append(equipid)

                NSUserDefaults.standardUserDefaults().setObject(nameList, forKey: "nameList")
                NSUserDefaults.standardUserDefaults().setObject(equipmentList, forKey: "equipmentList")
                NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
                NSUserDefaults.standardUserDefaults().setObject(equipidList, forKey: "equipidList")
            
                if (equipmentInput.text == "ThinkPad Laptop" && thinkPadData.count > 0) {
                    thinkPadData = thinkPadData.filter({$0 != equipid})
                }
                else if (equipmentInput.text == "SparkFun Kit" && sparkFunData.count > 0) {
                    sparkFunData = sparkFunData.filter({$0 != equipid})
                }
                else {
                }
                equipment = ""
        }
        else {
            
        }
    }
    
    //Get date month/day/year
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
    
    //Set up for UIPickerView
    //# columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //# rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if equipment == "ThinkPad Laptop" {
            pickerData = thinkPadData
        }
        else if equipment == "SparkFun Kit" {
            pickerData = sparkFunData
        }
        return pickerData.count
    }
    
    //Which data cell to pass in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    //Confirm data cell pass in selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row != 0 {
            equipid = pickerData[row]
        }
        else {
            equipid = ""
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