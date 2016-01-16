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

class SecondViewController: UIViewController, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("nameList") != nil {
            
            nameList = NSUserDefaults.standardUserDefaults().objectForKey("nameList") as! [String]
            equipmentList = NSUserDefaults.standardUserDefaults().objectForKey("equipmentList") as! [String]
            dateList = NSUserDefaults.standardUserDefaults().objectForKey("dateList") as! [String]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var nameListTable: UITableView!
    @IBOutlet weak var equipmentListTable: UITableView!
    @IBOutlet weak var dateListTable: UITableView!


    
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
        else {
            cell.textLabel?.text = dateList[indexPath.row]
            return cell
        }
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            nameList.removeAtIndex(indexPath.row)
            equipmentList.removeAtIndex(indexPath.row)
            dateList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(nameList, forKey: "nameList")
                NSUserDefaults.standardUserDefaults().setObject(equipmentList, forKey: "equipmentList")
                NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
            
            nameListTable.reloadData()
            dateListTable.reloadData()
            equipmentListTable.reloadData()
            thinkpad++
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        nameListTable.reloadData()
        dateListTable.reloadData()
        equipmentListTable.reloadData()
    }
}

