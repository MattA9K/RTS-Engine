//
//  LevelViewController.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/27/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {

    var CampaignNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blueColor()
        // Do any additional setup after loading the view.
        
        generateAllButtons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateAllButtons() {
        let btn_01 = UIButton(frame: CGRectMake(50,30,150,40))
        btn_01.center.x = self.view.center.x
        btn_01.setTitle("Act I", forState: .Normal)
        btn_01.tag = 1
        btn_01.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn_01.backgroundColor = UIColor.grayColor()
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_01)
        
        btn_01.addTarget(self, action: "openMap:", forControlEvents: .TouchUpInside);
        
        
        let btn_02 = UIButton(frame: CGRectMake(50,80,150,40))
        btn_02.center.x = self.view.center.x
        btn_02.setTitle("Act II (coming soon)", forState: .Normal)
        btn_02.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn_02.backgroundColor = UIColor.grayColor()
        btn_02.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_02)
        btn_02.enabled = false
        //        btn_02.addTarget(self, action: "switchVC_FlipHorizontal", forControlEvents: .TouchUpInside);
        
        
        let btn_03 = UIButton(frame: CGRectMake(50,130,150,40))
        btn_03.center.x = self.view.center.x
        btn_03.setTitle("Return To Main Menu", forState: .Normal)
        btn_03.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn_03.backgroundColor = UIColor.grayColor()
        btn_03.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_03)
        
        btn_03.addTarget(self, action: "returnToMainMenu", forControlEvents: .TouchUpInside);
    }
    
    func openMap(sender: UIButton!) {
        let mapNumber = sender.tag
        let vc = GameViewController()
        vc.mapNumberToLoad = mapNumber
        
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        presentViewController(vc, animated: true, completion: {
            
        })
    }
    
    func returnToMainMenu() {
        self.dismissViewControllerAnimated(true, completion: {
        })
    }
}
