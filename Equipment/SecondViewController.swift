//
//  SecondViewController.swift
//  Equipment
//
//  Created by Betsy Li on 1/15/16.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit

var nameList = [String]()
var equipmentList = [String]()
var dateList = [String]()
var equipidList = [String]()
var equipid = ""
class SecondViewController: UIViewController, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("nameList") != nil {
            
            nameList = NSUserDefaults.standardUserDefaults().objectForKey("nameList") as! [String]
            equipmentList = NSUserDefaults.standardUserDefaults().objectForKey("equipmentList") as! [String]
            dateList = NSUserDefaults.standardUserDefaults().objectForKey("dateList") as! [String]
            equipidList = NSUserDefaults.standardUserDefaults().objectForKey("equipidList") as! [String]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var nameListTable: UITableView!
    @IBOutlet weak var equipmentListTable: UITableView!
    @IBOutlet weak var dateListTable: UITableView!
    @IBOutlet weak var equipidListTable: UITableView!

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return nameList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
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

    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if (tableView == dateListTable) {
            return .Delete
        }
        return .None
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            if editingStyle == UITableViewCellEditingStyle.Delete{
                if equipmentList[indexPath.row] == "ThinkPad Laptop" {
                    thinkpad.append("ThinkPad Laptop")
                    thinkPadData.append(equipidList[indexPath.row])
                    thinkPadData.sortInPlace({
                        (a: String, b: String) -> Bool in Int(a) < Int(b)})
                    print(thinkPadData)
                }
                else if equipmentList[indexPath.row] == "SparkFun Kit" {
                    sparkFun.append("SparkFun Kit")
                    sparkFunData.append(equipidList[indexPath.row])
                    sparkFunData.sortInPlace({(a: String, b: String) -> Bool in Int(a) < Int(b)})
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
    
    override func viewDidAppear(animated: Bool) {
        nameListTable.reloadData()
        dateListTable.reloadData()
        equipmentListTable.reloadData()
        equipidListTable.reloadData()
    }
}

