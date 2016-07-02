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
        
        AllUnitsInRAM!.playerSK.OrderUnitToMoveOneStepUP()
    }
    func playerDidTouchDownArrowButton(sender: UIButton!) {
        
        AllUnitsInRAM!.playerSK.OrderUnitToMoveOneStepDOWN()
    }
    func playerDidTouchLeftArrowButton(sender: UIButton!) {
        
        AllUnitsInRAM!.playerSK.OrderUnitToMoveOneStepLEFT()
    }
    func playerDidTouchRightArrowButton(sender: UIButton!) {
        
        AllUnitsInRAM!.playerSK.OrderUnitToMoveOneStepRIGHT()
    }
    
    
    
    func playerDidTouchAttackButton(sender: UIButton!) {
        
        if let allUnits = AllUnitsInRAM {
            
            let currentPlayerPosition = allUnits.playerSK.sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            
            if allUnits.playerSK.angleFacing.facingAngleString == "up" {
                
                // Get CGPoint where the player dealt damage
                let attackY = currentPlayerPosition.y + UnitDefaultProperty.Attack.Range
                pointAttackedInWorld.y = attackY
                
            } else if allUnits.playerSK.angleFacing.facingAngleString == "down" {
                
                // Get CGPoint where the player dealt damage
                let attackY = currentPlayerPosition.y - UnitDefaultProperty.Attack.Range
                pointAttackedInWorld.y = attackY
                
            } else if allUnits.playerSK.angleFacing.facingAngleString == "left" {
                
                // Get CGPoint where the player dealt damage
                let attackY = currentPlayerPosition.x - UnitDefaultProperty.Attack.Range
                pointAttackedInWorld.x = attackY
                
            } else if allUnits.playerSK.angleFacing.facingAngleString == "right" {
                
                // Get CGPoint where the player dealt damage
                let attackY = currentPlayerPosition.x + UnitDefaultProperty.Attack.Range
                pointAttackedInWorld.x = attackY
            }
            
            var attackedUnit = self.nodeAtPoint(pointAttackedInWorld)
//            print(attackedUnit)
            
//            if attackedUnit.name == "enemy" {
//                (attackedUnit as! SKGruntSprite).playDeathAnimation()
//            }
            
            allUnits.ThisUnitInTheSceneTookDamage(attackedUnit.name!)
            
            showDamagedPoint(pointAttackedInWorld)
        }

//        self.removeChildrenInArray([attackedUnit])
    }
    
    
    func showDamagedPoint(pointAttackedInWorld: CGPoint) {
        let impact = SKSpriteNode(imageNamed:"AttackBullet")
        impact.xScale = 0.5
        impact.yScale = 0.5
        impact.position = pointAttackedInWorld
        impact.userInteractionEnabled = false
        impact.name = "bullet"
        
        self.addChild(impact)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(1);
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
    }
}
