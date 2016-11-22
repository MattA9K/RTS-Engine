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
    
    func orderUnitToAttackMelee(angleFacing: UnitFaceAngle) {
        self.CoolingDown = true
        let pointAttackedInWorld = calculatePositionOfAttack(angleFacing: angleFacing)
        
        self.sprite.playAttackAnimation(direction: angleFacing, completionHandler: { _ in
            self.CoolingDown = false
            self.dealDamageToPointInWorld(pointAttackedInWorld)
        })
    }
    
    
    func calculatePositionOfAttack(angleFacing: UnitFaceAngle) -> CGPoint {
        switch angleFacing {
        case .up:
            return CGPoint(x: self.positionLogical.x, y: self.positionLogical.y + UnitDefaultProperty.melee.Range)
        case .down:
            return CGPoint(x: self.positionLogical.x, y: self.positionLogical.y - UnitDefaultProperty.melee.Range)
        case .left:
            return CGPoint(x: self.positionLogical.x - UnitDefaultProperty.melee.Range, y: self.positionLogical.y)
        case .right:
            return CGPoint(x: self.positionLogical.x + UnitDefaultProperty.melee.Range, y: self.positionLogical.y)
        case .ul:
            return CGPoint(x: self.positionLogical.x - UnitDefaultProperty.melee.Range, y: self.positionLogical.y + UnitDefaultProperty.melee.Range)
        case .ur:
            return CGPoint(x: self.positionLogical.x + UnitDefaultProperty.melee.Range, y: self.positionLogical.y + UnitDefaultProperty.melee.Range)
        case .dl:
            return CGPoint(x: self.positionLogical.x - UnitDefaultProperty.melee.Range, y: self.positionLogical.y - UnitDefaultProperty.melee.Range)
        case .dr:
            return CGPoint(x: self.positionLogical.x + UnitDefaultProperty.melee.Range, y: self.positionLogical.y - UnitDefaultProperty.melee.Range)
        default:
            return CGPoint(x: self.positionLogical.x, y: self.positionLogical.y)
        }
    }
    
    // -------------------------------------------------------
    
    func fireAttackMelee(_ unit: AbstractUnit) {
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
        
        printn("self position: \(currentPositionOfSelf)")
        printn("target position: \(unit.sprite.position)")
        printn("diff of X: \(differenceOfX)")
        printn("diff of Y: \(differenceOfY)")
        
        if unit.isDead == false  && self.isDead == false {
            if finishedMovingByY == true && finishedMovingByX == true {
                let targetFinder = MeleeTargetFinderNEW()
                let attackFaceDirection = targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY)
                
                self.ReferenceOfGameScene.broadcastUnitAIAttackToGameScene(
                    self,
                    attackFaceDirection
                )

                
                //                unit.addTargetToBuffer(self)
            } else {
            }
        }
    }
    
    
    // THIS SHOULD BE IN THE GAME SCENE:
    func dealDamageToPointInWorld(_ pointAttackedInWorld: CGPoint) {
        let node = ReferenceOfGameScene.atPoint(pointAttackedInWorld)
        if node is SKBlockMovementSpriteNode {
            if (node as! SKBlockMovementSpriteNode).UnitReference.isDead == false {
                ReferenceOfGameScene.ThisUnitTookDamage((node as! SKBlockMovementSpriteNode), fromUnit: self)
                (node as! SKBlockMovementSpriteNode).UnitReference.alertTheReceivingUnitItIsBeingAttacked(self)
            }
        }


    }
}



