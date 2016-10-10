//
//  UserInputControlsPanel.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/1/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import UIKit
import CoreData

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
    
    var Map_Number: UITextField!
    var HP_Bar: UITextField!
//    var console: UITextView!
    
    var LaunchMapButton: UIButton!
    var HideKeyboardButton: UIButton!
    
    func initFromViewController() {
        var screen = UIScreen.main.bounds
        screen.origin.x = screen.size.width * 0.8
        screen.size.width = screen.size.width * 0.2
        view = UIView(frame:screen)
        
        generateUpButton()
        generateDownButton()
        generateLeftButton()
        generateRightButton()
        generateAttackButton()
        generateSuicideButton()
//        generateConsole()
        generateHP()
        generateMapNumber()
        
        generateLaunchMapButton()
        generateHideKeyboardButton()
        
        generateAllLabels()
    }
    
    var lblEnemyUnitsRemaining = UILabel(frame: CGRect(x: 0,y: 250,width: 150,height: 50))
    
    var lblDebugData_01 = UILabel(frame: CGRect(x: 0,y: 300,width: 150,height: 25))
    var lblDebugData_02 = UILabel(frame: CGRect(x: 0,y: 325,width: 150,height: 25))
    var lblDebugData_03 = UILabel(frame: CGRect(x: 0,y: 350,width: 150,height: 25))
    var lblDebugData_04 = UILabel(frame: CGRect(x: 0,y: 375,width: 150,height: 25))
    
    
    func generateDebuggingButtons() {
        
    }
    
    func generateAllLabels() {
        lblEnemyUnitsRemaining.font = UIFont(name: "AvenirNext-Thin", size: 4)
        lblEnemyUnitsRemaining.adjustsFontSizeToFitWidth = true
        lblEnemyUnitsRemaining.textColor = UIColor.white
        lblEnemyUnitsRemaining.text = "Enemies Left: \(0)"
        view.addSubview(lblEnemyUnitsRemaining)
        
        lblDebugData_01.adjustsFontSizeToFitWidth = true
        lblDebugData_01.font = UIFont(name: "AvenirNext-Thin", size: 4)
        lblDebugData_01.textColor = UIColor.white
        lblDebugData_01.text = "Some useful debug info: \(1)"
        view.addSubview(lblDebugData_01)
        
        lblDebugData_02.adjustsFontSizeToFitWidth = true
        lblDebugData_02.font = UIFont(name: "AvenirNext-Thin", size: 4)
        lblDebugData_02.textColor = UIColor.white
        lblDebugData_02.text = "Some useful debug info: \(2)"
        view.addSubview(lblDebugData_02)
        
        lblDebugData_03.adjustsFontSizeToFitWidth = true
        lblDebugData_03.font = UIFont(name: "AvenirNext-Thin", size: 4)
        lblDebugData_03.textColor = UIColor.white
        lblDebugData_03.text = "Some useful debug info: \(3)"
        view.addSubview(lblDebugData_03)
        
        lblDebugData_03.adjustsFontSizeToFitWidth = true
        lblDebugData_03.font = UIFont(name: "AvenirNext-Thin", size: 4)
        lblDebugData_03.textColor = UIColor.white
        lblDebugData_03.text = "Some useful debug info: \(3)"
        view.addSubview(lblDebugData_03)
    }
    
    func generateMapNumber() {
        Map_Number = UITextField(frame: CGRect(x: 0,y: 200,width: 150,height: 50))
        Map_Number.font = UIFont(name: "AvenirNext-Thin", size: 4)
        
        Map_Number.textColor = UIColor.black
        Map_Number.backgroundColor = UIColor.white
        view.addSubview(Map_Number)
    }
    
    func generateHP() {
        HP_Bar = UITextField(frame: CGRect(x: 0,y: 150,width: 50,height: 150))
        HP_Bar.font = UIFont(name: "AvenirNext-Thin", size: 4)
        
        HP_Bar.textColor = UIColor.green
        view.addSubview(HP_Bar)
    }
    
    func generateLaunchMapButton() {
        LaunchMapButton = UIButton(frame: CGRect(x: 0,y: 100,width: 50,height: 50))
        LaunchMapButton.setTitle("🏳", for: UIControlState())
        LaunchMapButton.setTitleColor(UIColor.black, for: UIControlState())
        LaunchMapButton.backgroundColor = UIColor.gray
        LaunchMapButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(LaunchMapButton)
    }
    func generateHideKeyboardButton() {
        HideKeyboardButton = UIButton(frame: CGRect(x: 50,y: 100,width: 50,height: 50))
        HideKeyboardButton.setTitle("🗃", for: UIControlState())
        HideKeyboardButton.setTitleColor(UIColor.black, for: UIControlState())
        HideKeyboardButton.backgroundColor = UIColor.gray
        HideKeyboardButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(HideKeyboardButton)
    }
    
    func generateUpButton() {
        UpButton = UIButton(frame: CGRect(x: 50,y: 0,width: 50,height: 50))
        UpButton.setTitle("🔼", for: UIControlState())
        UpButton.setTitleColor(UIColor.black, for: UIControlState())
        UpButton.backgroundColor = UIColor.gray
        UpButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(UpButton)
    }
    
    func generateDownButton() {
        DownButton = UIButton(frame: CGRect(x: 50,y: 50,width: 50,height: 50))
        DownButton.setTitle("🔽", for: UIControlState())
        DownButton.setTitleColor(UIColor.black, for: UIControlState())
        DownButton.backgroundColor = UIColor.gray
        DownButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(DownButton)
    }
    
    func generateLeftButton() {
        LeftButton = UIButton(frame: CGRect(x: 0,y: 50,width: 50,height: 50))
        LeftButton.setTitle("◀️", for: UIControlState())
        LeftButton.setTitleColor(UIColor.black, for: UIControlState())
        LeftButton.backgroundColor = UIColor.gray
        LeftButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(LeftButton)
    }
    
    func generateRightButton() {
        RightButton = UIButton(frame: CGRect(x: 100,y: 50,width: 50,height: 50))
        RightButton.setTitle("▶️", for: UIControlState())
        RightButton.setTitleColor(UIColor.black, for: UIControlState())
        RightButton.backgroundColor = UIColor.gray
        RightButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(RightButton)
    }
    
    func generateAttackButton() {
        AttackButton = UIButton(frame: CGRect(x: 100,y: 0,width: 50,height: 50))
        AttackButton.setTitle("🗡", for: UIControlState())
        AttackButton.setTitleColor(UIColor.black, for: UIControlState())
        AttackButton.backgroundColor = UIColor.gray
        AttackButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(AttackButton)
    }
    
    func generateSuicideButton() {
        SuicideButton = UIButton(frame: CGRect(x: 0,y: 0,width: 50,height: 50))
        SuicideButton.setTitle("💀", for: UIControlState())
        SuicideButton.setTitleColor(UIColor.black, for: UIControlState())
        SuicideButton.backgroundColor = UIColor.gray
        SuicideButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(SuicideButton)
    }
    
    func disableControlsForZeroDotTwoSeconds() {
        SuicideButton.isEnabled = false
        AttackButton.isEnabled = false
        RightButton.isEnabled = false
        LeftButton.isEnabled = false
        DownButton.isEnabled = false
        UpButton.isEnabled = false
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            Thread.sleep(forTimeInterval: 0.2);
            DispatchQueue.main.async {
                self.SuicideButton.isEnabled = true
                self.AttackButton.isEnabled = true
                self.RightButton.isEnabled = true
                self.LeftButton.isEnabled = true
                self.DownButton.isEnabled = true
                self.UpButton.isEnabled = true
            }
        }
    }
}




//extension UITextView {
//
//    func scrollToBotom() {
//        let range = NSMakeRange(text.characters.count - 1, 1);
//        scrollRangeToVisible(range);
//    }
//
//}
