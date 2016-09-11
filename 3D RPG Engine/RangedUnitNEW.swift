//
//  RangedUnitNEW.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class RangedUnitNEW: PathfinderUnit, RangedCombat {
    
    var range = 250
    var bulletScale: CGFloat = 0.3
    
    func OrderUnitToAttackRangedUP(targetLocation: CGPoint) {
        sprite.playAttackUPAnimation()
        let bullet = SKRangedBullet(imageNamed: "spearbullet-up")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.y = bullet.position.y + 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene.addChild(bullet)
        let destination = bullet.position.y + UnitDefaultProperty.Ranged.Range
        bullet.runAction(SKAction.moveToY(destination, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode), fromUnit: self)
                                    self.alertTheReceivingUnitItIsBeingAttacked(self)
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    func OrderUnitToAttackRangedDOWN(targetLocation: CGPoint) {
        sprite.playAttackDOWNAnimation()
        let bullet = SKRangedBullet(imageNamed: "spearbullet-down")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.y = bullet.position.y - 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene.addChild(bullet)
        let destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToY(destination, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode), fromUnit: self)
                                    self.alertTheReceivingUnitItIsBeingAttacked(self)
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    func OrderUnitToAttackRangedLEFT(targetLocation: CGPoint) {
        printsp("SPEAR WAS THROWN")
        
        sprite.playAttackLEFTAnimation()
        let bullet = SKRangedBullet(imageNamed: "spearbullet-left")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x - 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene.addChild(bullet)
        let destination = (bullet.position.x - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToX(destination, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode), fromUnit: self)
                                    self.alertTheReceivingUnitItIsBeingAttacked(self)
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func OrderUnitToAttackRangedRIGHT(targetLocation: CGPoint) {
        sprite.playAttackRIGHTAnimation()
        let bullet = SKRangedBullet(imageNamed: "spearbullet-right")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x + 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene.addChild(bullet)
        let destination = (bullet.position.x + UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToX(destination, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode), fromUnit: self)
                                    self.alertTheReceivingUnitItIsBeingAttacked(self)
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func OrderUnitToAttackRangedUPLEFT(targetLocation: CGPoint) {
        sprite.playAttackUPLEFTAnimation()
        let bullet = SKRangedBullet(imageNamed: "spearbullet-ul")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.y = bullet.position.y - 50
        bullet.position.x = bullet.position.x + 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene.addChild(bullet)
        //        var destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToY(targetLocation.y, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode), fromUnit: self)
                                    self.alertTheReceivingUnitItIsBeingAttacked(self)
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    func OrderUnitToAttackRangedUPRIGHT(targetLocation: CGPoint) {
        sprite.playAttackUPRIGHTAnimation()
        let bullet = SKRangedBullet(imageNamed: "spearbullet-ur")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.y = bullet.position.y - 50
        bullet.position.x = bullet.position.x - 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene.addChild(bullet)
        //        var destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToY(targetLocation.y, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode), fromUnit: self)
                                    self.alertTheReceivingUnitItIsBeingAttacked(self)
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func OrderUnitToAttackRangedDOWNLEFT(targetLocation: CGPoint) {
        sprite.playAttackDOWNLEFTAnimation()
        let bullet = SKRangedBullet(imageNamed: "spearbullet-dl")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.y = bullet.position.y + 50
        bullet.position.x = bullet.position.x + 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene.addChild(bullet)
        //        var destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToY(targetLocation.y, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode), fromUnit: self)
                                    self.alertTheReceivingUnitItIsBeingAttacked(self)
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    func OrderUnitToAttackRangedDOWNRIGHT(targetLocation: CGPoint) {
        sprite.playAttackDOWNRIGHTAnimation()
        let bullet = SKRangedBullet(imageNamed: "spearbullet-dr")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.y = bullet.position.y + 50
        bullet.position.x = bullet.position.x - 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene.addChild(bullet)
        //        var destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToY(targetLocation.y, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode), fromUnit: self)
                                    self.alertTheReceivingUnitItIsBeingAttacked(self)
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    // -------------------------------------------------------
    func fireAttackRanged(unit: AbstractUnit) {
        
        let currentPositionOfSelf = sprite.position
        let differenceOfX = currentPositionOfSelf.x - unit.sprite.position.x
        let differenceOfY = currentPositionOfSelf.y - unit.sprite.position.y
        
        var finishedMovingByX = false
        if differenceOfX <= 250 && differenceOfX >= -250 {
            finishedMovingByX = true
        }
        
        var finishedMovingByY = false
        if differenceOfY <= 250 && differenceOfY >= -250 {
            finishedMovingByY = true
        }
        
        if unit.isDead == false && self.isDead == false {
            
            if finishedMovingByY == true && finishedMovingByX == true {
                let targetFinder = RangedTargetFinderNEW()
                let soundShouldPlay = targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY)
                
                if soundShouldPlay == true {
                    ReferenceOfGameScene.runAction(SKAction.playSoundFileNamed("Axe.wav", waitForCompletion: true))
                }
            } else {
                
            }
        }
    }
    func dealDamageToPointInWorld(pointAttackedInWorld: CGPoint) {
    
    }
}



class RangedTargetFinderNEW {
    
    /*
     MELEE UNIT's X AND Y POSITION DETERMINE WHICH ANGLE TO FACE WHEN ATTACKING
     
     x: 150|x: 100|x:  50|x:   0|x: -50|x:-100|x:-150|
     y:-150|y:-150|y:-150|y:-150|y:-150|y:-150|y:-150|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|x:   0|y: -50|x:-100|x:-150|
     y:-100|y:-100|y:-100|y:-100|y:-100|y:-100|y:-100|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|x:   0|x: -50|x:-100|x:-150|
     y: -50|y: -50|y: -50|y: -50|y: -50|y: -50|y: -50|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|      |x: -50|x:-100|x:-150|
     y:   0|y:   0|y:   0|      |y:   0|y:   0|y:   0|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|x:   0|x: -50|x:-100|x:-150|
     y:  50|x:  50|y:  50|y:  50|y:  50|y:  50|y:  50|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|x:   0|x: -50|x:-100|x:-150|
     y: 100|y: 100|y: 100|y: 100|y: 100|y: 100|y: 100|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|x:   0|x: -50|x:-100|x:-150|
     y: 150|y: 150|y: 150|y: 150|y: 150|y: 150|y: 150|
     
     */
    
    
    func faceTargetAndAttack(attacker: RangedUnitNEW, X: CGFloat, Y: CGFloat) -> Bool {
        
        printsp("Ranged Unit is trying to attack.")
        printsp("X:\(X) , Y:\(Y)")
        
        
        if X < 0 && Y > 0 {
            // UP LEFT
            attacker.OrderUnitToAttackRangedUPLEFT(CGPointMake(X, Y))
            return true
        }
        else if X == 0 && Y > 0 {
            // UP
            attacker.OrderUnitToAttackRangedUP(CGPointMake(X, Y))
            return true
        }
        else if X > 0 && Y > 0 {
            // UP RIGHT
//            attacker.OrderUnitToAttackRangedUPRIGHT(CGPointMake(X, Y))
            attacker.OrderUnitToAttackRangedDOWNLEFT(CGPointMake(X, Y))
            return true
        }
        else if X < 0 && Y == 0 {
            // LEFT
            attacker.OrderUnitToAttackRangedRIGHT(CGPointMake(X, Y))
            return true
        }
        else if X > 0 && Y == 0 {
            // RIGHT
            attacker.OrderUnitToAttackRangedLEFT(CGPointMake(X, Y))
            return true
        }
        else if X < 0 && Y < 0 {
            // DOWN LEFT
//            attacker.OrderUnitToAttackRangedDOWNLEFT(CGPointMake(X, Y))
            attacker.OrderUnitToAttackRangedUPRIGHT(CGPointMake(X, Y))
            return true
        }
        else if X < 0 && Y < 0 {
            // DOWN
            attacker.OrderUnitToAttackRangedDOWN(CGPointMake(X, Y))
            return true
        }
        else if X < 0 && Y < 0 {
            // DOWN RIGHT
            attacker.OrderUnitToAttackRangedDOWNRIGHT(CGPointMake(X, Y))
            return true
        }

        return false
    }
    
}