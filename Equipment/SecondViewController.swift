//
//  SecondViewController.swift
//  Equipment
//
//  Created by Betsy Li on 1/15/16.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit

//2D History array
var nameHistory = [String]()
var netidHistory = [String]()
var equipmentHistory = [String]()
var dateHistory = [String]()
var equipidHistory = [String]()
var returnHistory = [String]()

//Current Inventory arrays
var nameList = [String]()
var equipmentList = [String]()
var dateList = [String]()
var equipidList = [String]()
var equipid = ""

class SecondViewController: UIViewController, UITableViewDelegate {
   
    //Retreive data saved to device and load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("nameList") != nil {
            
            nameList = NSUserDefaults.standardUserDefaults().objectForKey("nameList") as! [String]
            equipmentList = NSUserDefaults.standardUserDefaults().objectForKey("equipmentList") as! [String]
            dateList = NSUserDefaults.standardUserDefaults().objectForKey("dateList") as! [String]
            equipidList = NSUserDefaults.standardUserDefaults().objectForKey("equipidList") as! [String]
        }
        for index in equipmentList {
            if (index == "ThinkPad Laptop") {
                thinkPadData = thinkPadData.filter({$0 != (equipidList[equipmentList.indexOf(index)!])})
            }
            if (index == "SparkFun Kit") {
                sparkFunData = sparkFunData.filter({$0 != (equipidList[equipmentList.indexOf(index)!])})
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Text input fields for submit form
    
    @IBOutlet weak var nameListTable: UITableView!
    @IBOutlet weak var equipmentListTable: UITableView!
    @IBOutlet weak var dateListTable: UITableView!
    @IBOutlet weak var equipidListTable: UITableView!

    //Table set up and input data into cells
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return nameList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel!.font = UIFont.systemFontOfSize(7.5)
        if (tableView == nameListTable) {
            cell.textLabel?.text = nameList[indexPath.row]
            return cell
        }
        else if (tableView == equipmentListTable){
            cell.textLabel?.text = equipmentList[indexPath.row]
            return cell
        }
        else if (tableView == equipidListTable){
            cell.textLabel?.text = equipidList[indexPath.row]
            return cell
        }
        else {
            cell.textLabel?.text = dateList[indexPath.row]
            return cell
        }
    }
    
    //Only allow the delete option to appear for the date column
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if (tableView == dateListTable) {
            return .Delete
        }
        return .None
    }
    
    //When deleted, update inventory lists and reload data
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            if equipmentList[indexPath.row] == "ThinkPad Laptop" {
                thinkPadData.append(equipidList[indexPath.row])
                thinkPadData.sortInPlace({
                    (a: String, b: String) -> Bool in Int(a) < Int(b)})
                returnHistory.insert(getCurrentTime(), atIndex:indexPath.row)
            }
            else if equipmentList[indexPath.row] == "SparkFun Kit" {
                sparkFunData.append(equipidList[indexPath.row])
                sparkFunData.sortInPlace({(a: String, b: String) -> Bool in Int(a) < Int(b)})
                returnHistory.insert(getCurrentTime(), atIndex:indexPath.row)
            }
            
            nameList.removeAtIndex(indexPath.row)
            equipmentList.removeAtIndex(indexPath.row)
            dateList.removeAtIndex(indexPath.row)
            equipidList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(nameList, forKey: "nameList")
            NSUserDefaults.standardUserDefaults().setObject(equipmentList, forKey: "equipmentList")
            NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
            NSUserDefaults.standardUserDefaults().setObject(equipidList, forKey: "equipidList")
            
            nameListTable.reloadData()
            dateListTable.reloadData()
            equipmentListTable.reloadData()
            equipidListTable.reloadData()
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
    
    //Load data
    override func viewDidAppear(animated: Bool) {
        nameListTable.reloadData()
        dateListTable.reloadData()
        equipmentListTable.reloadData()
        equipidListTable.reloadData()
    }
}
