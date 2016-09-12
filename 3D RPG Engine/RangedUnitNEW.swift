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
    
    var CoolingDown = false
    var range = 250
    var bulletScale: CGFloat = 0.4
    
    var CROSSHAIR_ENABLED = false
    func debugCrossHair(targetLocation: CGPoint) {
        
        // ENABLE / DISABLE
        if CROSSHAIR_ENABLED == true {
            let crosshair = SKSpriteNode(imageNamed: "AttackBullet2")
            self.ReferenceOfGameScene.addChild(crosshair)
            crosshair.xScale = 2.0
            crosshair.yScale = 2.0
            crosshair.zPosition = 1000
            crosshair.position = targetLocation
            crosshair.runAction(SKAction.fadeOutWithDuration(1.0))
        }

    }
    
    
    func OrderUnitToAttackRangedUP(targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
//        crosshair.runAction(SKAction.moveTo(targetLocation, duration: 0.1)) // REMEMBER ME PLZ!!!
        
        
        self.CoolingDown = true
        sprite.playAttackUPAnimation()
        let bullet = SKRangedBullet(imageNamed: "spearbullet-up")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.y = bullet.position.y + 50
        bullet.zPosition = 2661
        ReferenceOfGameScene.addChild(bullet)
        let destination = bullet.position.y + UnitDefaultProperty.Ranged.Range
        

        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit

            finalDestination.y -= 100
            bullet.hidden = true
            let delayAction = SKAction.waitForDuration(0.32)
            let fireBulletAction = SKAction.moveTo(finalDestination, duration: 0.4)
            bullet.runAction(delayAction, completion: {
                bullet.hidden = false
                bullet.runAction(fireBulletAction)
            })
        }

        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            var count = 20
            while count > -1 {
                NSThread.sleepForTimeInterval(0.05);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersectsNode(targetunit.spriteMovementBlocker) == true && String(targetunit.sprite.name) != String(self.sprite.name) {
                                let attackedUnit = targetunit.spriteMovementBlocker
                                if (attackedUnit ).UnitReference.isDead == false {
                                    if (attackedUnit ).UnitReference.teamNumber != self.teamNumber {
                                        self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit ), fromUnit: self)
                                        self.alertTheReceivingUnitItIsBeingAttacked(self)
                                        bullet.removeFromParent()
                                        count = 0
                                        self.CoolingDown = false
                                    }
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                        self.CoolingDown = false
                    }
                    count = count - 1
                }
            }
        }
    }
    
    
    func OrderUnitToAttackRangedDOWN(targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
        sprite.playAttackDOWNAnimation()
        self.CoolingDown = true
        let bullet = SKRangedBullet(imageNamed: "spearbullet-down")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.y = bullet.position.y - 50
        bullet.zPosition = 2661
        ReferenceOfGameScene.addChild(bullet)
        let destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)

        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit

            finalDestination.y -= 100
            bullet.hidden = true
            let delayAction = SKAction.waitForDuration(0.32)
            let fireBulletAction = SKAction.moveTo(finalDestination, duration: 0.4)
            bullet.runAction(delayAction, completion: {
                bullet.hidden = false
                bullet.runAction(fireBulletAction)
            })
        }
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            var count = 20
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersectsNode(targetunit.spriteMovementBlocker) == true && String(targetunit.sprite.name) != String(self.sprite.name) {
                                let attackedUnit = targetunit.spriteMovementBlocker
                                if (attackedUnit ).UnitReference.isDead == false {
                                    if (attackedUnit ).UnitReference.teamNumber != self.teamNumber {
                                        self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit ), fromUnit: self)
                                        self.alertTheReceivingUnitItIsBeingAttacked(self)
                                        bullet.removeFromParent()
                                        count = 0
                                        self.CoolingDown = false
                                    }
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                        self.CoolingDown = false
                    }
                    count = count - 1
                }
            }
        }
    }
    func OrderUnitToAttackRangedLEFT(targetLocation: CGPoint) {

        printgs("target location: \(targetLocation)")
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
        sprite.playAttackLEFTAnimation()
        self.CoolingDown = true
        
        let bullet = SKRangedBullet(imageNamed: "spearbullet-left")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x - 50
        bullet.zPosition = 2661
        ReferenceOfGameScene.addChild(bullet)
        let destination = (bullet.position.x - UnitDefaultProperty.Ranged.Range)
        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
            finalDestination.x -= 100

            bullet.hidden = true
            let delayAction = SKAction.waitForDuration(0.32)
            let fireBulletAction = SKAction.moveTo(finalDestination, duration: 0.4)
            bullet.runAction(delayAction, completion: {
                bullet.hidden = false
                bullet.runAction(fireBulletAction)
            })
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            var count = 30
            while count > -1 {
                NSThread.sleepForTimeInterval(0.05);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersectsNode(targetunit.spriteMovementBlocker) == true && String(targetunit.sprite.name) != String(self.sprite.name) {
                                let attackedUnit = targetunit.spriteMovementBlocker
                                if (attackedUnit ).UnitReference.isDead == false {
                                    if (attackedUnit ).UnitReference.teamNumber != self.teamNumber {
                                        self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit ), fromUnit: self)
                                        self.alertTheReceivingUnitItIsBeingAttacked(self)
                                        bullet.removeFromParent()
                                        count = 0
                                        self.CoolingDown = false
                                    }
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                        self.CoolingDown = false
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func OrderUnitToAttackRangedRIGHT(targetLocation: CGPoint) {
        printgs("target location: \(targetLocation)")
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
        sprite.playAttackRIGHTAnimation()
        self.CoolingDown = true
        let bullet = SKRangedBullet(imageNamed: "spearbullet-right")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x + 50
        bullet.zPosition = 2661
        ReferenceOfGameScene.addChild(bullet)
        let destination = (bullet.position.x + UnitDefaultProperty.Ranged.Range)
        
        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
            finalDestination.x += 100
            
            bullet.hidden = true
            let delayAction = SKAction.waitForDuration(0.32)
            let fireBulletAction = SKAction.moveTo(finalDestination, duration: 0.4)
            bullet.runAction(delayAction, completion: {
                bullet.hidden = false
                bullet.runAction(fireBulletAction)
            })
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            var count = 30
            while count > -1 {
                NSThread.sleepForTimeInterval(0.05);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersectsNode(targetunit.spriteMovementBlocker) == true && String(targetunit.sprite.name) != String(self.sprite.name) {
                                let attackedUnit = targetunit.spriteMovementBlocker
                                if (attackedUnit ).UnitReference.isDead == false {
                                    if (attackedUnit ).UnitReference.teamNumber != self.teamNumber {
                                        self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit ), fromUnit: self)
                                        self.alertTheReceivingUnitItIsBeingAttacked(self)
                                        bullet.removeFromParent()
                                        count = 0
                                        self.CoolingDown = false
                                    }
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                        self.CoolingDown = false
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func OrderUnitToAttackRangedUPLEFT(targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
        sprite.playAttackUPLEFTAnimation()
        self.CoolingDown = true
        let bullet = SKRangedBullet(imageNamed: "spearbullet-ul")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x - 50
        bullet.position.y = bullet.position.y + 50
        bullet.zPosition = 2661
        ReferenceOfGameScene.addChild(bullet)
        //        var destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
//        bullet.runAction(SKAction.moveToY(targetLocation.y, duration: 0.2))

        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
            finalDestination.x -= 100
            finalDestination.y += 100
            bullet.hidden = true
            let delayAction = SKAction.waitForDuration(0.32)
            let fireBulletAction = SKAction.moveTo(finalDestination, duration: 0.4)
            bullet.runAction(delayAction, completion: {
                bullet.hidden = false
                bullet.runAction(fireBulletAction)
            })
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            var count = 30
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersectsNode(targetunit.spriteMovementBlocker) == true && String(targetunit.sprite.name) != String(self.sprite.name) {
                                let attackedUnit = targetunit.spriteMovementBlocker
                                if (attackedUnit ).UnitReference.isDead == false {
                                    if (attackedUnit ).UnitReference.teamNumber != self.teamNumber {
                                        self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit ), fromUnit: self)
                                        self.alertTheReceivingUnitItIsBeingAttacked(self)
                                        bullet.removeFromParent()
                                        count = 0
                                        self.CoolingDown = false
                                    }
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                        self.CoolingDown = false
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func OrderUnitToAttackRangedUPRIGHT(targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
        
        sprite.playAttackUPRIGHTAnimation()
        self.CoolingDown = true
        
        let bullet = SKRangedBullet(imageNamed: "spearbullet-ur")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x + 50
        bullet.position.y = bullet.position.y + 50
        bullet.zPosition = 2661
        ReferenceOfGameScene.addChild(bullet)
        
        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
//            finalDestination.x += 100
//            finalDestination.y += 100
            bullet.hidden = true
            let delayAction = SKAction.waitForDuration(0.32)
            let fireBulletAction = SKAction.moveTo(finalDestination, duration: 0.2)
            bullet.runAction(delayAction, completion: {
                bullet.hidden = false
                bullet.runAction(fireBulletAction)
            })
        }
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            var count = 30
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersectsNode(targetunit.spriteMovementBlocker) == true && String(targetunit.sprite.name) != String(self.sprite.name) {
                                let attackedUnit = targetunit.spriteMovementBlocker
                                if (attackedUnit ).UnitReference.isDead == false {
                                    if (attackedUnit ).UnitReference.teamNumber != self.teamNumber {
                                        self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit ), fromUnit: self)
                                        self.alertTheReceivingUnitItIsBeingAttacked(self)
                                        bullet.removeFromParent()
                                        count = 0
                                        self.CoolingDown = false
                                    }
                                }
                            }
                        }

                    } else if count == 0 {
                        bullet.removeFromParent()
                        self.CoolingDown = false
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func OrderUnitToAttackRangedDOWNLEFT(targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
        let targetLocation2 = (self.focusedTargetUnit?.sprite.position)!
        debugCrossHair(targetLocation2)
        
        sprite.playAttackDOWNLEFTAnimation()
        self.CoolingDown = true
        let bullet = SKRangedBullet(imageNamed: "spearbullet-dl")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x - 50
        bullet.position.y = bullet.position.y - 50
        bullet.zPosition = 2661
        ReferenceOfGameScene.addChild(bullet)
        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
            finalDestination.x -= 100
            finalDestination.y -= 100
            bullet.hidden = true
            let delayAction = SKAction.waitForDuration(0.32)
            let fireBulletAction = SKAction.moveTo(finalDestination, duration: 0.4)
            bullet.runAction(delayAction, completion: {
                bullet.hidden = false
                bullet.runAction(fireBulletAction)
            })
        }
        
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            var count = 20
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersectsNode(targetunit.spriteMovementBlocker) == true && String(targetunit.sprite.name) != String(self.sprite.name) {
                                let attackedUnit = targetunit.spriteMovementBlocker
                                if (attackedUnit ).UnitReference.isDead == false {
                                    if (attackedUnit ).UnitReference.teamNumber != self.teamNumber {
                                        self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit ), fromUnit: self)
                                        self.alertTheReceivingUnitItIsBeingAttacked(self)
                                        bullet.removeFromParent()
                                        count = 0
                                        self.CoolingDown = false
                                    }
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                        self.CoolingDown = false
                    }
                    count = count - 1
                }
            }
        }
    }
    func OrderUnitToAttackRangedDOWNRIGHT(targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
        let targetLocation2 = (self.focusedTargetUnit?.sprite.position)!
        debugCrossHair(targetLocation2)
        
        sprite.playAttackDOWNRIGHTAnimation()
        self.CoolingDown = true
        let bullet = SKRangedBullet(imageNamed: "spearbullet-dr")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x + 50
        bullet.position.y = bullet.position.y - 50
        bullet.zPosition = 2661
        ReferenceOfGameScene.addChild(bullet)
        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
            finalDestination.x += 100
            finalDestination.y -= 100
            bullet.hidden = true
            let delayAction = SKAction.waitForDuration(0.32)
            let fireBulletAction = SKAction.moveTo(finalDestination, duration: 0.4)
            bullet.runAction(delayAction, completion: {
                bullet.hidden = false
                bullet.runAction(fireBulletAction)
            })
        }
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            var count = 20
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersectsNode(targetunit.spriteMovementBlocker) == true && String(targetunit.sprite.name) != String(self.sprite.name) {
                                let attackedUnit = targetunit.spriteMovementBlocker
                                if (attackedUnit ).UnitReference.isDead == false {
                                    if (attackedUnit ).UnitReference.teamNumber != self.teamNumber {
                                        self.ReferenceOfGameScene.ThisUnitTookDamage((attackedUnit ), fromUnit: self)
                                        self.alertTheReceivingUnitItIsBeingAttacked(self)
                                        bullet.removeFromParent()
                                        count = 0
                                        self.CoolingDown = false
                                    }
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                        self.CoolingDown = false
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



