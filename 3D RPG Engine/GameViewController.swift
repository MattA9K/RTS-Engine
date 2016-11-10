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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NotificationCenter.default.addObserver(self,
                                                         selector: #selector(GameViewController.NSNPresentVictoryController(_:)),
                                                         name: NSNotification.Name(rawValue: "NSNPresentVictoryController"),
                                                         object: nil)
        
        
        NotificationCenter.default.addObserver(self,
                                                         selector: #selector(GameViewController.NSNExitGameController(_:)),
                                                         name: NSNotification.Name(rawValue: "NSNExitGameController"),
                                                         object: nil)
        NotificationCenter.default.addObserver(self,
                                                         selector: #selector(GameViewController.NSNExitGameControllerDefeat(_:)),
                                                         name: NSNotification.Name(rawValue: "NSNExitGameControllerDefeat"),
                                                         object: nil)
        
        let loadingSpinner = UIActivityIndicatorView()
        loadingSpinner.startAnimating()
        loadingSpinner.frame.size.width = 300
        loadingSpinner.frame.size.height = 300
        loadingSpinner.center.x = self.view.center.x
        loadingSpinner.center.y = self.view.center.y
        loadingSpinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        self.view.addSubview(loadingSpinner)
        self.view.backgroundColor = UIColor.black
    }
    
    
    
 
    func LoadMapPickedFromMainMenu(_ mapName: String!) {
        
        let ClientHardware = UIDevice.current.modelName as NSString
        let HardwareFormFactor = ClientHardware.substring(with: NSRange(location: 0, length: 4))
        
        var sceneName = ""
        
        let deviceHeight = UIScreen.main.nativeBounds.width
        let deviceWidth = UIScreen.main.nativeBounds.height
        
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
            let gameViewSize = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height);
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
                scene.scaleMode = .aspectFill;
                mainView.presentScene(scene);
                self.view.addSubview(mainView);

                
                // init controls panel:

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
    
    func LoadNextMapAfterVictory(_ mapName: String!) {
        
        let ClientHardware = UIDevice.current.modelName as NSString
        let HardwareFormFactor = ClientHardware.substring(with: NSRange(location: 0, length: 4))

        var sceneName = ""
        
        let deviceHeight = UIScreen.main.nativeBounds.width
        let deviceWidth = UIScreen.main.nativeBounds.height
        
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
            let gameViewSize = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: view.frame.size.height);
            let mainView = SKView(frame: gameViewSize);
            mainView.scene?.size = gameViewSize.size;
            
            
//            WireControlPanelToGameViewController();
            scene.generateUnitsAndTilesFromMap(mapName);
            
            mainView.showsFPS = true;
            mainView.showsNodeCount = true;
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            mainView.ignoresSiblingOrder = true;
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFit;
            mainView.presentScene(scene);
            self.view.addSubview(mainView);
            
            
        }
        
    }
    
    
    func NSNExitGameController(_ notification: Notification) {
        
        NotificationCenter.default.removeObserver(self)
        
        self.dismiss(animated: true, completion: {
            let notificationName = "NSNTellLevelControllerToLaunchNextMap"
            let notification = Notification(
                name: Notification.Name(rawValue: notificationName),
                object: self,
                userInfo: ["toastInfo":"doge!"]
            )
            
            NotificationCenter.default.post(notification)
        })
    }
 
    func NSNExitGameControllerDefeat(_ notification: Notification) {
        
        NotificationCenter.default.removeObserver(self)
        
        self.dismiss(animated: true, completion: {
            let notificationName = "NSN_Defeat"
            let notification = Notification(name: Notification.Name(rawValue: notificationName), object: self, userInfo: ["toastInfo":"doge!"])
            NotificationCenter.default.post(notification)
        })
    }
    
    func NSNPresentVictoryController(_ notification: Notification) {
        let vc = VictoryViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        present(vc, animated: true, completion: {
            
        })
    }
 

    
    func returnToMainMenu() {
        let alert = UIAlertController(title: AntiochAlertType.exitGame.Title,
                                      message: AntiochAlertType.exitGame.Body,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(
            UIAlertAction(
                title: AntiochAlertType.exitGame.RejectButton,
                style: UIAlertActionStyle.default,
                handler: nil
            )
        )
        
        alert.addAction(
            UIAlertAction(
                title: AntiochAlertType.exitGame.AcceptButton,
                style: UIAlertActionStyle.default,
                handler: { (alert: UIAlertAction!) in
                    
                    self.dismiss(animated: true, completion: {
                        
                    })
                }
            )
        );
        
        self.present(alert, animated: true, completion: nil)
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
    

    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
    

    deinit {
        printRAM("A VIEWCONTROLLER HAS BEEN DEALLOCATED !!!")
        printRAM("This is a redundancy...")
    }
    
}
