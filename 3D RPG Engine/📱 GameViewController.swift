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

    override func viewDidLoad() {
        super.viewDidLoad()
        

        

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
                scene.generateUnitsFromMap("map01")
            }
        }
        
        
        
    }
    
    func WireControlPanelToGameViewController() {
        controlsPanel!.Map01Button.addTarget(self,
                                             action: "loadMap01",
                                             forControlEvents: .TouchUpInside);
        controlsPanel!.Map02Button.addTarget(self,
                                             action: "loadMap02",
                                             forControlEvents: .TouchUpInside);
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
                scene.generateUnitsFromMap("map01")
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
                scene.generateUnitsFromMap("map02")
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
