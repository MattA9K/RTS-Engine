//
//  GameInputTouchCommands.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit

extension GameScene {
    
    
    func playerDidTouchUpArrowButton() {
        print("ANCHOR POINT:")
        print(anchorPoint.y)
//        disableControlsWhilePlayerUnitIsBusy()
//        playerSK.OrderUnitToMoveOneStepUP()
        updateDebugLabel(String(playerSK.sprite.position))
        anchorPoint.y -= 0.229
        print(anchorPoint.y)
    }
    func playerDidTouchDownArrowButton() {
        print("ANCHOR POINT:")
        print(anchorPoint.y)
//        disableControlsWhilePlayerUnitIsBusy()
//        playerSK.OrderUnitToMoveOneStepDOWN()
        updateDebugLabel(String(playerSK.sprite.position))
        anchorPoint.y += 0.229
        print("ANCHOR POINT:")
        print(anchorPoint.y)
    }
    func playerDidTouchLeftArrowButton() {
//        disableControlsWhilePlayerUnitIsBusy()
//        playerSK.OrderUnitToMoveOneStepLEFT()
        updateDebugLabel(String(playerSK.sprite.position))
        anchorPoint.x += 0.229
    }
    func playerDidTouchRightArrowButton() {
//        disableControlsWhilePlayerUnitIsBusy()
//        playerSK.OrderUnitToMoveOneStepRIGHT()
        updateDebugLabel(String(playerSK.sprite.position))
        anchorPoint.x -= 0.229
    }
    
    
    

    
    func disableControlsWhilePlayerUnitIsBusy() {
        ControlPanel!.disableControlsForZeroDotTwoSeconds()
    }
    
