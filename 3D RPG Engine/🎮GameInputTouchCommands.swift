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
    func playerDidTouchSuicideButton(sender: UIButton!) {
//        disableControlsWhilePlayerUnitIsBusy()
//        enemyHeroSK.searchAreaForEnemyTarget()
        for unit in enemies {
            if unit.sprite.name != "sprite_player" {
                unit.searchAreaForEnemyTarget()
            }
        }
    }
    
    func disableControlsWhilePlayerUnitIsBusy() {
        ControlPanel!.disableControlsForZeroDotTwoSeconds()
    }
    
    func playerDidTouchAttackButton(sender: UIButton!) {
        
        if let angle = playerSK.angleFacing {
            let currentPlayerPosition = playerSK.sprite.position
            var pointAttackedInWorld = currentPlayerPosition
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
    
    
    func updateHP() {
        ControlPanel?.HP_Bar.text = String(playerSK.HP!) + "/35"
    }
    
    
    func showDamagedPoint(pointAttackedInWorld: CGPoint) {
        let impact = SKSpriteNode(imageNamed:"AttackBullet")
        impact.xScale = 0.5
        impact.yScale = 0.5
        impact.zPosition = 100
        impact.position = pointAttackedInWorld
        impact.userInteractionEnabled = false
        impact.name = "bullet"
        
        self.addChild(impact)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.3);
            dispatch_async(dispatch_get_main_queue()) {
                impact.removeFromParent()
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
        ControlPanel?.UpButton.addTarget(self, action: "moveUPUntilTouchEnds:", forControlEvents: .TouchDown);
        
        
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
        
        var GUI_Updater = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: Selector("updateHP"), userInfo: nil, repeats: true)
    }
}
