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
    var SuicideButton: UIButton!
    
    var view: UIView!
    
    var HP_Bar: UITextField!
    var console: UITextView!
    
    func initFromViewController() {
        var screen = UIScreen.mainScreen().bounds
        screen.origin.x = screen.size.width * 0.8
        screen.size.width = screen.size.width * 0.2
        view = UIView(frame:screen)
        
        generateUpButton()
        generateDownButton()
        generateLeftButton()
        generateRightButton()
        generateAttackButton()
        generateSuicideButton()
        generateConsole()
        generateHP()
    }
    
    func generateHP() {
        HP_Bar = UITextField(frame: CGRectMake(50,100,50,50))
        HP_Bar.font = UIFont(name: console.font!.fontName, size: 8)
        
        HP_Bar.textColor = UIColor.greenColor()
        view.addSubview(HP_Bar)
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
    
    func generateSuicideButton() {
        SuicideButton = UIButton(frame: CGRectMake(0,0,50,50))
        SuicideButton.setTitle("💀", forState: .Normal)
        SuicideButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        SuicideButton.backgroundColor = UIColor.grayColor()
        SuicideButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(SuicideButton)
    }
    
    func disableControlsForZeroDotTwoSeconds() {
        SuicideButton.enabled = false
        AttackButton.enabled = false
        RightButton.enabled = false
        LeftButton.enabled = false
        DownButton.enabled = false
        UpButton.enabled = false
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.2);
            dispatch_async(dispatch_get_main_queue()) {
                self.SuicideButton.enabled = true
                self.AttackButton.enabled = true
                self.RightButton.enabled = true
                self.LeftButton.enabled = true
                self.DownButton.enabled = true
                self.UpButton.enabled = true
            }
        }
    }
    
    func generateConsole() {
        console = UITextView(frame: CGRectMake(0,150,(view.frame.size.width),150))
        console.text = "Hello!"
        console.font = UIFont(name: console.font!.fontName, size: 8)
        console.editable = false
        view.addSubview(console)
    }
    func printToConsole(text: String) {
//        dispatch_async(dispatch_get_main_queue()) {
//            self.console.text = self.console.text + "\n " + text
//            self.console.scrollToBotom()
//        }
    }
}

extension UITextView {
    
    func scrollToBotom() {
        let range = NSMakeRange(text.characters.count - 1, 1);
        scrollRangeToVisible(range);
    }
    
}