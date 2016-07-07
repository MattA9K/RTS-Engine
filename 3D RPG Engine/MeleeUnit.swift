//
//  MeleeUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class MeleeUnit: BaseUnit {
    
    override func issueOrderTargetingPoint(target: CGPoint, unit: BaseUnit) {
        super.animateUnitToLookDamaged()
        var unitIsInPosition = false
        let currentPositionOfSelf = sprite.position
//        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Current Position of Self: " + String(currentPositionOfSelf.x))
//        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Current Position of Target: " + String(target.x))
        
        var differenceOfX = currentPositionOfSelf.x - target.x
        var differenceOfY = currentPositionOfSelf.y - target.y
        
//        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Difference X: " + String(differenceOfX))
        
        var finishedMovingByX = false
        if differenceOfX < 40 && differenceOfX > -40 {
            printToConsole("FINISHED MOVING BY X!")
            finishedMovingByX = true
        }
        
        var finishedMovingByY = false
        if differenceOfY < 60 && differenceOfY > -60 {
            finishedMovingByY = true
        }
        
        
        if currentPositionOfSelf.x < target.x && finishedMovingByX == false {
            OrderUnitToMoveOneStepRIGHT()
        } else if currentPositionOfSelf.x > target.x && finishedMovingByX == false {
            OrderUnitToMoveOneStepLEFT()
        }
            
        else if currentPositionOfSelf.y < target.y && finishedMovingByY == false {
            OrderUnitToMoveOneStepUP()
        } else if currentPositionOfSelf.y > target.y && finishedMovingByY == false {
            OrderUnitToMoveOneStepDOWN()
        }
        
        
        
        if finishedMovingByY == true && finishedMovingByX == true {
            if self.angleFacing == UnitFaceAngle.Up {
                OrderUnitToAttackMeleeUP()
            } else if self.angleFacing == UnitFaceAngle.Down {
                OrderUnitToAttackMeleeDOWN()
            } else if self.angleFacing == UnitFaceAngle.Left {
                OrderUnitToAttackMeleeLEFT()
            } else if self.angleFacing == UnitFaceAngle.Right {
                OrderUnitToAttackMeleeRIGHT()
            }
        }
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.7);
            dispatch_async(dispatch_get_main_queue()) {
                
                self.searchAreaForEnemyTarget()
                
            }
        }
    }
    
    
    
    override func OrderUnitToMoveOneStepUP() {
        let destination = sprite.position.y + UnitDefaultProperty.Movement.Range
        sprite.playWalkUPAnimation()
        sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
        angleFacing = UnitFaceAngle.Up
    }
    override func OrderUnitToMoveOneStepDOWN() {
        let destination = sprite.position.y - UnitDefaultProperty.Movement.Range
        sprite.playWalkDOWNAnimation()
        sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
        angleFacing = UnitFaceAngle.Down
    }
    override func OrderUnitToMoveOneStepLEFT() {
        let destination = sprite.position.x - UnitDefaultProperty.Movement.Range
        sprite.playWalkLEFTAnimation()
        sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
        angleFacing = UnitFaceAngle.Left
    }
    override func OrderUnitToMoveOneStepRIGHT() {
        let destination = sprite.position.x + UnitDefaultProperty.Movement.Range
        sprite.playWalkRIGHTAnimation()
        sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
        angleFacing = UnitFaceAngle.Right
    }
    
    
    func OrderUnitToAttackMeleeUP() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.y = attackY
        sprite.playAttackUPAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    func OrderUnitToAttackMeleeDOWN() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.y = attackY
        sprite.playAttackDOWNAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    func OrderUnitToAttackMeleeLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x - UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.x = attackY
        sprite.playAttackLEFTAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    func OrderUnitToAttackMeleeRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x + UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.x = attackY
        sprite.playAttackRIGHTAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    
    func dealDamageToAttackedUnit(pointAttackedInWorld: CGPoint, attackedUnit: SKNode) {
        if let IDOfAttackedUnit = attackedUnit.name {
            ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitInTheSceneTookDamage(IDOfAttackedUnit)
            ReferenceOfGameScene🔶!.showDamagedPoint(pointAttackedInWorld)
        }
    }
    
}