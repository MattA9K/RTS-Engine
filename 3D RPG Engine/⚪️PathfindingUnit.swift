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
            activateEnemiesNearby(pointDestination)
            sprite.playWalkUPAnimation()
            dispatch_async(dispatch_get_main_queue()) {
                self.sprite.runAction(SKAction.moveToY(self.roundToFifties(destination), duration: 0.2))
            }
            
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
            activateEnemiesNearby(pointDestination)
            sprite.playWalkDOWNAnimation()
            dispatch_async(dispatch_get_main_queue()) {
                self.sprite.runAction(SKAction.moveToY(self.roundToFifties(destination), duration: 0.2))
            }
            
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
            activateEnemiesNearby(pointDestination)
            sprite.playWalkLEFTAnimation()
            dispatch_async(dispatch_get_main_queue()) {
                self.sprite.runAction(SKAction.moveToX(self.roundToFifties(destination), duration: 0.2))
            }
            
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
            activateEnemiesNearby(pointDestination)
            sprite.playWalkRIGHTAnimation()
            dispatch_async(dispatch_get_main_queue()) {
                self.sprite.runAction(SKAction.moveToX(self.roundToFifties(destination), duration: 0.2))
            }
            
            angleFacing = UnitFaceAngle.Right
            unitDidMove(pointDestination)

            return true
        } else {
            return false
        }
    }
    
    func roundToFifties(x : CGFloat) -> CGFloat {
        return CGFloat(50 * Int(round(x / 50.0)))
    }
    
    func activateEnemiesNearby(destination: CGPoint) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//            NSThread.sleepForTimeInterval(0.21);
            var nodes = self.ReferenceOfGameScene🔶!.nodesAtPoint(destination)
            for node in nodes {
                if node is SKUnitSight {
                    let selfUnit = self.sprite.name!
                    if let targetUnit = (node as! SKUnitSight).UnitReference🔶.sprite.name {

                        let selfTeamNumber = self.teamNumber
                        let targetTeamNumber = (node as! SKUnitSight).UnitReference🔶.teamNumber
                        
                        if selfUnit != targetUnit && selfTeamNumber != targetTeamNumber {

//                            if ((node as! SKUnitSight).UnitReference🔶).currentAITarget2 == nil {
                                ((node as! SKUnitSight).UnitReference🔶).addTargetToBuffer(self)
//                            }
                        }
                    }
                }
            }
//        }

    }
    
    func thereIsAnObstacleInTheWay(destination: CGPoint) throws -> Bool {
        let getNodesAtDestination = ReferenceOfGameScene🔶!.nodesAtPoint(destination)
        for node in getNodesAtDestination {

            if node is SKBlockMovementSpriteNode {
                return true
            }
        }
        return false
    }
}