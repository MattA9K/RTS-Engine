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
    
    
    
    override func OrderUnitToMoveOneStepUP() -> Bool {
        if isDead == true { return false }
        angleFacing = UnitFaceAngle.Up
        sprite.playFaceUpAnimation()
        
//        ReferenceOfGameScene?.ControlPanel?.printToConsole("Unit moved up.")
        updateMovementBlockerPosition()
        let destination = round(sprite.position.y) + UnitDefaultProperty.Movement.Range
        var pointDestination = sprite.position
        pointDestination.y = destination
        
        
        if thereIsAnObstacleInTheWay(pointDestination) == false {
            activateEnemiesNearby(pointDestination)
            sprite.playWalkUPAnimation()

                self.sprite.runAction(
                    SKAction.moveToY(
                        PathFinder().roundToFifties(destination), duration: UnitData.MovementSpeed()))
            
            angleFacing = UnitFaceAngle.Up
            
            MoveUnitActorByY(pointDestination)

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

                self.sprite.runAction(
                    SKAction.moveToY(
                        PathFinder().roundToFifties(destination), duration: UnitData.MovementSpeed()))
            
            angleFacing = UnitFaceAngle.Down
            
            MoveUnitActorByY(pointDestination)

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
//            dispatch_async(dispatch_get_main_queue()) {
                self.sprite.runAction(
                    SKAction.moveToX(
                        PathFinder().roundToFifties(destination), duration: UnitData.MovementSpeed()))
//            }
            
            angleFacing = UnitFaceAngle.Left
            
            MoveUnitActorByX(pointDestination)

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
            
                self.sprite.runAction(
                    SKAction.moveToX(
                        PathFinder().roundToFifties(destination), duration: UnitData.MovementSpeed()))
            
            angleFacing = UnitFaceAngle.Right
            MoveUnitActorByX(pointDestination)

            return true
        } else {
            return false
        }
    }
    

    
    func activateEnemiesNearby(destination: CGPoint) {
        /*
            var nodes = self.ReferenceOfGameScene!.nodesAtPoint(destination)
            for node in nodes {
                if node is SKUnitSight {
                    let selfUnit = self.sprite.name!
                    if let targetUnit = (node as! SKUnitSight).UnitReference.sprite.name {
                        let selfTeamNumber = self.teamNumber
                        let targetTeamNumber = (node as! SKUnitSight).UnitReference.teamNumber
                        if selfUnit != targetUnit && selfTeamNumber != targetTeamNumber {
                                ((node as! SKUnitSight).UnitReference).addTargetToBuffer(self)
                        }
                    }
                }
            }
        */
    }
    
    func thereIsAnObstacleInTheWay(destination: CGPoint) -> Bool {
        let getNodesAtDestination = ReferenceOfGameScene!.nodesAtPoint(destination)
        for node in getNodesAtDestination {

            if node is SKBlockMovementSpriteNode {
                return true
            }
        }
        return false
    }
}