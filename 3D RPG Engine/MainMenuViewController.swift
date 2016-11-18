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
        
        self.view.backgroundColor = UIColor.blue
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
        let btn_01 = UIButton(frame: CGRect(x: 50,y: 30,width: 250,height: 40))
        btn_01.center.x = self.view.center.x
        btn_01.setTitle("New Game", for: UIControlState())
        btn_01.setTitleColor(UIColor.white, for: UIControlState())
        btn_01.backgroundColor = UIColor.gray
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_01)
        
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        
        btn_01.addTarget(
            self, action: #selector(MainMenuViewController.openCampaignViewController), for: .touchUpInside);
        
        
        let btn_02 = UIButton(frame: CGRect(x: 50,y: 80,width: 250,height: 40))
        btn_02.center.x = self.view.center.x
        btn_02.setTitle("Map Editor", for: UIControlState())
        btn_02.setTitleColor(UIColor.white, for: UIControlState())
        btn_02.backgroundColor = UIColor.gray
        btn_02.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_02)
        btn_02.isEnabled = false
        btn_02.alpha = 0.3
        btn_02.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
//        btn_02.addTarget(
//        self, action: "switchVC_FlipHorizontal", forControlEvents: .TouchUpInside);
        
        
        let btn_03 = UIButton(frame: CGRect(x: 50,y: 130,width: 250,height: 40))
        btn_03.center.x = self.view.center.x
        btn_03.setTitle("Multiplayer", for: UIControlState())
        btn_03.setTitleColor(UIColor.white, for: UIControlState())
        btn_03.backgroundColor = UIColor.gray
        btn_03.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_03)
        btn_03.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_03.addTarget(
            self, action: #selector(MainMenuViewController.openMultiplayerViewController), for: .touchUpInside);
        
        let btn_04 = UIButton(frame: CGRect(x: 50,y: 180,width: 250,height: 40))
        btn_04.center.x = self.view.center.x
        btn_04.setTitle("Settings", for: UIControlState())
        btn_04.setTitleColor(UIColor.white, for: UIControlState())
        btn_04.backgroundColor = UIColor.gray
        btn_04.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_04)
        btn_04.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_04.addTarget(
            self, action: #selector(MainMenuViewController.openSettingsViewController), for: .touchUpInside);
    }
    
    func openCampaignViewController() {
        let vc = CampaignViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(vc, animated: true, completion: {
            
        })
    }
    
    func openMultiplayerViewController() {
        let vc = MultiplayerViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(vc, animated: true, completion: {
            
        })
    }
    
    func openSettingsViewController() {
        let vc = SettingsViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        present(vc, animated: true, completion: {
            
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
