//
//  ViewController.swift
//  CocoaPodsDemo
//
//  Created by SN on 15/4/21.
//  Copyright (c) 2015年 maiziedu. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {

    
    @IBAction func leftButtonClick(sender: UIBarButtonItem) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.toggleLeftDrawer(sender, animated: false)

    }
    @IBAction func rightButtonClick(sender: UIBarButtonItem) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.toggleRightDrawer(sender, animated: false)
    }
    
    
}

