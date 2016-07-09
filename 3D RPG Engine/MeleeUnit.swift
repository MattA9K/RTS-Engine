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
    
    override func issueOrderTargetingPoint(target: CGPoint, unitOrder: UnitOrderWithNoTarget) {
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
        if differenceOfY < 55 && differenceOfY > -55 {
            finishedMovingByY = true
        }
        
        
        if currentPositionOfSelf.x < target.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepRIGHT()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepUP()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepLEFT()
                }
            }
        } else if currentPositionOfSelf.x > target.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepRIGHT()
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
    }
    
    
    
    override func OrderUnitToMoveOneStepUP() -> Bool {
        updateMovementBlockerPosition()
        let destination = sprite.position.y + UnitDefaultProperty.Movement.Range
        var pointDestination = sprite.position
        pointDestination.y = destination

        if thereIsAnObstacleInTheWay(pointDestination) == false {
            sprite.playWalkUPAnimation()
            sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
            angleFacing = UnitFaceAngle.Up
            updateMovementBlockerPosition(pointDestination)
            return true
        } else {
            return false
        }
    }
    override func OrderUnitToMoveOneStepDOWN() -> Bool {
        updateMovementBlockerPosition()
        let destination = sprite.position.y - UnitDefaultProperty.Movement.Range
        var pointDestination = sprite.position
        pointDestination.y = destination

        if thereIsAnObstacleInTheWay(pointDestination) == false {
            sprite.playWalkDOWNAnimation()
            sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
            angleFacing = UnitFaceAngle.Down
            updateMovementBlockerPosition(pointDestination)
            return true
        } else {
            return false
        }
    }
    override func OrderUnitToMoveOneStepLEFT() -> Bool {
        updateMovementBlockerPosition()
        let destination = sprite.position.x - UnitDefaultProperty.Movement.Range
        var pointDestination = sprite.position
        pointDestination.x = destination

        if thereIsAnObstacleInTheWay(pointDestination) == false {
            sprite.playWalkLEFTAnimation()
            sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
            angleFacing = UnitFaceAngle.Left
            updateMovementBlockerPosition(pointDestination)
            return true
        } else {
            return false
        }
    }
    override func OrderUnitToMoveOneStepRIGHT() -> Bool {
        updateMovementBlockerPosition()
        let destination = sprite.position.x + UnitDefaultProperty.Movement.Range
        var pointDestination = sprite.position
        pointDestination.x = destination
        if thereIsAnObstacleInTheWay(pointDestination) == false {
            sprite.playWalkRIGHTAnimation()
            sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
            angleFacing = UnitFaceAngle.Right
            updateMovementBlockerPosition(pointDestination)
            return true
        } else {
            return false
        }
    }
    
    func thereIsAnObstacleInTheWay(destination: CGPoint) -> Bool {
        var getNodesAtDestination = ReferenceOfGameScene🔶!.nodesAtPoint(destination)
        for node in getNodesAtDestination {
            print(String(Mirror(reflecting: node).subjectType))
            if node is SKBlockMovementSpriteNode {
                return true
            }
        }
        return false
    }
    
    
    func OrderUnitToAttackMeleeUP() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.y = attackY
        sprite.playAttackUPAnimation()
        
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        
//        attackedUnit.hidden = true
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.1);
            dispatch_async(dispatch_get_main_queue()) {
                attackedUnit.hidden = false
            }
        }
        dealDamageToPointInWorld(pointAttackedInWorld)
//        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    func OrderUnitToAttackMeleeDOWN() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.y = attackY
        sprite.playAttackDOWNAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        
//        attackedUnit.hidden = true
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.1);
            dispatch_async(dispatch_get_main_queue()) {
                attackedUnit.hidden = false
            }
        }
        dealDamageToPointInWorld(pointAttackedInWorld)
//        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    func OrderUnitToAttackMeleeLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x - UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.x = attackY
        sprite.playAttackLEFTAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        
//        attackedUnit.hidden = true
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.01);
            dispatch_async(dispatch_get_main_queue()) {
                attackedUnit.hidden = false
            }
        }
        dealDamageToPointInWorld(pointAttackedInWorld)
//        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    func OrderUnitToAttackMeleeRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x + UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.x = attackY
        sprite.playAttackRIGHTAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        
//        attackedUnit.hidden = true
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.1);
            dispatch_async(dispatch_get_main_queue()) {
                attackedUnit.hidden = false
            }
        }
        
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
    
}