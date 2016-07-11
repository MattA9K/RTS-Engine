//
//  MeleeUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class MeleeUnit: PathfindingUnit {
    
    
    override func OrderUnitToAttackMeleeUP() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        sprite.playAttackUPAnimation()
        
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.1);
            dispatch_async(dispatch_get_main_queue()) {
                attackedUnit.hidden = false
            }
        }
        dealDamageToPointInWorld(pointAttackedInWorld)
//        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeUPLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        sprite.playAttackUPLEFTAnimation()
        
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dealDamageToPointInWorld(pointAttackedInWorld)
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeUPRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        
        sprite.playAttackUPRIGHTAnimation()
        
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dealDamageToPointInWorld(pointAttackedInWorld)
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    
    override func OrderUnitToAttackMeleeDOWN() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        sprite.playAttackDOWNAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dealDamageToPointInWorld(pointAttackedInWorld)
//        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeDOWNLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        sprite.playAttackDOWNLEFTAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dealDamageToPointInWorld(pointAttackedInWorld)
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeDOWNRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
        let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        sprite.playAttackDOWNRIGHTAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dealDamageToPointInWorld(pointAttackedInWorld)
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    
    
    override func OrderUnitToAttackMeleeLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.x = attackY
        sprite.playAttackLEFTAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dealDamageToPointInWorld(pointAttackedInWorld)
//        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.x = attackY
        sprite.playAttackRIGHTAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dealDamageToPointInWorld(pointAttackedInWorld)
    }
    
    func dealDamageToAttackedUnit(pointAttackedInWorld: CGPoint, attackedUnit: SKNode) {
        if let IDOfAttackedUnit = attackedUnit.name {
            ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitInTheSceneTookDamage(IDOfAttackedUnit)
            ReferenceOfGameScene🔶!.showDamagedPoint(pointAttackedInWorld)
        }
    }
    
    func dealDamageToPointInWorld(pointAttackedInWorld: CGPoint) {
        let nodesAtAttackedPoint = ReferenceOfGameScene🔶!.nodesAtPoint(pointAttackedInWorld)
        
        for node in nodesAtAttackedPoint {
            if node is SKBlockMovementSpriteNode {
                let name = (node as! SKBlockMovementSpriteNode).UnitReference🔶.sprite.name
                ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitTookDamage((node as! SKBlockMovementSpriteNode))
                print("ATTACKED A UNIT!!!")
                print(name!)
            }
        }
        
        ReferenceOfGameScene🔶!.showDamagedPoint(pointAttackedInWorld)
    }
    
    
    
    
    
    
    
    
    
    override func issueOrderTargetingPoint(target: CGPoint, unitOrder: UnitOrderWithNoTarget) {
        super.animateUnitToLookDamaged()
        var unitIsInPosition = false
        let currentPositionOfSelf = sprite.position
        
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Current Position of Target: " + String(target.x))
        
        var differenceOfX = currentPositionOfSelf.x - target.x
        var differenceOfY = currentPositionOfSelf.y - target.y
        
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Difference X: " + String(differenceOfX))
        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("X diff: " + String(differenceOfX) + "/n Y diff: " + String(differenceOfY))
        
        var finishedMovingByX = false
        if differenceOfX <= 50 && differenceOfX >= -50 {
            finishedMovingByX = true
        }
        
        var finishedMovingByY = false
        if differenceOfY <= 50 && differenceOfY >= -50 {
            finishedMovingByY = true
        }
        
        
        if currentPositionOfSelf.x < target.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepRIGHT()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepUP()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepDOWN()
                }
            }
        } else if currentPositionOfSelf.x > target.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepDOWN()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepUP()
                }
            }
        }
            
        else if currentPositionOfSelf.y < target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepUP()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepLEFT()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepDOWN()
                }
            }
        } else if currentPositionOfSelf.y > target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepDOWN()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepRIGHT()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepLEFT()
                }
            }
        }
        
        
        if unitOrder == UnitOrderWithNoTarget.AttackMove {
            if finishedMovingByY == true && finishedMovingByX == true {
                let targetFinder = MeleeTargetFinder()
                targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY)
            }
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
                NSThread.sleepForTimeInterval(0.4);
                dispatch_async(dispatch_get_main_queue()) {
                    self.searchAreaForEnemyTarget()
                }
            }
        }
    }
}




/*
 
 var count: CGFloat = 0
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
 NSThread.sleepForTimeInterval(1.0);
 dispatch_async(dispatch_get_main_queue()) {
 if count < 1 {
 
 let destination = ((bullet.position.y + UnitDefaultProperty.Ranged.Range) * count) * -1
 bullet.runAction(SKAction.moveToY(destination, duration: 0.02))
 let attackedUnit = self.ReferenceOfGameScene🔶!.nodeAtPoint(bullet.position)
 if attackedUnit is SKBlockMovementSpriteNode {
 self.ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
 bullet.removeFromParent()
 }
 } else if count == 1 {
 bullet.removeFromParent()
 }
 count = count + 0.1
 }
 }
 
 */