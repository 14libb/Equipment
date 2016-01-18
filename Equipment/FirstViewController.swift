//
//  FirstViewController.swift
//  Equipment
//
//  Created by Betsy Li on 1/15/16.
//  Copyright © 2016 Appfish. All rights reserved.
//

import UIKit
//Optional problem: Add an option to edit the equipment value after submitted?

var equipment = ""
class FirstViewController: UIViewController,UITextFieldDelegate {

    //Labels for how many are left
    @IBOutlet weak var remaining1: UILabel! //ThinkPad
    @IBOutlet weak var remaining2: UILabel! //SparkFun
    
    //Buttons to select which equipment to checkout
    
    @IBAction func selectEquip1(sender: AnyObject) {
        equipment = "ThinkPad Laptop"
    }
    @IBAction func selectEquip2(sender: AnyObject) {
        equipment = "SparkFun Kit"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       remaining1.text = "\(thinkPadData.count - 1)"
       remaining2.text = "\(sparkFunData.count - 1)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}