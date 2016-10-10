//
//  LevelViewController.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/27/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import UIKit
import SpriteKit

class LevelViewController: UIViewController {

    var CampaignNumber: Int?
    
    var MainGameController: GameViewController?
    
    var currentLevel = 0
    var musicEnabled = false
    
    var musicView: SKView?
    var LevelAct = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.purple
        // Do any additional setup after loading the view.
        self.LevelAct = readStatFromDocuments("LevelAct")
        
        print(readStatFromDocuments("LevelAct"))
        print("")
        
        generateBackgroundStone()
        generateAllButtons()
        
//        let CheckIfGameControllerFinished = NSTimer.scheduledTimerWithTimeInterval(
//            2.0,
//            target: self,
//            selector: Selector("TickScenarioSceneListener"),
//            userInfo: nil,
//            repeats: true
//        );
        
        NotificationCenter.default.addObserver(self,
                                                         selector: #selector(LevelViewController.NSNTellLevelControllerToLaunchNextMap(_:)),
                                                         name: NSNotification.Name(rawValue: "NSNTellLevelControllerToLaunchNextMap"),
                                                         object: nil)
        
        NotificationCenter.default.addObserver(self,
                                                         selector: #selector(LevelViewController.NSN_Defeat(_:)),
                                                         name: NSNotification.Name(rawValue: "NSN_Defeat"),
                                                         object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        /*
         .runAction(SKAction.playSoundFileNamed("Sword\(selectedNumber).wav", waitForCompletion: true))
 */
    }
    
    func generateBackgroundStone() {
        let stoneBackground = UIImageView(frame: self.view.frame)
        stoneBackground.image = UIImage(named: "mainMenuBackground")
        self.view.addSubview(stoneBackground)
    }
    
    func DoThisOnce() {
        if musicEnabled == false {

        }

    }
    
    func generateAllButtons() {
        let btn_01 = UIButton(frame: CGRect(x: 50,y: 30,width: 250,height: 40))
        btn_01.center.x = self.view.center.x
        btn_01.setTitle("Act I", for: UIControlState())
        btn_01.tag = self.LevelAct
        btn_01.setTitleColor(UIColor.white, for: UIControlState())
        btn_01.backgroundColor = UIColor.gray
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_01)
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_01.addTarget(self, action: #selector(LevelViewController.openMap(_:)), for: .touchUpInside);
        
        
        let btn_02 = UIButton(frame: CGRect(x: 50,y: 80,width: 250,height: 40))
        btn_02.center.x = self.view.center.x
        btn_02.setTitle("Act II (coming soon)", for: UIControlState())
        btn_02.setTitleColor(UIColor.white, for: UIControlState())
        btn_02.backgroundColor = UIColor.gray
        btn_02.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_02)
        btn_02.isEnabled = false
        btn_02.alpha = 0.3
        btn_02.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        //        btn_02.addTarget(self, action: "switchVC_FlipHorizontal", forControlEvents: .TouchUpInside);
        
        
        let btn_03 = UIButton(frame: CGRect(x: 50,y: 130,width: 250,height: 40))
        btn_03.center.x = self.view.center.x
        btn_03.setTitle("Back To Campaign Menu", for: UIControlState())
        btn_03.setTitleColor(UIColor.white, for: UIControlState())
        btn_03.backgroundColor = UIColor.gray
        btn_03.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_03)
        btn_03.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_03.addTarget(self, action: #selector(LevelViewController.returnToMainMenu), for: .touchUpInside);
    }
    
    func openMap(_ sender: UIButton!) {
        let freshGameController = GameViewController()
        MainGameController = freshGameController
        let MapName = "map0\(sender.tag)"
        currentLevel = sender.tag
        print("loading map: '" + MapName + "'")
        if let vc = MainGameController {
            vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            
            
            present(vc, animated: true, completion: {
                let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(0.1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
                DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
                    vc.LoadMapPickedFromMainMenu(MapName)
                })
                
            })
        }
    }
    
    func toggleNextMapAfterVictory() {
        
        DestroyAllSpriteNodesFromCurrentGameScene()
        
        LevelAct += 1
        writeStatToDocuments("LevelAct")
        
        MainGameController = GameViewController()
        let MapName = "map0\(LevelAct)"
        print("loading map: '" + MapName + "'")
        if let vc = MainGameController {
            vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
            present(vc, animated: true, completion: {
                vc.LoadNextMapAfterVictory(MapName)
            })
        }
    }
    
    func toggleMapAfterDefeat() {
        DestroyAllSpriteNodesFromCurrentGameScene()
        
        
        MainGameController = GameViewController()
        let MapName = "map0\(LevelAct)"
        print("loading map: '" + MapName + "'")
        if let vc = MainGameController {
            vc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
            present(vc, animated: true, completion: {
                vc.LoadNextMapAfterVictory(MapName)
            })
        }
    }
    
    func DestroyAllSpriteNodesFromCurrentGameScene() {
//        MainGameController?.mainScene?.AllUnitsInGameScene
//        if let mgc = MainGameController {
//            if let mainS = mgc.mainScene {
//                for unit in mainS.AllUnitsInGameScene {
//                    unit.disposeOfSpritesAfterGameOver()
//                }
//                print123("ALL UNITS HAVE BEEN WIPED FROM THE GAME SCENE!")
//            }
//        }
    }
    
    
    func readStatFromDocuments(_ property: String) -> Int {
        let file = property + ".txt"
        var strValue: NSString = ""
        if let dir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first {
            let path = URL(fileURLWithPath: dir).appendingPathComponent(file)
            
            //reading
            do {
                strValue = try NSString(contentsOf: path, encoding: String.Encoding.utf8.rawValue)
            }
            catch {}
            
            // DEFAULT STATS
            //  (NEW GAME)
            if strValue == "" {
                if property == "LevelAct" {
                    strValue = "1"
                }
                else {
                    strValue = "1"
                }
                do {
                    try strValue.write(to: path, atomically: false, encoding: String.Encoding.utf8.rawValue)
                }
                catch {/* error handling here */}
            }
        }
        return strValue.integerValue
    }
    
    func writeStatToDocuments(_ property: String) {
        let file = property + ".txt"
        var strValue: NSString = ""
        if let dir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first {
            let path = URL(fileURLWithPath: dir).appendingPathComponent(file)
            if property == "LevelAct" {
                strValue = String(self.LevelAct) as NSString
            }
            do {
                try strValue.write(to: path, atomically: false, encoding: String.Encoding.utf8.rawValue)
            }
            catch {/* error handling here */}
        }
    }
    
    
    func NSNTellLevelControllerToLaunchNextMap(_ notification: Notification) {
        toggleNextMapAfterVictory()
    }
    
    func NSN_Defeat(_ notification: Notification) {
        toggleMapAfterDefeat()
    }
    
    func returnToMainMenu() {
        self.dismiss(animated: true, completion: {
        })
    }
}
