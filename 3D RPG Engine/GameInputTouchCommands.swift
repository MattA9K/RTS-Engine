//
//  GameInputTouchCommands.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit

extension GameScene {
    
    
    func sendTouchInputToProcessor(selectedNodeID: String, selectedSKNode: SKNode) {
        // MOVE THE PLAYER
        switch selectedNodeID {
        case "up-arrow":
            playerDidTouchUpArrowButton()
        case "down-arrow":
            playerDidTouchDownArrowButton()
        case "left-arrow":
            playerDidTouchLeftArrowButton()
        case "right-arrow":
            playerDidTouchRightArrowButton()
        case "attack":
            playerDidTouchAttackButton()
        default:
            doNothing()
        }
    }
    
    
    func playerDidTouchUpArrowButton(sender: UIButton!) {
        let destination = playerSK.sprite.position.y + UnitDefaultProperty.Movement.Range
        playerSK.sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
        playerSK.angleFacing = UnitFaceAngle.Up
    }
    func playerDidTouchDownArrowButton(sender: UIButton!) {
        let destination = playerSK.sprite.position.y - UnitDefaultProperty.Movement.Range
        playerSK.sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
        playerSK.angleFacing = UnitFaceAngle.Down
    }
    func playerDidTouchLeftArrowButton(sender: UIButton!) {
        let destination = playerSK.sprite.position.x - UnitDefaultProperty.Movement.Range
        playerSK.sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
        playerSK.angleFacing = UnitFaceAngle.Left
    }
    func playerDidTouchRightArrowButton(sender: UIButton!) {
        let destination = playerSK.sprite.position.x + UnitDefaultProperty.Movement.Range
        playerSK.sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
        playerSK.angleFacing = UnitFaceAngle.Right
    }
    
    
    
    func playerDidTouchAttackButton() {
        
        let currentPlayerPosition = playerSK.sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        
        if playerSK.angleFacing.facingAngleString == "up" {
            
            // Get CGPoint where the player dealt damage
            let attackY = currentPlayerPosition.y + UnitDefaultProperty.Attack.Range
            pointAttackedInWorld.y = attackY
            
        } else if playerSK.angleFacing.facingAngleString == "down" {
            
            // Get CGPoint where the player dealt damage
            let attackY = currentPlayerPosition.y - UnitDefaultProperty.Attack.Range
            pointAttackedInWorld.y = attackY
            
        } else if playerSK.angleFacing.facingAngleString == "left" {
            
            // Get CGPoint where the player dealt damage
            let attackY = currentPlayerPosition.x - UnitDefaultProperty.Attack.Range
            pointAttackedInWorld.x = attackY
            
        } else if playerSK.angleFacing.facingAngleString == "right" {
            
            // Get CGPoint where the player dealt damage
            let attackY = currentPlayerPosition.x + UnitDefaultProperty.Attack.Range
            pointAttackedInWorld.x = attackY
        }
        
        var attackedUnit = self.nodeAtPoint(pointAttackedInWorld)
        print(attackedUnit)
        
        if attackedUnit.name == "enemy" {
            (attackedUnit as! SKGruntSprite).playDeathAnimation()
        }
        
        
        showDamagedPoint(pointAttackedInWorld)
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
    
    
    func doNothing() {
        
    }
    
    func WireControlPanelToCurrentGameScene() {
        ControlPanel?.UpButton.addTarget(self,
                                         action: "playerDidTouchUpArrowButton",
                                         forControlEvents: .TouchUpInside)
        ControlPanel?.DownButton.addTarget(self,
                                           action: "playerDidTouchDownArrowButton",
                                           forControlEvents: .TouchUpInside)
        ControlPanel?.LeftButton.addTarget(self,
                                           action: "playerDidTouchLeftArrowButton",
                                           forControlEvents: .TouchUpInside)
        ControlPanel?.RightButton.addTarget(self,
                                            action: "playerDidTouchRightArrowButton",
                                            forControlEvents: .TouchUpInside)
    }
}
