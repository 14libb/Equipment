//
//  FirstViewController.swift
//  Equipment
//
//  Created by Betsy Li on 1/15/16.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit

var thinkpad = ["ThinkPad Laptop","ThinkPad Laptop","ThinkPad Laptop","ThinkPad Laptop"]
var sparkFun = ["SparkFun Kit","SparkFun Kit","SparkFun Kit","SparkFun Kit","SparkFun Kit","SparkFun Kit"]
var equipment = ""
class FirstViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var remaining1: UILabel!
    @IBOutlet weak var remaining2: UILabel!

    @IBAction func selectEquip1(sender: AnyObject) {
        print(equipmentList)
        equipment = "ThinkPad Laptop"
    }
    @IBAction func selectEquip2(sender: AnyObject) {
        print(equipmentList)
        equipment = "SparkFun Kit"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       remaining1.text = "\(thinkpad.count)"
       remaining2.text = "\(sparkFun.count)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}