    func playerDidTouchAttackButton(sender: UIButton!) {
        
        if let angle = playerSK.angleFacing {
            let currentPlayerPosition = playerSK.sprite.position
//            var pointAttackedInWorld = currentPlayerPosition
            switch angle.facingAngleString {
            case "up":
                (playerSK as! MeleeUnit).OrderUnitToAttackMeleeUP()
            case "down":
                (playerSK as! MeleeUnit).OrderUnitToAttackMeleeDOWN()
            case "left":
                (playerSK as! MeleeUnit).OrderUnitToAttackMeleeLEFT()
            case "right":
                (playerSK as! MeleeUnit).OrderUnitToAttackMeleeRIGHT()
            default:
                print("do nothing")
            }
        } else {
            (playerSK as! MeleeUnit).angleFacing = UnitFaceAngle.Down
            (playerSK as! MeleeUnit).OrderUnitToAttackMeleeDOWN()
        }
        
        
        
//        self.removeChildrenInArray([attackedUnit])
    }
    
    
    func getMapNumberInt() -> Int {
        return Int((ControlPanel?.Map_Number.text!)!)!
    }
    
    
    func updateHP() {
        ControlPanel?.HP_Bar.text = String(playerSK.HP!) + "/35"
    }
    
    
    func showDamagedPoint(pointAttackedInWorld: CGPoint) {
//        let impact = SKSpriteNode(imageNamed:"AttackBullet")
//        impact.xScale = 0.5
//        impact.yScale = 0.5
//        impact.zPosition = 100
//        impact.position = pointAttackedInWorld
//        impact.userInteractionEnabled = false
//        impact.name = "bullet"
//        self.addChild(impact)
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//            NSThread.sleepForTimeInterval(0.3);
//            dispatch_async(dispatch_get_main_queue()) {
//                impact.removeFromParent()
//            }
//        }
    }
    
    
    func playerDidTouchSuicideButton(sender: UIButton!) {
//        let searchArea_s3 =
//            [CGPointMake(-150, 150), CGPointMake(-100, 150),    CGPointMake(-50, 150),  CGPointMake(0, 150),  CGPointMake(50, 150), CGPointMake(100, 150), CGPointMake(150, 150),
//             CGPointMake(-150, 100),    CGPointMake(-50, 100),  CGPointMake(0, 100),  CGPointMake(50, 100), CGPointMake(100, 100), CGPointMake(150, 100),
//             CGPointMake(-150, 50),CGPointMake(-100, 50),     CGPointMake(-50, 50),   CGPointMake(0, 50),   CGPointMake(50, 50),  CGPointMake(100, 50),  CGPointMake(150, 50),
//             CGPointMake(-150, 0), CGPointMake(-100, 0),      CGPointMake(-50, 0),    CGPointMake(0, 0),    CGPointMake(50, 0),   CGPointMake(100, 0), CGPointMake(150, 0),
//             CGPointMake(-150, -50), CGPointMake(-100, -50),     CGPointMake(-50, -50),   CGPointMake(0, -50),   CGPointMake(50, -50),  CGPointMake(100, -50), CGPointMake(150, -50),
//             CGPointMake(-150, -100),CGPointMake(-100, -100),    CGPointMake(-50, -100),  CGPointMake(0, -100),  CGPointMake(50, -100), CGPointMake(100, -100), CGPointMake(150, -100),
//             CGPointMake(-150, -150), CGPointMake(-100, -150),     CGPointMake(-50, -150),   CGPointMake(0, -150),   CGPointMake(50, -150),  CGPointMake(100, -150), CGPointMake(150, -150)];
//        
//        let searchArea_s2 =
//            [CGPointMake(-100, 100),    CGPointMake(-50, 100),  CGPointMake(0, 100),  CGPointMake(50, 100), CGPointMake(100, 100),
//             CGPointMake(-100, 50),     CGPointMake(-50, 50),   CGPointMake(0, 50),   CGPointMake(50, 50),  CGPointMake(100, 50),
//             CGPointMake(-100, 0),      CGPointMake(-50, 0),    CGPointMake(0, 0),    CGPointMake(50, 0),   CGPointMake(100, 0),
//             CGPointMake(-100, -50),     CGPointMake(-50, -50),   CGPointMake(0, -50),   CGPointMake(50, -50),  CGPointMake(100, -50),
//             CGPointMake(-100, -100),    CGPointMake(-50, -100),  CGPointMake(0, -100),  CGPointMake(50, -100), CGPointMake(100, -100)];
//        
//        let searchArea_s1 =
//            [
//                CGPointMake(-50, 50),   CGPointMake(0, 50),   CGPointMake(50, 50),
//                CGPointMake(-50, 0),    CGPointMake(0, 0),    CGPointMake(50, 0),
//                CGPointMake(-50, -50),   CGPointMake(0, -50),   CGPointMake(50, -50),
//                ];
//        
//        let positionOfSearchingUnit = playerSK.sprite.position
//        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//            for pos in searchArea_s1 {
//                NSThread.sleepForTimeInterval(0.05);
//                
//                var posFinal = pos
//                posFinal.x = pos.x + positionOfSearchingUnit.x
//                posFinal.y = pos.y + positionOfSearchingUnit.y
//                
//                let spritesAtPoint = self.nodesAtPoint(posFinal)
//                
//                var targetAquired = false
//                
//                for sprite in spritesAtPoint {
//                    if spritesAtPoint.count > 1 {
//                        print("FOUND LOTS OF SPRITES!")
//                        print(spritesAtPoint)
//                    }
//                    
//                    print("nodes total: " + String(spritesAtPoint.count))
//                    if sprite is SKBlockMovementSpriteNode {
//                        targetAquired = true
//                    }
//                }
//                
//                var markerName = "SearchRadiusDummy"
//                if targetAquired == true {
//                    // markerName = "Enemy"
//                }
//                
//                let targetNode = SKSpriteNode(imageNamed: markerName)
//                
//                dispatch_async(dispatch_get_main_queue()) {
//                    targetNode.xScale = GameSettings.SpriteScale.Default
//                    targetNode.yScale = GameSettings.SpriteScale.Default
//                    targetNode.zPosition = SpritePositionZ.AliveUnit.Z + 50
//                    
//                    
//                    
//                    targetNode.position = posFinal
//                    self.addChild(targetNode)
//                }
//                NSThread.sleepForTimeInterval(0.32);
//                dispatch_async(dispatch_get_main_queue()) {
//                    targetNode.removeFromParent()
//                }
//            }
//        }
        var Player1_Units = [BaseUnit]()
        for unit in AllUnitsInGameScene {
            if unit.teamNumber == 1 {
                Player1_Units.append(unit)
            }
        }
    }
    
    
    func moveUPUntilTouchEnds(sender: UIButton!) {
//        self.playerDidTouchUpArrowButton()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while sender.state == UIControlState.Highlighted {
                NSThread.sleepForTimeInterval(0.41);
                print("waiting for touchdown to end...")
//                dispatch_async(dispatch_get_main_queue()) {
                    self.playerDidTouchUpArrowButton()
//                }
            }
        }
    }
    func moveDOWNUntilTouchEnds(sender: UIButton!) {
//        self.playerDidTouchDownArrowButton()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while sender.state == UIControlState.Highlighted {
                NSThread.sleepForTimeInterval(0.41);
                print("waiting for touchdown to end...")
//                dispatch_async(dispatch_get_main_queue()) {
                    self.playerDidTouchDownArrowButton()
//                }
            }
        }
    }
    func moveLEFTUntilTouchEnds(sender: UIButton!) {
//        self.playerDidTouchLeftArrowButton()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while sender.state == UIControlState.Highlighted {
                NSThread.sleepForTimeInterval(0.41);
                print("waiting for touchdown to end...")
//                dispatch_async(dispatch_get_main_queue()) {
                    self.playerDidTouchLeftArrowButton()
//                }
            }
        }
    }
    func moveRIGHTUntilTouchEnds(sender: UIButton!) {
//        self.playerDidTouchRightArrowButton()
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while sender.state == UIControlState.Highlighted {
                NSThread.sleepForTimeInterval(0.41);
                print("waiting for touchdown to end...")
//                dispatch_async(dispatch_get_main_queue()) {
                    self.playerDidTouchRightArrowButton()
//                }
            }
        }
    }
    
    

    
    func WireControlPanelToCurrentGameScene() {
        ControlPanel?.UpButton.addTarget(self,
                                         action: "moveUPUntilTouchEnds:",
                                         forControlEvents: .TouchDown);
        
        
        ControlPanel?.DownButton.addTarget(self,
                                           action: "moveDOWNUntilTouchEnds:",
                                           forControlEvents: .TouchDown);
        ControlPanel?.LeftButton.addTarget(self,
                                           action: "moveLEFTUntilTouchEnds:",
                                           forControlEvents: .TouchDown);
        ControlPanel?.RightButton.addTarget(self,
                                            action: "moveRIGHTUntilTouchEnds:",
                                            forControlEvents: .TouchDown);
        ControlPanel?.AttackButton.addTarget(self,
                                            action: "playerDidTouchAttackButton:",
                                            forControlEvents: .TouchUpInside);
        ControlPanel?.SuicideButton.addTarget(self,
                                             action: "playerDidTouchSuicideButton:",
                                             forControlEvents: .TouchUpInside);
        
        var GUI_Updater = NSTimer.scheduledTimerWithTimeInterval(
            0.25, target:
            self,
            selector: Selector("updateHP"),
            userInfo: nil,
            repeats: true
        )
        allTimers.append(GUI_Updater)
    }
}
