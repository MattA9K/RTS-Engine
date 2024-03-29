//
//  ViewController.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/17/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import UIKit

class MultiplayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
        btn_01.setTitle("Host Game", for: UIControl.State())
        btn_01.setTitleColor(UIColor.white, for: UIControl.State())
        btn_01.backgroundColor = UIColor.gray
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_01)
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControl.State())
        btn_01.addTarget(
            self,
            action: #selector(MultiplayerViewController.openHostGameViewController),
            for: .touchUpInside
        );
        
        let btn_02 = UIButton(frame: CGRect(x: 50,y: 80,width: 250,height: 40))
        btn_02.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControl.State())
        btn_02.center.x = self.view.center.x
        btn_02.setTitle("Join Game", for: UIControl.State())
        btn_02.setTitleColor(UIColor.white, for: UIControl.State())
        btn_02.backgroundColor = UIColor.gray
        btn_02.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_02)
        btn_02.addTarget(
            self,
            action: #selector(MultiplayerViewController.openJoinGameViewController),
            for: .touchUpInside
        );
        
        let btn_03 = UIButton(frame: CGRect(x: 50,y: 180,width: 250,height: 40))
        btn_03.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControl.State())
        btn_03.center.x = self.view.center.x
        btn_03.setTitle("Return To Main Menu", for: UIControl.State())
        btn_03.setTitleColor(UIColor.white, for: UIControl.State())
        btn_03.backgroundColor = UIColor.gray
        btn_03.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_03)
        btn_03.addTarget(
            self,
            action: #selector(MultiplayerViewController.returnToMainMenu),
            for: .touchUpInside
        );
    }
    
    
    @objc func returnToMainMenu() {
        self.dismiss(animated: true, completion: {
        })
    }
    
    
    @objc func openHostGameViewController() {
        let vc = HostGameViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(vc, animated: true, completion: {
            (vc ).gameLobbyNameAlert()

        })
    }
    
    
    @objc func openJoinGameViewController() {
        let vc = ListGameLobbyViewController() //JoinGameViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(vc, animated: true, completion: {
            
        })
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
