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
        
        self.view.backgroundColor = UIColor.green
        // Do any additional setup after loading the view.
        
        generateBackgroundStone()
        generateAllButtons()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ExitVictoryScreen() {
        
        self.dismiss(animated: true, completion: {
            let notificationName = "NSNExitGameController"
            let notification = Notification(name: Notification.Name(rawValue: notificationName), object: self, userInfo: ["toastInfo":"doge!"])
            NotificationCenter.default.post(notification)
        })
        
    }
    
    func generateBackgroundStone() {
        let stoneBackground = UIImageView(frame: self.view.frame)
        stoneBackground.image = UIImage(named: "mainMenuBackground")
        self.view.addSubview(stoneBackground)
    }
    
    func generateAllButtons() {
        let btn_01 = UIButton(frame: CGRect(x: 50,y: 30,width: 250,height: 40))
        btn_01.center.x = self.view.center.x
        btn_01.setTitle("Continue Campaign", for: UIControlState())
        btn_01.setTitleColor(UIColor.white, for: UIControlState())
        btn_01.backgroundColor = UIColor.gray
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_01)
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_01.addTarget(self, action: #selector(VictoryViewController.ExitVictoryScreen), for: .touchUpInside);
    }
}
