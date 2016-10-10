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
    var bulletScale: CGFloat = 0.3
    
    var CROSSHAIR_ENABLED = false
    func debugCrossHair(_ targetLocation: CGPoint) {
        
        // ENABLE / DISABLE
        if CROSSHAIR_ENABLED == true {
            let crosshair = SKSpriteNode(imageNamed: "AttackBullet2")
            self.ReferenceOfGameScene.addChild(crosshair)
            crosshair.xScale = 2.0
            crosshair.yScale = 2.0
            crosshair.zPosition = 1000
            crosshair.position = targetLocation
            crosshair.run(SKAction.fadeOut(withDuration: 1.0))
        }

    }
    
    
    func OrderUnitToAttackRangedUP(_ targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
//        crosshair.runAction(SKAction.moveTo(targetLocation, duration: 0.1)) // REMEMBER ME PLZ!!!
        
        
        self.CoolingDown = true
        sprite.playAttackUPAnimation({_ in
            
        })
        let bullet = SKRangedBullet(imageNamed: "spearbullet-up")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.y = bullet.position.y + 50
        bullet.zPosition = 661
        ReferenceOfGameScene.addChild(bullet)
        let destination = bullet.position.y + UnitDefaultProperty.ranged.Range
        

        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit

            finalDestination.y += 100
            bullet.isHidden = true
            let delayAction = SKAction.wait(forDuration: 0.32)
            let fireBulletAction = SKAction.move(to: finalDestination, duration: 0.4)
            bullet.run(delayAction, completion: {
                bullet.isHidden = false
                bullet.run(fireBulletAction)
            })
        }

        
        
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            var count = 20
            while count > -1 {
                Thread.sleep(forTimeInterval: 0.05);
                DispatchQueue.main.async {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersects(targetunit.spriteMovementBlocker) == true && String(describing: targetunit.sprite.name) != String(describing: self.sprite.name) {
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
    
    
    func OrderUnitToAttackRangedDOWN(_ targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
        sprite.playAttackDOWNAnimation({_ in
            
        })
        self.CoolingDown = true
        let bullet = SKRangedBullet(imageNamed: "spearbullet-down")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.y = bullet.position.y - 50
        bullet.zPosition = 661
        ReferenceOfGameScene.addChild(bullet)
        let destination = (bullet.position.y - UnitDefaultProperty.ranged.Range)

        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit

            finalDestination.y -= 150
            bullet.isHidden = true
            let delayAction = SKAction.wait(forDuration: 0.32)
            let fireBulletAction = SKAction.move(to: finalDestination, duration: 0.4)
            bullet.run(delayAction, completion: {
                bullet.isHidden = false
                bullet.run(fireBulletAction)
            })
        }
        
        
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            var count = 20
            while count > -1 {
                Thread.sleep(forTimeInterval: 0.05);
                DispatchQueue.main.async {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersects(targetunit.spriteMovementBlocker) == true && String(describing: targetunit.sprite.name) != String(describing: self.sprite.name) {
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
    func OrderUnitToAttackRangedLEFT(_ targetLocation: CGPoint) {

        printgs("target location: \(targetLocation)")
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
        sprite.playAttackLEFTAnimation({_ in
            
        })
        self.CoolingDown = true
        
        let bullet = SKRangedBullet(imageNamed: "spearbullet-left")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x - 50
        bullet.zPosition = 661
        ReferenceOfGameScene.addChild(bullet)
        let destination = (bullet.position.x - UnitDefaultProperty.ranged.Range)
        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
            finalDestination.x -= 100

            bullet.isHidden = true
            let delayAction = SKAction.wait(forDuration: 0.32)
            let fireBulletAction = SKAction.move(to: finalDestination, duration: 0.4)
            bullet.run(delayAction, completion: {
                bullet.isHidden = false
                bullet.run(fireBulletAction)
            })
        }
        
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            var count = 30
            while count > -1 {
                Thread.sleep(forTimeInterval: 0.05);
                DispatchQueue.main.async {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersects(targetunit.spriteMovementBlocker) == true && String(describing: targetunit.sprite.name) != String(describing: self.sprite.name) {
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
    
    func OrderUnitToAttackRangedRIGHT(_ targetLocation: CGPoint) {
        printgs("target location: \(targetLocation)")
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
        sprite.playAttackRIGHTAnimation({_ in
            
        })
        self.CoolingDown = true
        let bullet = SKRangedBullet(imageNamed: "spearbullet-right")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x + 50
        bullet.zPosition = 661
        ReferenceOfGameScene.addChild(bullet)
        let destination = (bullet.position.x + UnitDefaultProperty.ranged.Range)
        
        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
            finalDestination.x += 100
            
            bullet.isHidden = true
            let delayAction = SKAction.wait(forDuration: 0.32)
            let fireBulletAction = SKAction.move(to: finalDestination, duration: 0.4)
            bullet.run(delayAction, completion: {
                bullet.isHidden = false
                bullet.run(fireBulletAction)
            })
        }
        
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            var count = 30
            while count > -1 {
                Thread.sleep(forTimeInterval: 0.05);
                DispatchQueue.main.async {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersects(targetunit.spriteMovementBlocker) == true && String(describing: targetunit.sprite.name) != String(describing: self.sprite.name) {
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
    
    func OrderUnitToAttackRangedUPLEFT(_ targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
        sprite.playAttackUPLEFTAnimation({_ in
            
        })
        self.CoolingDown = true
        let bullet = SKRangedBullet(imageNamed: "spearbullet-ul")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x - 50
        bullet.position.y = bullet.position.y + 50
        bullet.zPosition = 661
        ReferenceOfGameScene.addChild(bullet)
        //        var destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
//        bullet.runAction(SKAction.moveToY(targetLocation.y, duration: 0.2))

        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
            finalDestination.x -= 100
            finalDestination.y += 100
            bullet.isHidden = true
            let delayAction = SKAction.wait(forDuration: 0.32)
            let fireBulletAction = SKAction.move(to: finalDestination, duration: 0.4)
            bullet.run(delayAction, completion: {
                bullet.isHidden = false
                bullet.run(fireBulletAction)
            })
        }
        
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            var count = 30
            while count > -1 {
                Thread.sleep(forTimeInterval: 0.02);
                DispatchQueue.main.async {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersects(targetunit.spriteMovementBlocker) == true && String(describing: targetunit.sprite.name) != String(describing: self.sprite.name) {
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
    
    func OrderUnitToAttackRangedUPRIGHT(_ targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
        
        if let tl = (self.focusedTargetUnit?.sprite.position) {
            debugCrossHair(tl)
        }
        
        
        sprite.playAttackUPRIGHTAnimation({_ in
            
        })
        self.CoolingDown = true
        
        let bullet = SKRangedBullet(imageNamed: "spearbullet-ur")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x + 50
        bullet.position.y = bullet.position.y + 50
        bullet.zPosition = 661
        ReferenceOfGameScene.addChild(bullet)
        
        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
//            finalDestination.x += 100
//            finalDestination.y += 100
            bullet.isHidden = true
            let delayAction = SKAction.wait(forDuration: 0.32)
            let fireBulletAction = SKAction.move(to: finalDestination, duration: 0.2)
            bullet.run(delayAction, completion: {
                bullet.isHidden = false
                bullet.run(fireBulletAction)
            })
        }
        
        
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            var count = 30
            while count > -1 {
                Thread.sleep(forTimeInterval: 0.02);
                DispatchQueue.main.async {
                    if count > 0 {
                        
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersects(targetunit.spriteMovementBlocker) == true && String(describing: targetunit.sprite.name) != String(describing: self.sprite.name) {
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
    
    func OrderUnitToAttackRangedDOWNLEFT(_ targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
//        let targetLocation2 = (self.focusedTargetUnit?.sprite.position)!
//        debugCrossHair(targetLocation2)
        
        sprite.playAttackDOWNLEFTAnimation({_ in
            
        })
        self.CoolingDown = true
        let bullet = SKRangedBullet(imageNamed: "spearbullet-dl")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x - 25
        bullet.position.y = bullet.position.y - 25
        bullet.zPosition = 661
        ReferenceOfGameScene.addChild(bullet)
        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
            finalDestination.x -= 100
            finalDestination.y -= 100
            bullet.isHidden = true
            let delayAction = SKAction.wait(forDuration: 0.32)
            let fireBulletAction = SKAction.move(to: finalDestination, duration: 0.4)
            bullet.run(delayAction, completion: {
                bullet.isHidden = false
                bullet.run(fireBulletAction)
            })
        }
        
        
        
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            var count = 30
            while count > -1 {
                Thread.sleep(forTimeInterval: 0.02);
                DispatchQueue.main.async {
                    if count > 0 {
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersects(targetunit.spriteMovementBlocker) == true && String(describing: targetunit.sprite.name) != String(describing: self.sprite.name) {
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
    func OrderUnitToAttackRangedDOWNRIGHT(_ targetLocation: CGPoint) {
        printgs("OrderUnitToAttackRangedUPLEFT")
        
//        let targetLocation2 = (self.focusedTargetUnit?.sprite.position)!
//        debugCrossHair(targetLocation2)
        
        sprite.playAttackDOWNRIGHTAnimation({_ in
            
        })
        self.CoolingDown = true
        let bullet = SKRangedBullet(imageNamed: "spearbullet-dr")
        bullet.xScale = bulletScale
        bullet.yScale = bulletScale
        
        bullet.position = self.sprite.position
        bullet.position.x = bullet.position.x + 50
        bullet.position.y = bullet.position.y - 50
        bullet.zPosition = 661
        ReferenceOfGameScene.addChild(bullet)
        
        if let targetunit = (self.focusedTargetUnit?.sprite.position) {
            var finalDestination = targetunit
            finalDestination.x += 100
            finalDestination.y -= 100
            bullet.isHidden = true
            let delayAction = SKAction.wait(forDuration: 0.32)
            let fireBulletAction = SKAction.move(to: finalDestination, duration: 0.4)
            bullet.run(delayAction, completion: {
                bullet.isHidden = false
                bullet.run(fireBulletAction)
            })
        }
        
        
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.high).async {
            var count = 20
            while count > -1 {
                Thread.sleep(forTimeInterval: 0.05);
                DispatchQueue.main.async {
                    if count > 0 {
                        
                        if let targetunit = self.focusedTargetUnit {
                            if bullet.intersects(targetunit.spriteMovementBlocker) == true && String(describing: targetunit.sprite.name) != String(describing: self.sprite.name) {
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
    func fireAttackRanged(_ unit: AbstractUnit) {
        
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
                    ReferenceOfGameScene.run(SKAction.playSoundFileNamed("Axe.wav", waitForCompletion: true))
                }
            } else {
                
            }
        }
    }
    func dealDamageToPointInWorld(_ pointAttackedInWorld: CGPoint) {
    
    }
}



