//
//  CampaignViewController.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/27/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import UIKit

class CampaignViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red
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
        let btn_01 = UIButton(frame: CGRect(x: 50,y: 30,width: 250,height: 40))
        btn_01.center.x = self.view.center.x
        btn_01.setTitle("Prelude", for: UIControl.State())
        btn_01.setTitleColor(UIColor.white, for: UIControl.State())
        btn_01.backgroundColor = UIColor.gray
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_01)
        
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControl.State())
        btn_01.addTarget(
            self,
            action: #selector(CampaignViewController.openLevelViewController),
            for: .touchUpInside
        );
        
        
        let btn_02 = UIButton(frame: CGRect(x: 50,y: 80,width: 250,height: 40))
        btn_02.center.x = self.view.center.x
        btn_02.setTitle("Episode I (coming soon)", for: UIControl.State())
        btn_02.setTitleColor(UIColor.white, for: UIControl.State())
        btn_02.backgroundColor = UIColor.gray
        btn_02.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_02)
        btn_02.isEnabled = false
        btn_02.alpha = 0.3
        btn_02.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControl.State())
        btn_02.addTarget(
            self,
            action: "switchVC_FlipHorizontal",
            for: .touchUpInside
        );
        
        
        let btn_03 = UIButton(frame: CGRect(x: 50,y: 130,width: 250,height: 40))
        btn_03.center.x = self.view.center.x
        btn_03.setTitle("Return To Main Menu", for: UIControl.State())
        btn_03.setTitleColor(UIColor.white, for: UIControl.State())
        btn_03.backgroundColor = UIColor.gray
        btn_03.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_03)
        btn_03.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControl.State())
        btn_03.addTarget(
            self,
            action: #selector(CampaignViewController.returnToMainMenu),
            for: .touchUpInside
        );
    }
    
    @objc func openLevelViewController() {
        let campaignNumber = 1
        let vc = LevelViewController()
        vc.CampaignNumber = campaignNumber
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(vc, animated: true, completion: {
            
        })
    }
    
    @objc func returnToMainMenu() {
        self.dismiss(animated: true, completion: {
        })
    }
}
