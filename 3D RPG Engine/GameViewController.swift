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
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: "NSNExitGameControllerDefeat:",
                                                         name: "NSNExitGameControllerDefeat",
                                                         object: nil)
        
        let loadingSpinner = UIActivityIndicatorView()
        loadingSpinner.startAnimating()
        loadingSpinner.frame.size.width = 300
        loadingSpinner.frame.size.height = 300
        loadingSpinner.center.x = self.view.center.x
        loadingSpinner.center.y = self.view.center.y
        loadingSpinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        self.view.addSubview(loadingSpinner)
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    
    
 
    func LoadMapPickedFromMainMenu(mapName: String!) {
        
        
        let ClientHardware = UIDevice.currentDevice().modelName as NSString
        let HardwareFormFactor = ClientHardware.substringWithRange(NSRange(location: 0, length: 4))
        
        var sceneName = ""
        
        let deviceHeight = UIScreen.mainScreen().nativeBounds.width
        let deviceWidth = UIScreen.mainScreen().nativeBounds.height
        
        print("resolution: \(deviceWidth) x \(deviceHeight)")
        
        if deviceWidth == 960 && deviceHeight == 640 {
            sceneName = "iPhone4SGameScene"
        }
        else if deviceWidth == 1136 && deviceHeight == 640 {
            sceneName = "iPhone5GameScene"
        }
        else if deviceWidth == 1334 && deviceHeight == 750 {
            sceneName = "iPhone6GameScene"
        }
        else if deviceWidth == 1920 && deviceHeight == 1080 {
            sceneName = "iPhone6PlusGameScene"
        }
        else if deviceWidth == 2048 && deviceHeight == 1536 {
            sceneName = "iPadRetinaGameScene"
        }
        else if deviceWidth == 2732 && deviceHeight == 2048 {
            sceneName = "iPadProGameScene"
        }
        
        
        if let scene = GameScene(fileNamed:sceneName) {
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
                scene.scaleMode = .AspectFill;
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
        
        let ClientHardware = UIDevice.currentDevice().modelName as NSString
        let HardwareFormFactor = ClientHardware.substringWithRange(NSRange(location: 0, length: 4))

        var sceneName = ""
        
        let deviceHeight = UIScreen.mainScreen().nativeBounds.width
        let deviceWidth = UIScreen.mainScreen().nativeBounds.height
        
        print("resolution: \(deviceWidth) x \(deviceHeight)")
        
        if deviceWidth == 960 && deviceHeight == 640 {
            sceneName = "iPhone4SGameScene"
        }
        else if deviceWidth == 1136 && deviceHeight == 640 {
            sceneName = "iPhone5GameScene"
        }
        else if deviceWidth == 1334 && deviceHeight == 750 {
            sceneName = "iPhone6GameScene"
        }
        else if deviceWidth == 1920 && deviceHeight == 1080 {
            sceneName = "iPhone6PlusGameScene"
        }
        else if deviceWidth == 2048 && deviceHeight == 1536 {
            sceneName = "iPadRetinaGameScene"
        }
        else if deviceWidth == 2732 && deviceHeight == 2048 {
            sceneName = "iPadProGameScene"
        }
        
        
        
        if let scene = GameScene(fileNamed:sceneName) {
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
    }
 
    func NSNExitGameControllerDefeat(notification: NSNotification) {
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
        self.dismissViewControllerAnimated(true, completion: {
            let notificationName = "NSN_Defeat"
            let notification = NSNotification(name: notificationName, object: self, userInfo: ["toastInfo":"doge!"])
            NSNotificationCenter.defaultCenter().postNotification(notification)
        })
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
