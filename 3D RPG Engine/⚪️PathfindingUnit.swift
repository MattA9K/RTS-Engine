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
        if isDead == true { return false }
        angleFacing = UnitFaceAngle.Up
        sprite.playFaceUpAnimation()
        
//        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Unit moved up.")
        updateMovementBlockerPosition()
        let destination = round(sprite.position.y) + UnitDefaultProperty.Movement.Range
        var pointDestination = sprite.position
        pointDestination.y = destination
        
        if thereIsAnObstacleInTheWay(pointDestination) == false {
            sprite.playWalkUPAnimation()
            sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
            angleFacing = UnitFaceAngle.Up

            unitDidMove(pointDestination)
            return true
        } else {
            return false
        }
    }
    override func OrderUnitToMoveOneStepDOWN() -> Bool {
        if isDead == true { return false }
        sprite.playFaceDownAnimation()
        angleFacing = UnitFaceAngle.Down
        
        updateMovementBlockerPosition()
        let destination = round(sprite.position.y) - UnitDefaultProperty.Movement.Range
        var pointDestination = sprite.position
        pointDestination.y = destination
        
        
        if thereIsAnObstacleInTheWay(pointDestination) == false {
            sprite.playWalkDOWNAnimation()
            sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
            angleFacing = UnitFaceAngle.Down
            
            unitDidMove(pointDestination)
            return true
        } else {
            return false
        }
    }
    override func OrderUnitToMoveOneStepLEFT() -> Bool {
        if isDead == true { return false }
        sprite.playFaceLeftAnimation()
        angleFacing = UnitFaceAngle.Left
        
        updateMovementBlockerPosition()
        let destination = round(sprite.position.x) - UnitDefaultProperty.Movement.Range
        var pointDestination = sprite.position
        pointDestination.x = destination
        
        if thereIsAnObstacleInTheWay(pointDestination) == false {
            sprite.playWalkLEFTAnimation()
            sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
            angleFacing = UnitFaceAngle.Left
            
            unitDidMove(pointDestination)
            return true
        } else {
            return false
        }
    }
    override func OrderUnitToMoveOneStepRIGHT() -> Bool {
        if isDead == true { return false }
        sprite.playFaceRightAnimation()
        angleFacing = UnitFaceAngle.Right
        
        updateMovementBlockerPosition()
        let destination = round(sprite.position.x) + UnitDefaultProperty.Movement.Range
        var pointDestination = sprite.position
        pointDestination.x = destination
        if thereIsAnObstacleInTheWay(pointDestination) == false {
            sprite.playWalkRIGHTAnimation()
            sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
            angleFacing = UnitFaceAngle.Right

            unitDidMove(pointDestination)
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
            } else if node is SKUnitSight {
                let selfUnit = sprite.name!
                let targetUnit = (node as! SKUnitSight).UnitReference🔶.sprite.name!
                if selfUnit != targetUnit {
                    (node as! SKUnitSight).UnitReference🔶.addTargetToBuffer(self)
                }
            }
        }
        return false
    }
}