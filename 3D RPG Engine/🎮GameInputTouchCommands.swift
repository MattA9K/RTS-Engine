//
//  GameInputTouchCommands.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit

extension GameScene {
    
    
    func playerDidTouchUpArrowButton(sender: UIButton!) {
        print("ANCHOR POINT:")
        print(anchorPoint.y)
        disableControlsWhilePlayerUnitIsBusy()
        playerSK.OrderUnitToMoveOneStepUP()
        updateDebugLabel(String(playerSK.sprite.position))
        anchorPoint.y -= 0.029
        print(anchorPoint.y)
    }
    func playerDidTouchDownArrowButton(sender: UIButton!) {
        print("ANCHOR POINT:")
        print(anchorPoint.y)
        disableControlsWhilePlayerUnitIsBusy()
        playerSK.OrderUnitToMoveOneStepDOWN()
        updateDebugLabel(String(playerSK.sprite.position))
        anchorPoint.y += 0.029
        print("ANCHOR POINT:")
        print(anchorPoint.y)
    }
    func playerDidTouchLeftArrowButton(sender: UIButton!) {
        disableControlsWhilePlayerUnitIsBusy()
        playerSK.OrderUnitToMoveOneStepLEFT()
        updateDebugLabel(String(playerSK.sprite.position))
        anchorPoint.x += 0.029
    }
    func playerDidTouchRightArrowButton(sender: UIButton!) {
        disableControlsWhilePlayerUnitIsBusy()
        playerSK.OrderUnitToMoveOneStepRIGHT()
        updateDebugLabel(String(playerSK.sprite.position))
        anchorPoint.x -= 0.029
    }
    func playerDidTouchSuicideButton(sender: UIButton!) {
        disableControlsWhilePlayerUnitIsBusy()
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
    
    
    func WireControlPanelToCurrentGameScene() {
        ControlPanel?.UpButton.addTarget(self,
                                         action: "playerDidTouchUpArrowButton:",
                                         forControlEvents: .TouchUpInside)
        ControlPanel?.DownButton.addTarget(self,
                                           action: "playerDidTouchDownArrowButton:",
                                           forControlEvents: .TouchUpInside)
        ControlPanel?.LeftButton.addTarget(self,
                                           action: "playerDidTouchLeftArrowButton:",
                                           forControlEvents: .TouchUpInside)
        ControlPanel?.RightButton.addTarget(self,
                                            action: "playerDidTouchRightArrowButton:",
                                            forControlEvents: .TouchUpInside)
        ControlPanel?.AttackButton.addTarget(self,
                                            action: "playerDidTouchAttackButton:",
                                            forControlEvents: .TouchUpInside)
        ControlPanel?.SuicideButton.addTarget(self,
                                             action: "playerDidTouchSuicideButton:",
                                             forControlEvents: .TouchUpInside)
    }
}
