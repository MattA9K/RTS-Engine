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

//        disableControlsWhilePlayerUnitIsBusy()
//        playerSK.OrderUnitToMoveOneStepUP()
        updateDebugLabel(String(describing: playerSK.sprite.position))
        anchorPoint.y -= 50.0 / self.size.height
        
        spriteControlPanel?.moveByYPositive()

    }
    func playerDidTouchDownArrowButton() {

//        disableControlsWhilePlayerUnitIsBusy()
//        playerSK.OrderUnitToMoveOneStepDOWN()
        updateDebugLabel(String(describing: playerSK.sprite.position))
        anchorPoint.y += 50.0 / self.size.height
        
        spriteControlPanel?.moveByYNegative()

    }
    func playerDidTouchLeftArrowButton() {
//        disableControlsWhilePlayerUnitIsBusy()
//        playerSK.OrderUnitToMoveOneStepLEFT()
        updateDebugLabel(String(describing: playerSK.sprite.position))
        
        spriteControlPanel?.moveByXNegative()
        anchorPoint.x += 50.0 / self.size.width
        
    }
    func playerDidTouchRightArrowButton() {
//        disableControlsWhilePlayerUnitIsBusy()
//        playerSK.OrderUnitToMoveOneStepRIGHT()
        updateDebugLabel(String(describing: playerSK.sprite.position))
        
        spriteControlPanel?.moveByXPositive()
        anchorPoint.x -= 50.0 / self.size.width
    }
    
    
    

    
    func disableControlsWhilePlayerUnitIsBusy() {
        ControlPanel!.disableControlsForZeroDotTwoSeconds()
    }
    
    func playerDidTouchAttackButton(_ sender: UIButton!) {
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
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.low).async {
            for unitUUID in self.AllUnitGUIDs {
                if self.AllUnitsInGameScene[unitUUID]!.teamNumber == self.playerSK.teamNumber &&
                    (self.AllUnitsInGameScene[unitUUID]! as! MeleeUnitNEW).CoolingDown == false && (self.AllUnitsInGameScene[unitUUID]! as! MeleeUnitNEW).isMoving == false &&
                (self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit?.isDead == false || self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit != nil) {
                    DispatchQueue.main.async {
                        if self.AllUnitsInGameScene[unitUUID]! is FootmanMercUnit && self.AllUnitsInGameScene[unitUUID]!.isDead == false {
                            if let subUnit = self.AllUnitsInGameScene[unitUUID]! as? PathfinderUnit {
                                print((subUnit as! FootmanMercUnit).nameGUI)
                                if (subUnit as! FootmanMercUnit).nameGUI == "merc_unit" {
                                    subUnit.issueOrderTargetingPoint(self.playerSK.sprite.position, completionHandler: { finalDestination in
                                        self.AllUnitsInGameScenePositions[subUnit.uuid.uuidString] = finalDestination
                                    })
                                }
                            }
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
    
    
    func showDamagedPoint(_ pointAttackedInWorld: CGPoint) {
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
    
    
    func playerDidTouchSuicideButton(_ sender: UIButton!) {
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
        
//        var Player1_Units = [AbstractUnit]()
//        for unit in AllUnitsInGameScene {
//            if unit.teamNumber == 1 {
//                Player1_Units.append(unit)
//            }
//        }
    }
    
    
    func moveUPUntilTouchEnds(_ sender: UIButton!) {
//        self.playerDidTouchUpArrowButton()
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            while sender.state == UIControlState.highlighted {
                Thread.sleep(forTimeInterval: 0.41);
                print("waiting for touchdown to end...")
//                dispatch_async(dispatch_get_main_queue()) {
                    self.playerDidTouchUpArrowButton()
//                }
            }
        }
    }
    func moveDOWNUntilTouchEnds(_ sender: UIButton!) {
//        self.playerDidTouchDownArrowButton()
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            while sender.state == UIControlState.highlighted {
                Thread.sleep(forTimeInterval: 0.41);
                print("waiting for touchdown to end...")
//                dispatch_async(dispatch_get_main_queue()) {
                    self.playerDidTouchDownArrowButton()
//                }
            }
        }
    }
    func moveLEFTUntilTouchEnds(_ sender: UIButton!) {
//        self.playerDidTouchLeftArrowButton()
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            while sender.state == UIControlState.highlighted {
                Thread.sleep(forTimeInterval: 0.41);
                print("waiting for touchdown to end...")
//                dispatch_async(dispatch_get_main_queue()) {
                    self.playerDidTouchLeftArrowButton()
//                }
            }
        }
    }
    func moveRIGHTUntilTouchEnds(_ sender: UIButton!) {
//        self.playerDidTouchRightArrowButton()
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            while sender.state == UIControlState.highlighted {
                Thread.sleep(forTimeInterval: 0.41);
                print("waiting for touchdown to end...")
//                dispatch_async(dispatch_get_main_queue()) {
                    self.playerDidTouchRightArrowButton()
//                }
            }
        }
    }
    
    

    
    func WireControlPanelToCurrentGameScene() {
        ControlPanel?.UpButton.addTarget(self,
                                         action: #selector(GameScene.moveUPUntilTouchEnds(_:)),
                                         for: .touchDown);
        
        
        ControlPanel?.DownButton.addTarget(self,
                                           action: #selector(GameScene.moveDOWNUntilTouchEnds(_:)),
                                           for: .touchDown);
        ControlPanel?.LeftButton.addTarget(self,
                                           action: #selector(GameScene.moveLEFTUntilTouchEnds(_:)),
                                           for: .touchDown);
        ControlPanel?.RightButton.addTarget(self,
                                            action: #selector(GameScene.moveRIGHTUntilTouchEnds(_:)),
                                            for: .touchDown);
        ControlPanel?.AttackButton.addTarget(self,
                                            action: #selector(GameScene.playerDidTouchAttackButton(_:)),
                                            for: .touchUpInside);
        ControlPanel?.SuicideButton.addTarget(self,
                                             action: #selector(GameScene.playerDidTouchSuicideButton(_:)),
                                             for: .touchUpInside);
        
        var GUI_Updater = Timer.scheduledTimer(
            timeInterval: 0.25, target:
            self,
            selector: #selector(GameScene.updateHP),
            userInfo: nil,
            repeats: true
        )
        allTimers.append(GUI_Updater)
    }
}
