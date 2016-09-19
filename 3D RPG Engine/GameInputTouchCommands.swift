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
        anchorPoint.y -= 50.0 / self.size.height
        
        spriteControlPanel?.moveByYPositive()
        print(anchorPoint.y)
    }
    func playerDidTouchDownArrowButton() {
        print("ANCHOR POINT:")
        print(anchorPoint.y)
//        disableControlsWhilePlayerUnitIsBusy()
//        playerSK.OrderUnitToMoveOneStepDOWN()
        updateDebugLabel(String(playerSK.sprite.position))
        anchorPoint.y += 50.0 / self.size.height
        
        spriteControlPanel?.moveByYNegative()
        print("ANCHOR POINT:")
        print(anchorPoint.y)
    }
    func playerDidTouchLeftArrowButton() {
//        disableControlsWhilePlayerUnitIsBusy()
//        playerSK.OrderUnitToMoveOneStepLEFT()
        updateDebugLabel(String(playerSK.sprite.position))
        
        spriteControlPanel?.moveByXNegative()
        anchorPoint.x += 50.0 / self.size.width
        
        print("game scene size: \(self.size)")
    }
    func playerDidTouchRightArrowButton() {
//        disableControlsWhilePlayerUnitIsBusy()
//        playerSK.OrderUnitToMoveOneStepRIGHT()
        updateDebugLabel(String(playerSK.sprite.position))
        
        spriteControlPanel?.moveByXPositive()
        anchorPoint.x -= 50.0 / self.size.width
    }
    
    
    

    
    func disableControlsWhilePlayerUnitIsBusy() {
        ControlPanel!.disableControlsForZeroDotTwoSeconds()
    }
    
    func playerDidTouchAttackButton(sender: UIButton!) {
        let facing = playerSK.angleFacing.facingAngleString
        
            let currentPlayerPosition = playerSK.sprite.position
            switch facing {
            case "up":
                (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeUP()
            case "down":
                (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeDOWN()
            case "left":
                (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeLEFT()
            case "right":
                (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeRIGHT()
            default:
                print("do nothing")
            }
    }
    
    func playerDidTouchNewAttackButton() {
        
        let facing = playerSK.angleFacing.facingAngleString
        let currentPlayerPosition = playerSK.sprite.position
        
        switch facing {
        case "up":
            (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeUP()
        case "down":
            (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeDOWN()
        case "left":
            (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeLEFT()
        case "right":
            (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeRIGHT()
            
        case "ul":
            (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeUPLEFT()
        case "ur":
            (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeUPRIGHT()
            
        case "dl":
            (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeDOWNLEFT()
        case "dr":
            (playerSK as! MeleeUnitNEW).OrderUnitToAttackMeleeDOWNRIGHT()
        default:
            print("do nothing")
        }
    }
    
    
    func playerDidTouchNewRallyForcesButton() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            for unit in self.AllUnitsInGameScene {
                if unit.teamNumber == self.playerSK.teamNumber {
                    dispatch_async(dispatch_get_main_queue()) {
                        if let subUnit = unit as? PathfinderUnit {
//                            subUnit.issueOrderTargetingPoint(self.playerSK.sprite.position)
                        }
                    }
                }
            }
        }
    }
    
    
    func getMapNumberInt() -> Int {
        return Int((ControlPanel?.Map_Number.text!)!)!
    }
    
    
    func updateHP() {
        ControlPanel?.HP_Bar.text = String(playerSK.HP) + "/35"
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
        
        var Player1_Units = [AbstractUnit]()
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
