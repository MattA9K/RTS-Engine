//
//  MainMenuViewController.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/27/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import UIKit
import AVFoundation

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blueColor()
        // Do any additional setup after loading the view.
        
        
        generateBackgroundStone()
        generateAllButtons()
        

        
//        let scene = SKScene()
//        scene.runAction(SKAction.playSoundFileNamed("DummyMenuScreen.mp3", waitForCompletion: true))
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
        btn_01.setTitle("New Game", forState: .Normal)
        btn_01.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn_01.backgroundColor = UIColor.grayColor()
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_01)
        
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), forState: UIControlState.Normal)
        
        btn_01.addTarget(
            self, action: "openCampaignViewController", forControlEvents: .TouchUpInside);
        
        
        let btn_02 = UIButton(frame: CGRectMake(50,80,250,40))
        btn_02.center.x = self.view.center.x
        btn_02.setTitle("Map Editor", forState: .Normal)
        btn_02.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn_02.backgroundColor = UIColor.grayColor()
        btn_02.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_02)
        btn_02.enabled = false
        btn_02.alpha = 0.3
        btn_02.setBackgroundImage(UIImage(named: "wideMenuButton2"), forState: UIControlState.Normal)
//        btn_02.addTarget(
//        self, action: "switchVC_FlipHorizontal", forControlEvents: .TouchUpInside);
        
        
        let btn_03 = UIButton(frame: CGRectMake(50,130,250,40))
        btn_03.center.x = self.view.center.x
        btn_03.setTitle("Settings", forState: .Normal)
        btn_03.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn_03.backgroundColor = UIColor.grayColor()
        btn_03.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_03)
        btn_03.setBackgroundImage(UIImage(named: "wideMenuButton2"), forState: UIControlState.Normal)
        btn_03.addTarget(
            self, action: "openSettingsViewController", forControlEvents: .TouchUpInside);
    }
    
    func openCampaignViewController() {
        let vc = CampaignViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        presentViewController(vc, animated: true, completion: {
            
        })
    }
    
    func openSettingsViewController() {
        let vc = SettingsViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        presentViewController(vc, animated: true, completion: {
            
        })
    }
    
    /*
    func switchVC_FlipHorizontal() {
        let vc = SecondViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        presentViewController(vc, animated: true, completion: {
            
        })
    }
    
    func switchVC_CrossDissolve() {
        let vc = SecondViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        
        presentViewController(vc, animated: true, completion: {
            
        })
    }
    
    func switchVC_PartialCurl() {
        let vc = SecondViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
        
        presentViewController(vc, animated: true, completion: {
            
        })
    }
 */
}
