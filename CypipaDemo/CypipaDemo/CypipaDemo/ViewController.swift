//
//  ViewController.swift
//  CypipaDemo
//
//  Created by shoya on 10/17/16.
//  Copyright © 2016 Shoya Shiraki. All rights reserved.
//

import UIKit
import Cypipa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Cypipa.getPublicIP { (ipAddress) in
            print("Your public IP Address: " + ipAddress)
        }
        
        Cypipa.containsPublicIP(checkTargetIPAdressList: ["127.0.0.1", "192.128.1.213"]) { (exist) in
            if exist {
                print("exist")
            } else {
                print("not exist")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

