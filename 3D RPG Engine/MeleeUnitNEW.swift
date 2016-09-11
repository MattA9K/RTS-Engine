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
    
    func OrderUnitToAttackMeleeUP() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        self.sprite.playAttackUPAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    func OrderUnitToAttackMeleeUPLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.sprite.playAttackUPLEFTAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    func OrderUnitToAttackMeleeUPRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.sprite.playAttackUPRIGHTAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    
    func OrderUnitToAttackMeleeDOWNLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.sprite.playAttackDOWNLEFTAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    func OrderUnitToAttackMeleeDOWNRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.sprite.playAttackDOWNRIGHTAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    func OrderUnitToAttackMeleeDOWN() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        self.sprite.playAttackDOWNAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    
    func OrderUnitToAttackMeleeLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.x = attackY
        self.sprite.playAttackLEFTAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    
    func OrderUnitToAttackMeleeRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.x = attackY
        print123(Reflection().getClassNameBasic(sprite))
        self.sprite.playAttackRIGHTAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
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



