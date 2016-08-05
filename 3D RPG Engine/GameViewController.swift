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
    
    var musicView: SKView?
    var controlsPanel: UserInputControlsPanel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: "NSNPresentVictoryController:",
                                                         name: "NSNPresentVictoryController",
                                                         object: nil)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: "NSNExitGameController:",
                                                         name: "NSNExitGameController",
                                                         object: nil)
        
        
//        var UpdateControlPanelPropertiesPeriodically = NSTimer.scheduledTimerWithTimeInterval(
//            0.55,
//            target: self,
//            selector: Selector("UpdateControlPanel"),
//            userInfo: nil,
//            repeats: true
//        )

    }
    
    
 
    func LoadMapPickedFromMainMenu(mapName: String!) {
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let gameViewSize = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
            let mainView = SKView(frame: gameViewSize);
            mainView.scene?.size = gameViewSize.size;
            
//                let musicScene = GameScene(fileNamed:"GameScene")
//                let musicViewSize = CGRectMake(0, 0, 50, 50);
//                musicView = SKView(frame: musicViewSize);
//                musicView?.scene?.size = musicViewSize.size;
//                musicView!.presentScene(musicScene);
//                self.view.addSubview(musicView!);
//                musicScene!.runAction(SKAction.playSoundFileNamed("RegularLevelMusic.mp3", waitForCompletion: true))
            
                mainView.showsFPS = true;
                mainView.showsNodeCount = true;
                
                /* Sprite Kit applies additional optimizations to improve rendering performance */
                mainView.ignoresSiblingOrder = true;
                
                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .AspectFit;
                mainView.presentScene(scene);
                self.view.addSubview(mainView);

                
                // init controls panel:
                controlsPanel = UserInputControlsPanel();
                controlsPanel!.initFromViewController();
                
//                self.view.addSubview(controlsPanel!.view);
                scene.ControlPanel = controlsPanel;
                scene.WireControlPanelToCurrentGameScene();
//                WireControlPanelToGameViewController();
                scene.generateUnitsAndTilesFromMap(mapName);
            
            
//            if let yes = musicReady {
//                // nope, do nothing.
//                
//            } else {
//                scene.runAction(SKAction.playSoundFileNamed("RegularLevelMusic.mp3", waitForCompletion: true))
//                musicReady = 1
//            }
        }
        
    }
    
    func LoadNextMapAfterVictory(mapName: String!) {
        
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let gameViewSize = CGRectMake(0, 0, self.view.frame.size.width, view.frame.size.height);
            let mainView = SKView(frame: gameViewSize);
            mainView.scene?.size = gameViewSize.size;
            
            scene.ControlPanel = controlsPanel;
            scene.WireControlPanelToCurrentGameScene();
            
//            WireControlPanelToGameViewController();
            scene.generateUnitsAndTilesFromMap(mapName);
            
            mainView.showsFPS = true;
            mainView.showsNodeCount = true;
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            mainView.ignoresSiblingOrder = true;
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFit;
            mainView.presentScene(scene);
            self.view.addSubview(mainView);
            
            
            //            if let yes = musicReady {
            //                // nope, do nothing.
            //
            //            } else {
            //                scene.runAction(SKAction.playSoundFileNamed("RegularLevelMusic.mp3", waitForCompletion: true))
            //                musicReady = 1
            //            }
        }
        
    }
    
    
    func NSNExitGameController(notification: NSNotification) {
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
        self.dismissViewControllerAnimated(true, completion: {
            let notificationName = "NSNTellLevelControllerToLaunchNextMap"
            let notification = NSNotification(
                name: notificationName,
                object: self,
                userInfo: ["toastInfo":"doge!"]
            )
            
            NSNotificationCenter.defaultCenter().postNotification(notification)
        })
        
//        LoadMapPickedFromMainMenu("map05")
    }
 
    
    func NSNPresentVictoryController(notification: NSNotification) {
        let vc = VictoryViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
        presentViewController(vc, animated: true, completion: {
            
        })
    }
 
    /*
    func WireControlPanelToGameViewController() {
        controlsPanel!.LaunchMapButton.addTarget(self,
                                             action: "returnToMainMenu",
                                             forControlEvents: .TouchUpInside);
        controlsPanel!.HideKeyboardButton.addTarget(self,
                                                    action: "loadMapFromTextViewMapNumber",
                                                    forControlEvents: .TouchUpInside);
    }
 */
    
    func returnToMainMenu() {
        let alert = UIAlertController(title: AntiochAlertType.ExitGame.Title,
                                      message: AntiochAlertType.ExitGame.Body,
                                      preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(
            UIAlertAction(
                title: AntiochAlertType.ExitGame.RejectButton,
                style: UIAlertActionStyle.Default,
                handler: nil
            )
        )
        
        alert.addAction(
            UIAlertAction(
                title: AntiochAlertType.ExitGame.AcceptButton,
                style: UIAlertActionStyle.Default,
                handler: { (alert: UIAlertAction!) in
                    
                    self.dismissViewControllerAnimated(true, completion: {
                        
                    })
                }
            )
        );
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func hideKeyboard() {
        controlsPanel!.Map_Number.resignFirstResponder()
    }
    
    
    func loadMapFromTextViewMapNumber() {
//        if let integer = Int(controlsPanel!.Map_Number.text!) {
//            if integer < 6 && integer > 0 {
//                
//                let mapNameFull = "map0"+String(integer)
//                
//                if let scene = GameScene(fileNamed:"GameScene") {
//                    // Configure the view.
//                    let gameViewSize = CGRectMake(
//                        0,
//                        0,
//                        self.view.frame.size.width * 0.8,
//                        view.frame.size.height
//                    )
//                    mainView = SKView(frame: gameViewSize)
//                    mainView?.scene?.size = gameViewSize.size
//                    
//                    if let view = mainView {
//                        view.showsFPS = true
//                        view.showsNodeCount = true
//                        
//                        /* Sprite Kit applies additional optimizations to improve rendering performance */
//                        view.ignoresSiblingOrder = true
//                        
//                        /* Set the scale mode to scale to fit the window */
//                        scene.scaleMode = .AspectFit
//                        view.presentScene(scene)
//                        self.view.addSubview(mainView!)
//                        
//                        // init controls panel:
//                        controlsPanel = UserInputControlsPanel()
//                        controlsPanel!.initFromViewController()
//                        self.view.addSubview(controlsPanel!.view)
//                        scene.ControlPanel = controlsPanel
//                        scene.WireControlPanelToCurrentGameScene()
//                        WireControlPanelToGameViewController()
//                        scene.generateUnitsAndTilesFromMap(mapNameFull)
//                    }
//                }
//            }
//        }
    }
    
    /*
    func UpdateControlPanel() {
//        _ScenarioSceneListener
        if let scene = mainScene {
            controlsPanel?.lblEnemyUnitsRemaining.text =
                "Enemy units remaining: \(scene.TotalPlayer2UnitsInGameScene)";
            
            controlsPanel?.lblDebugData_01.text = "Scenario Listener Is Stopped: \(scene._ScenarioSceneListener._Stopped)";
            
            let nodesNearPlayerUnit = scene.playerSK.sight?.intersectsNode(scene.playerSK.sprite)
            
            
            controlsPanel?.lblDebugData_02.text = "Sight Intersects Sprite: \(nodesNearPlayerUnit)"
//            controlsPanel?.lblDebugData_03
//            controlsPanel?.lblDebugData_04
        }
    }
 */

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
    
    
    
//    func loadMap01() {
//        if let scene = GameScene(fileNamed:"GameScene") {
//            // Configure the view.
//            let gameViewSize = CGRectMake(0, 0, self.view.frame.size.width * 0.8, view.frame.size.height)
//            mainView = SKView(frame: gameViewSize)
//            mainView?.scene?.size = gameViewSize.size
//            
//            if let view = mainView {
//                view.showsFPS = true
//                view.showsNodeCount = true
//                
//                /* Sprite Kit applies additional optimizations to improve rendering performance */
//                view.ignoresSiblingOrder = true
//                
//                /* Set the scale mode to scale to fit the window */
//                scene.scaleMode = .AspectFit
//                view.presentScene(scene)
//                self.view.addSubview(mainView!)
//                
//                // init controls panel:
//                controlsPanel = UserInputControlsPanel()
//                controlsPanel!.initFromViewController()
//                self.view.addSubview(controlsPanel!.view)
//                scene.ControlPanel = controlsPanel
//                scene.WireControlPanelToCurrentGameScene()
//                WireControlPanelToGameViewController()
//                scene.generateUnitsAndTilesFromMap("map01")
//            }
//        }
//    }
//    func loadMap02() {
//        if let scene = GameScene(fileNamed:"GameScene") {
//            // Configure the view.
//            let gameViewSize = CGRectMake(0, 0, self.view.frame.size.width * 0.8, view.frame.size.height)
//            mainView = SKView(frame: gameViewSize)
//            mainView?.scene?.size = gameViewSize.size
//            
//            if let view = mainView {
//                view.showsFPS = true
//                view.showsNodeCount = true
//                
//                /* Sprite Kit applies additional optimizations to improve rendering performance */
//                view.ignoresSiblingOrder = true
//                
//                /* Set the scale mode to scale to fit the window */
//                scene.scaleMode = .AspectFit
//                view.presentScene(scene)
//                self.view.addSubview(mainView!)
//                
//                // init controls panel:
//                controlsPanel = UserInputControlsPanel()
//                controlsPanel!.initFromViewController()
//                self.view.addSubview(controlsPanel!.view)
//                scene.ControlPanel = controlsPanel
//                scene.WireControlPanelToCurrentGameScene()
//                WireControlPanelToGameViewController()
//                scene.generateUnitsAndTilesFromMap("map02")
//            }
//        }
//    }
    

    deinit {
        printRAM("A VIEWCONTROLLER HAS BEEN DEALLOCATED !!!")
        printRAM("This is a redundancy...")
    }
    
}
