//
//  PathfinderUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

class PathfinderUnit: AbstractUnit, Pathfinding {
    
    var sightTimer: NSTimer?
    var attackTimer: NSTimer?
    
    func OrderUnitToMoveOneStepUP() -> Bool {
        guard self.isDead == false else { return false }
        self.angleFacing = UnitFaceAngle.Up
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.y = currentPosition.y + 50
        
        if thereIsAnObstacleInTheWay(destination) == false {

            self.positionLogical = destination
            return true
        } else {
            return false
        }
    }
    func OrderUnitToMoveOneStepDOWN() -> Bool {
        guard self.isDead == false else { return false }
        self.angleFacing = UnitFaceAngle.Down
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.y = currentPosition.y - 50
        
        if thereIsAnObstacleInTheWay(destination) == false {

            self.positionLogical = destination
            return true
        } else {
            return false
        }
    }
    func OrderUnitToMoveOneStepLEFT() -> Bool {
        guard self.isDead == false else { return false }
        self.angleFacing = UnitFaceAngle.Left
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x - 50
        
        if thereIsAnObstacleInTheWay(destination) == false {

            self.positionLogical = destination
            return true
        } else {
            return false
        }
    }
    func OrderUnitToMoveOneStepRIGHT() -> Bool {
        guard self.isDead == false else { return false }
        self.angleFacing = UnitFaceAngle.Right
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x + 50
        
        if thereIsAnObstacleInTheWay(destination) == false {

            self.positionLogical = destination
            return true
        } else {
            return false
        }
    }
    func thereIsAnObstacleInTheWay(destination: CGPoint) -> Bool {
        return false
    }
    
    func issueOrderTargetingPoint(target: CGPoint) {}
    func issueOrderTargetingUnit(unit: UnitFoundation) {}
}