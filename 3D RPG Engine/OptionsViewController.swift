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
        
        self.view.backgroundColor = UIColor.white
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
        btn_01.setTitle("Credits", for: UIControlState())
        btn_01.setTitleColor(UIColor.white, for: UIControlState())
        btn_01.backgroundColor = UIColor.gray
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_01)
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_01.addTarget(
            self,
            action: #selector(SettingsViewController.showCredits),
            for: .touchUpInside
        );
        
        let btn_02 = UIButton(frame: CGRect(x: 50,y: 80,width: 250,height: 40))
        btn_02.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_02.center.x = self.view.center.x
        btn_02.setTitle("Return To Main Menu", for: UIControlState())
        btn_02.setTitleColor(UIColor.white, for: UIControlState())
        btn_02.backgroundColor = UIColor.gray
        btn_02.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_02)
        btn_02.addTarget(
            self,
            action: #selector(SettingsViewController.returnToMainMenu),
            for: .touchUpInside
        );
    }
    
    func returnToMainMenu() {
        self.dismiss(animated: true, completion: {
        })
    }
    
    func showCredits() {
        let alert = UIAlertController(title: AntiochAlertType.credits.Title,
                                      message: AntiochAlertType.credits.Body,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(
            UIAlertAction(
                title: AntiochAlertType.credits.AcceptButton,
                style: UIAlertActionStyle.default,
                handler: nil
            )
        )
        
        self.present(alert, animated: true, completion: nil)
    }
}
