//
//  UserInputControlsPanel.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/1/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import UIKit


class UserInputControlsPanel {
    
    // MOVEMENT
    var UpButton: UIButton!
    var DownButton: UIButton!
    var LeftButton: UIButton!
    var RightButton: UIButton!
    
    // ACTIONS
    var AttackButton: UIButton!
    
    var view: UIView!
    
    func initFromViewController() {
        var screen = UIScreen.mainScreen().bounds
        screen.origin.x = screen.size.width/2
        screen.size.width = screen.size.width/2
        view = UIView(frame:screen)
        
        generateUpButton()
        generateDownButton()
        generateLeftButton()
        generateRightButton()
        generateAttackButton()
    }
    
    func generateUpButton() {
        UpButton = UIButton(frame: CGRectMake(50,0,50,50))
        UpButton.setTitle("🔼", forState: .Normal)
        UpButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        UpButton.backgroundColor = UIColor.grayColor()
        UpButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(UpButton)
    }
    
    func generateDownButton() {
        DownButton = UIButton(frame: CGRectMake(50,50,50,50))
        DownButton.setTitle("🔽", forState: .Normal)
        DownButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        DownButton.backgroundColor = UIColor.grayColor()
        DownButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(DownButton)
    }
    
    func generateLeftButton() {
        LeftButton = UIButton(frame: CGRectMake(0,50,50,50))
        LeftButton.setTitle("◀️", forState: .Normal)
        LeftButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        LeftButton.backgroundColor = UIColor.grayColor()
        LeftButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(LeftButton)
    }
    
    func generateRightButton() {
        RightButton = UIButton(frame: CGRectMake(100,50,50,50))
        RightButton.setTitle("▶️", forState: .Normal)
        RightButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        RightButton.backgroundColor = UIColor.grayColor()
        RightButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(RightButton)
    }
    
    func generateAttackButton() {
        AttackButton = UIButton(frame: CGRectMake(100,0,50,50))
        AttackButton.setTitle("🗡", forState: .Normal)
        AttackButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        AttackButton.backgroundColor = UIColor.grayColor()
        AttackButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(AttackButton)
    }
}