//
//  VictoryViewController.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/27/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import UIKit

class VictoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.greenColor()
        // Do any additional setup after loading the view.
        
        generateAllButtons()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ExitVictoryScreen() {
        
        self.dismissViewControllerAnimated(true, completion: {
            let notificationName = "NSNExitGameController"
            let notification = NSNotification(name: notificationName, object: self, userInfo: ["toastInfo":"doge!"])
            NSNotificationCenter.defaultCenter().postNotification(notification)
        })
        
    }
    
    func generateAllButtons() {
        let btn_01 = UIButton(frame: CGRectMake(50,30,250,40))
        btn_01.center.x = self.view.center.x
        btn_01.setTitle("Continue Campaign", forState: .Normal)
        btn_01.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn_01.backgroundColor = UIColor.grayColor()
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_01)
        
        btn_01.addTarget(self, action: "ExitVictoryScreen", forControlEvents: .TouchUpInside);
    }
}
