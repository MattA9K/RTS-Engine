//
//  PathfindingUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class PathfindingUnit: BaseUnit {
    
    // MELEE UNIT
    func OrderUnitToAttackMeleeUP() {}
    func OrderUnitToAttackMeleeUPLEFT() {}
    func OrderUnitToAttackMeleeUPRIGHT() {}
    
    func OrderUnitToAttackMeleeDOWNLEFT() {}
    func OrderUnitToAttackMeleeDOWNRIGHT() {}
    func OrderUnitToAttackMeleeDOWN() {}
    
    func OrderUnitToAttackMeleeLEFT() {}
    func OrderUnitToAttackMeleeRIGHT() {}
    // MELEE UNIT
    
    
    
    // RANGED UNIT
    func OrderUnitToAttackRangedUP() {}
    func OrderUnitToAttackRangedUPLEFT() {}
    func OrderUnitToAttackRangedUPRIGHT() {}
    
    func OrderUnitToAttackRangedDOWNLEFT() {}
    func OrderUnitToAttackRangedDOWNRIGHT() {}
    func OrderUnitToAttackRangedDOWN() {}
    
    func OrderUnitToAttackRangedLEFT() {}
    func OrderUnitToAttackRangedRIGHT() {}
    // RANGED UNIT
    
    
    
    override func OrderUnitToMoveOneStepUP() -> Bool {
        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Unit moved up.")
        
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
}