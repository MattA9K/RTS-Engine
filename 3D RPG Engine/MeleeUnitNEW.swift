//
//  MeleeUnitNEW.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class MeleeUnitNEW: PathfinderUnit, MeleeCombat {
    
    var range = 50
    var CoolingDown = false
    
    func OrderUnitToAttackMeleeUP() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        
        self.sprite.playAttackUPAnimation({_ in 
            
        })
        dealDamageToPointInWorld(pointAttackedInWorld)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.CoolingDown = true
            NSThread.sleepForTimeInterval(UnitData.AttackSpeedMelee());
            self.CoolingDown = false
        }
    }
    func OrderUnitToAttackMeleeUPLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.sprite.playAttackUPLEFTAnimation({_ in
            
        })
        dealDamageToPointInWorld(pointAttackedInWorld)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.CoolingDown = true
            NSThread.sleepForTimeInterval(UnitData.AttackSpeedMelee());
            self.CoolingDown = false
        }
    }
    func OrderUnitToAttackMeleeUPRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.sprite.playAttackUPRIGHTAnimation({_ in
            
        })
        dealDamageToPointInWorld(pointAttackedInWorld)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.CoolingDown = true
            NSThread.sleepForTimeInterval(UnitData.AttackSpeedMelee());
            self.CoolingDown = false
        }
    }
    
    func OrderUnitToAttackMeleeDOWNLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.sprite.playAttackDOWNLEFTAnimation({_ in
            
        })
        dealDamageToPointInWorld(pointAttackedInWorld)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.CoolingDown = true
            NSThread.sleepForTimeInterval(UnitData.AttackSpeedMelee());
            self.CoolingDown = false
        }
    }
    func OrderUnitToAttackMeleeDOWNRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.sprite.playAttackDOWNRIGHTAnimation({_ in
            
        })
        dealDamageToPointInWorld(pointAttackedInWorld)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.CoolingDown = true
            NSThread.sleepForTimeInterval(UnitData.AttackSpeedMelee());
            self.CoolingDown = false
        }
    }
    func OrderUnitToAttackMeleeDOWN() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        self.sprite.playAttackDOWNAnimation({_ in
            
        })
        dealDamageToPointInWorld(pointAttackedInWorld)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.CoolingDown = true
            NSThread.sleepForTimeInterval(UnitData.AttackSpeedMelee());
            self.CoolingDown = false
        }
    }
    
    func OrderUnitToAttackMeleeLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.x = attackY
        self.sprite.playAttackLEFTAnimation({_ in
            
        })
        dealDamageToPointInWorld(pointAttackedInWorld)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.CoolingDown = true
            NSThread.sleepForTimeInterval(UnitData.AttackSpeedMelee());
            self.CoolingDown = false
        }
    }
    
    func OrderUnitToAttackMeleeRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.x = attackY
        print123(Reflection().getClassNameBasic(sprite))
        self.sprite.playAttackRIGHTAnimation({_ in
            
        })
        
        
        dealDamageToPointInWorld(pointAttackedInWorld)
         // wait for UnitData.AttackSpeedMelee()
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.CoolingDown = true
            NSThread.sleepForTimeInterval(UnitData.AttackSpeedMelee());
            self.CoolingDown = false
        }
    }
    
    // -------------------------------------------------------
    
    func fireAttackMelee(unit: AbstractUnit) {
        let currentPositionOfSelf = sprite.position
        let differenceOfX = currentPositionOfSelf.x - unit.sprite.position.x
        let differenceOfY = currentPositionOfSelf.y - unit.sprite.position.y
        
        var finishedMovingByX = false
        if differenceOfX <= 50 && differenceOfX >= -50 {
            finishedMovingByX = true
        }
        
        var finishedMovingByY = false
        if differenceOfY <= 50 && differenceOfY >= -50 {
            finishedMovingByY = true
        }
        
        if unit.isDead == false  && self.isDead == false {
            if finishedMovingByY == true && finishedMovingByX == true {
                let targetFinder = MeleeTargetFinderNEW()
                targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY)
                //                unit.addTargetToBuffer(self)
            } else {
            }
        }
    }
    
    func dealDamageToPointInWorld(pointAttackedInWorld: CGPoint) {
        let nodesAtAttackedPoint = ReferenceOfGameScene.nodesAtPoint(pointAttackedInWorld)
        for node in nodesAtAttackedPoint {
            if node is SKBlockMovementSpriteNode {
                ReferenceOfGameScene.ThisUnitTookDamage((node as! SKBlockMovementSpriteNode), fromUnit: self)
                self.alertTheReceivingUnitItIsBeingAttacked(self)
            }
        }
        ReferenceOfGameScene.showDamagedPoint(pointAttackedInWorld)
    }
}



