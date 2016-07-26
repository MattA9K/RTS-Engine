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

        dealDamageToPointInWorld(pointAttackedInWorld)
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeUPLEFT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
            let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.y = attackY
            pointAttackedInWorld.x = attackX
            sprite.playAttackUPLEFTAnimation()
            
//            var attackedUnit = ReferenceOfGameScene!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeUPRIGHT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            
            let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
            let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.y = attackY
            pointAttackedInWorld.x = attackX
            
            sprite.playAttackUPRIGHTAnimation()
            
//            var attackedUnit = ReferenceOfGameScene!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    
    override func OrderUnitToAttackMeleeDOWN() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.y = attackY
            sprite.playAttackDOWNAnimation()
//            var attackedUnit = ReferenceOfGameScene!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeDOWNLEFT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
            let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.y = attackY
            pointAttackedInWorld.x = attackX
            sprite.playAttackDOWNLEFTAnimation()
//            var attackedUnit = ReferenceOfGameScene!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeDOWNRIGHT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
            let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.y = attackY
            pointAttackedInWorld.x = attackX
            sprite.playAttackDOWNRIGHTAnimation()
//            var attackedUnit = ReferenceOfGameScene!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    
    
    override func OrderUnitToAttackMeleeLEFT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.x = attackY
            sprite.playAttackLEFTAnimation()
//            var attackedUnit = ReferenceOfGameScene!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeRIGHT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.x = attackY
            sprite.playAttackRIGHTAnimation()
//            var attackedUnit = ReferenceOfGameScene!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
    }
    
    
    
    func dealDamageToAttackedUnit(pointAttackedInWorld: CGPoint, attackedUnit: SKNode) {
//        if let IDOfAttackedUnit = attackedUnit.name {
            //            ReferenceOfGameScene!.AllUnitsInRAM!.ThisUnitInTheSceneTookDamage(IDOfAttackedUnit)
//            ReferenceOfGameScene!.showDamagedPoint(pointAttackedInWorld)
//        }
    }
    
    func dealDamageToPointInWorld(pointAttackedInWorld: CGPoint) {
        let nodesAtAttackedPoint = ReferenceOfGameScene!.nodesAtPoint(pointAttackedInWorld)
        
        for node in nodesAtAttackedPoint {
            if node is SKBlockMovementSpriteNode {
                let name = ((node as! SKBlockMovementSpriteNode).UnitReference as BaseUnit).sprite.name
                ReferenceOfGameScene!.ThisUnitTookDamage((node as! SKBlockMovementSpriteNode))
            }
        }
        
        ReferenceOfGameScene!.showDamagedPoint(pointAttackedInWorld)
    }
    
    
    
    
    
    
    
    
    
    override func issueOrderTargetingPoint(target: CGPoint, unitOrder: UnitOrderWithNoTarget) {
        super.animateUnitToLookDamaged()
//        var unitIsInPosition = false
        let currentPositionOfSelf = sprite.position
        targetPoint = target
        //        ReferenceOfGameScene?.ControlPanel?.printToConsole("Current Position of Target: " + String(target.x))
        
        let differenceOfX = currentPositionOfSelf.x - target.x
        let differenceOfY = currentPositionOfSelf.y - target.y
        
        //        ReferenceOfGameScene?.ControlPanel?.printToConsole("Difference X: " + String(differenceOfX))
        //        ReferenceOfGameScene?.ControlPanel?.printToConsole("X diff: " + String(differenceOfX) + "/n Y diff: " + String(differenceOfY))
        
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

        }
        else if currentPositionOfSelf.x > target.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT()

        }
        else if currentPositionOfSelf.y < target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepUP()

        }
        else if currentPositionOfSelf.y > target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepDOWN()

        }
        
        
        if unitOrder == UnitOrderWithNoTarget.AttackMove {
            if finishedMovingByY == true && finishedMovingByX == true {
                let targetFinder = MeleeTargetFinder()
                targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY)
            }
        }
    }
    
    override func fireAttackMelee(unit: BaseUnit) {
        super.fireAttackMelee(unit)
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
        
//        if currentPositionOfSelf.x < unit.sprite.position.x && finishedMovingByX == false {
//            let tryMove = OrderUnitToMoveOneStepRIGHT()
//            
//        }
//        else if currentPositionOfSelf.x > unit.sprite.position.x && finishedMovingByX == false {
//            let tryMove = OrderUnitToMoveOneStepLEFT()
//            
//        }
//        else if currentPositionOfSelf.y < unit.sprite.position.y && finishedMovingByY == false {
//            let tryMove = OrderUnitToMoveOneStepUP()
//            
//            
//        }
//        else if currentPositionOfSelf.y > unit.sprite.position.y && finishedMovingByY == false {
//            let tryMove = OrderUnitToMoveOneStepDOWN()
//            
//        }
        
        if unit.isDead == false {
            
            if finishedMovingByY == true && finishedMovingByX == true {
                
                let targetFinder = MeleeTargetFinder()
                targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY)
                unit.addTargetToBuffer(self)
                
            } else {
                
            }
            
        }
    }
    
    override func issueOrderTargetingUnit(unit: BaseUnit) {
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
        

        
        if currentPositionOfSelf.x < unit.sprite.position.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepRIGHT()

            
        }
        else if currentPositionOfSelf.x > unit.sprite.position.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT()
            
        }
        else if currentPositionOfSelf.y < unit.sprite.position.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepUP()

            
        }
        else if currentPositionOfSelf.y > unit.sprite.position.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepDOWN()
            
        }
        


        if unit.isDead == false {
            
            if finishedMovingByY == true && finishedMovingByX == true {
                
                let targetFinder = MeleeTargetFinder()
                targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY)
                unit.addTargetToBuffer(self)

            } else {

            }
            
        }
    }
    
    
    //            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
    //                NSThread.sleepForTimeInterval(0.4);
    //                dispatch_async(dispatch_get_main_queue()) {
    //                    self.searchAreaForEnemyTarget()
    //                }
    //            }
    

    
}