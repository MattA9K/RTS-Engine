//
//  OptionsViewController.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/27/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIAlertViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        
        generateBackgroundStone()
        generateAllButtons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateBackgroundStone() {
        let stoneBackground = UIImageView(frame: self.view.frame)
        stoneBackground.image = UIImage(named: "mainMenuBackground")
        self.view.addSubview(stoneBackground)
    }
    
    func generateAllButtons() {
        let btn_01 = UIButton(frame: CGRectMake(50,30,250,40))
        btn_01.center.x = self.view.center.x
        btn_01.setTitle("Credits", forState: .Normal)
        btn_01.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn_01.backgroundColor = UIColor.grayColor()
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_01)
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), forState: UIControlState.Normal)
        btn_01.addTarget(
            self,
            action: "showCredits",
            forControlEvents: .TouchUpInside
        );
        
        let btn_02 = UIButton(frame: CGRectMake(50,80,250,40))
        btn_02.setBackgroundImage(UIImage(named: "wideMenuButton2"), forState: UIControlState.Normal)
        btn_02.center.x = self.view.center.x
        btn_02.setTitle("Return To Main Menu", forState: .Normal)
        btn_02.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn_02.backgroundColor = UIColor.grayColor()
        btn_02.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_02)
        btn_02.addTarget(
            self,
            action: "returnToMainMenu",
            forControlEvents: .TouchUpInside
        );
    }
    
    func returnToMainMenu() {
        self.dismissViewControllerAnimated(true, completion: {
        })
    }
    
    func showCredits() {
        let alert = UIAlertController(title: AntiochAlertType.Credits.Title,
                                      message: AntiochAlertType.Credits.Body,
                                      preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(
            UIAlertAction(
                title: AntiochAlertType.Credits.AcceptButton,
                style: UIAlertActionStyle.Default,
                handler: nil
            )
        )
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
