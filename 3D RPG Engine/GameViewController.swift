//
//  GameViewController.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var mainView: SKView?
    var controlsPanel: UserInputControlsPanel?
    var mapNumberToLoad: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        let mapName = "map0" + String(mapNumberToLoad)
        
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let gameViewSize = CGRectMake(0, 0, self.view.frame.size.width * 0.8, view.frame.size.height)
            mainView = SKView(frame: gameViewSize)
            mainView?.scene?.size = gameViewSize.size
            
            if let view = mainView {
                view.showsFPS = true
                view.showsNodeCount = true
                
                /* Sprite Kit applies additional optimizations to improve rendering performance */
                view.ignoresSiblingOrder = true
                
                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .AspectFit
                view.presentScene(scene)
                self.view.addSubview(mainView!)
                
                // init controls panel:
                controlsPanel = UserInputControlsPanel()
                controlsPanel!.initFromViewController()
                self.view.addSubview(controlsPanel!.view)
                scene.ControlPanel = controlsPanel
                scene.WireControlPanelToCurrentGameScene()
                WireControlPanelToGameViewController()
                scene.generateUnitsAndTilesFromMap(mapName)
            }
        }
        
        
        
    }
    
    func WireControlPanelToGameViewController() {
        
        controlsPanel!.LaunchMapButton.addTarget(self,
                                             action: "loadMapFromTextViewMapNumber",
                                             forControlEvents: .TouchUpInside);
        
        controlsPanel!.HideKeyboardButton.addTarget(self,
                                             action: "hideKeyboard",
                                             forControlEvents: .TouchUpInside);
        
    }
    
    func hideKeyboard() {
        controlsPanel!.Map_Number.resignFirstResponder()
    }
    
    func loadMapFromTextViewMapNumber() {
        if let integer = Int(controlsPanel!.Map_Number.text!) {
            if integer < 6 && integer > 0 {
                
                let mapNameFull = "map0"+String(integer)
                
                if let scene = GameScene(fileNamed:"GameScene") {
                    // Configure the view.
                    let gameViewSize = CGRectMake(0, 0, self.view.frame.size.width * 0.8, view.frame.size.height)
                    mainView = SKView(frame: gameViewSize)
                    mainView?.scene?.size = gameViewSize.size
                    
                    if let view = mainView {
                        view.showsFPS = true
                        view.showsNodeCount = true
                        
                        /* Sprite Kit applies additional optimizations to improve rendering performance */
                        view.ignoresSiblingOrder = true
                        
                        /* Set the scale mode to scale to fit the window */
                        scene.scaleMode = .AspectFit
                        view.presentScene(scene)
                        self.view.addSubview(mainView!)
                        
                        // init controls panel:
                        controlsPanel = UserInputControlsPanel()
                        controlsPanel!.initFromViewController()
                        self.view.addSubview(controlsPanel!.view)
                        scene.ControlPanel = controlsPanel
                        scene.WireControlPanelToCurrentGameScene()
                        WireControlPanelToGameViewController()
                        scene.generateUnitsAndTilesFromMap(mapNameFull)
                    }
                }
            }
        }
    }
    
    func loadMap01() {
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let gameViewSize = CGRectMake(0, 0, self.view.frame.size.width * 0.8, view.frame.size.height)
            mainView = SKView(frame: gameViewSize)
            mainView?.scene?.size = gameViewSize.size
            
            if let view = mainView {
                view.showsFPS = true
                view.showsNodeCount = true
                
                /* Sprite Kit applies additional optimizations to improve rendering performance */
                view.ignoresSiblingOrder = true
                
                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .AspectFit
                view.presentScene(scene)
                self.view.addSubview(mainView!)
                
                // init controls panel:
                controlsPanel = UserInputControlsPanel()
                controlsPanel!.initFromViewController()
                self.view.addSubview(controlsPanel!.view)
                scene.ControlPanel = controlsPanel
                scene.WireControlPanelToCurrentGameScene()
                WireControlPanelToGameViewController()
                scene.generateUnitsAndTilesFromMap("map01")
            }
        }
    }
    
    func loadMap02() {
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let gameViewSize = CGRectMake(0, 0, self.view.frame.size.width * 0.8, view.frame.size.height)
            mainView = SKView(frame: gameViewSize)
            mainView?.scene?.size = gameViewSize.size
            
            if let view = mainView {
                view.showsFPS = true
                view.showsNodeCount = true
                
                /* Sprite Kit applies additional optimizations to improve rendering performance */
                view.ignoresSiblingOrder = true
                
                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .AspectFit
                view.presentScene(scene)
                self.view.addSubview(mainView!)
                
                // init controls panel:
                controlsPanel = UserInputControlsPanel()
                controlsPanel!.initFromViewController()
                self.view.addSubview(controlsPanel!.view)
                scene.ControlPanel = controlsPanel
                scene.WireControlPanelToCurrentGameScene()
                WireControlPanelToGameViewController()
                scene.generateUnitsAndTilesFromMap("map02")
            }
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
    

    
    
}
