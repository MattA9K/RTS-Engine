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
    
    func OrderUnitToAttackMeleeUP() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
//        sprite.playAttackUPAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    func OrderUnitToAttackMeleeUPLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
//        sprite.playAttackUPLEFTAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    func OrderUnitToAttackMeleeUPRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
//        sprite.playAttackUPRIGHTAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    
    func OrderUnitToAttackMeleeDOWNLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
//        sprite.playAttackDOWNLEFTAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    func OrderUnitToAttackMeleeDOWNRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
//        sprite.playAttackDOWNRIGHTAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    func OrderUnitToAttackMeleeDOWN() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
//        sprite.playAttackDOWNAnimation()
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    
    func OrderUnitToAttackMeleeLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.x = attackY
//        sprite.playAttackLEFTAnimation() TODO
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    
    func OrderUnitToAttackMeleeRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.x = attackY
        print123(Reflection().getClassNameBasic(sprite))
//        sprite.playAttackRIGHTAnimation() TODO
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
                ReferenceOfGameScene.ThisUnitTookDamage((node as! SKBlockMovementSpriteNode))
                self.alertTheReceivingUnitItIsBeingAttacked(self)
            }
        }
        ReferenceOfGameScene.showDamagedPoint(pointAttackedInWorld)
    }
}



class MeleeTargetFinderNEW {
    
    /*
     MELEE UNIT's X AND Y POSITION DETERMINE WHICH ANGLE TO FACE WHEN ATTACKING
     
     x: -50|x:   0|x:  50
     y:  50|y:  50|y:  50
     ------|------|------
     x: -50|      |x:  50
     y:   0|      |y:   0
     ------|------|------
     x: -50|x:   0|x:  50
     y: -50|y: -50|y: -50
     
     */
    
    func faceTargetAndAttack(attacker: MeleeUnitNEW, X: CGFloat, Y: CGFloat) {
        
        //        print(X)
        //        print(Y)
        
        if X == -50 && Y == 50 {
            // FACE DOWN RIGHT
            attacker.OrderUnitToAttackMeleeDOWNRIGHT()
        } else if X == -50 && Y == 0 {
            // FACE RIGHT
            attacker.OrderUnitToAttackMeleeRIGHT()
        } else if X == -50 && Y == -50 {
            // FACE UP RIGHT
            attacker.OrderUnitToAttackMeleeUPRIGHT()
        } else if X == 0 && Y == -50 {
            // FACE UP
            attacker.OrderUnitToAttackMeleeUP()
        } else if X == 50 && Y == -50 {
            // FACE UP LEFT
            attacker.OrderUnitToAttackMeleeUPLEFT()
        } else if X == 50 && Y == 0 {
            // FACE LEFT
            attacker.OrderUnitToAttackMeleeLEFT()
        } else if X == 50 && Y == 50 {
            // FACE DOWN LEFT
            attacker.OrderUnitToAttackMeleeDOWNLEFT()
        } else if X == 0 && Y == 50 {
            // FACE DOWN
            attacker.OrderUnitToAttackMeleeDOWN()
        }
    }
    
}