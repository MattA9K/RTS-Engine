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
            moveUnitWithSpritesInTheDirection(currentPosition, direction: .Up)
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
            moveUnitWithSpritesInTheDirection(currentPosition, direction: .Down)
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
            moveUnitWithSpritesInTheDirection(currentPosition, direction: .Left)
            return true
        } else {
            return false
        }
    }
    func OrderUnitToMoveOneStepRIGHT() -> Bool {
        guard self.isDead == false else {
            return false
        }
        self.angleFacing = UnitFaceAngle.Right
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x + 50
        
        
        if thereIsAnObstacleInTheWay(destination) == false {
            moveUnitWithSpritesInTheDirection(currentPosition, direction: .Right)
            return true
        } else {
            return false
        }
    }
    func thereIsAnObstacleInTheWay(destination: CGPoint) -> Bool {
        return false
    }
    
    func moveUnitWithSpritesInTheDirection(currentPosition: CGPoint, direction: UnitFaceAngle) {
        self.angleFacing = direction
        var destination = currentPosition
        
        if direction == UnitFaceAngle.Up {
            sprite.playWalkUPAnimation()
            destination.y = currentPosition.y + 50
        }
        else if direction == UnitFaceAngle.Down {
            sprite.playWalkDOWNAnimation()
            destination.y = currentPosition.y - 50
        }
        else if direction == UnitFaceAngle.Left {
            sprite.playWalkLEFTAnimation()
            destination.x = currentPosition.x - 50
        }
        else if direction == UnitFaceAngle.Right {
            sprite.playWalkRIGHTAnimation()
            destination.x = currentPosition.x + 50
        }
        
        destination.x = roundToFifties(destination.x)
        destination.y = roundToFifties(destination.y)
        

        self.positionLogical = destination
        
        if ((direction == UnitFaceAngle.Up) || (direction == UnitFaceAngle.Down)) {
            self.sprite.runAction(
                SKAction.moveToY(
                    destination.y, duration: UnitData.MovementSpeed()))
        }
        else if ((direction == UnitFaceAngle.Left) || (direction == UnitFaceAngle.Right)) {
            self.sprite.runAction(
                SKAction.moveToX(
                    destination.x, duration: UnitData.MovementSpeed()))
        }
        

    }
    func roundToFifties(x : CGFloat) -> CGFloat {
        return CGFloat(50 * Int(round(x / 50.0)))
    }
    
    
    func issueOrderTargetingPoint(target: CGPoint) {
        let currentPositionOfSelf = sprite.position
        
        //        ReferenceOfGameScene?.ControlPanel?.printToConsole("Current Position of Target: " + String(target.x))
        
        let differenceOfX = currentPositionOfSelf.x - target.x
        let differenceOfY = currentPositionOfSelf.y - target.y
        
        // Set the range base on MELEE or RANGED
        var range: CGFloat = 0
        if self is RangedUnitNEW {
            range = 250
        } else if self is MeleeUnitNEW {
            range = 50
        }
        
        var finishedMovingByX = false
        if differenceOfX <= range && differenceOfX >= (range * -1) {
            finishedMovingByX = true
        }
        
        var finishedMovingByY = false
        if differenceOfY <= range && differenceOfY >= (range * -1) {
            finishedMovingByY = true
        }
        
        
        
        if self.isPlayer == true {
            printPlayer("")
            printPlayer("=======================================================")
            printPlayer("")
            printPlayer("difference of X: \(differenceOfX)")
            printPlayer("difference of Y: \(differenceOfY)")
            printPlayer("")
            printPlayer("currentPositionOfSelf.x: \(currentPositionOfSelf.x)")
            printPlayer("target.x: \(target.x)")
            printPlayer("finishedMovingByX: \(finishedMovingByX)")
            printPlayer("")
            printPlayer("currentPositionOfSelf.y: \(currentPositionOfSelf.y)")
            printPlayer("target.y: \(target.y)")
            printPlayer("finishedMovingByY: \(finishedMovingByY)")
            printPlayer("")
        }
        
        
        
        if currentPositionOfSelf.x < target.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepRIGHT()
            
            if self.isPlayer == true { printPlayer("PLAYER TRIED MOVING RIGHT.") }
            
        } else if currentPositionOfSelf.x > target.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT()

            if self.isPlayer == true { printPlayer("PLAYER TRIED MOVING LEFT.") }
        }
        else if currentPositionOfSelf.y < target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepUP()

            if self.isPlayer == true { printPlayer("PLAYER TRIED MOVING UP.") }
        } else if currentPositionOfSelf.y > target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepDOWN()

            if self.isPlayer == true { printPlayer("PLAYER TRIED MOVING DOWN.") }
        }
        
        if self.isPlayer == true {
            printPlayer("")
            printPlayer("=======================================================")
            printPlayer("")
        }
        
        let movePoint = SKSpriteNode(imageNamed: "player-test")
        movePoint.position = target
        movePoint.xScale = GameSettings.SpriteScale.Default
        movePoint.yScale = GameSettings.SpriteScale.Default
        movePoint.zPosition = SpritePositionZ.AliveUnit.Z + 5
        ReferenceOfGameScene.addChild(movePoint)
        movePoint.runAction(SKAction.fadeOutWithDuration(1.0))
    }
    
    func issueOrderTargetingUnit(unit: UnitFoundation) {
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
        
        
        
        if currentPositionOfSelf.x < unit.sprite.position.x &&
            finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepRIGHT()
            
            
        }
        else if currentPositionOfSelf.x > unit.sprite.position.x &&
            finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT()
            
        }
        else if currentPositionOfSelf.y < unit.sprite.position.y &&
            finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepUP()
            
            
        }
        else if currentPositionOfSelf.y > unit.sprite.position.y &&
            finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepDOWN()
            
        }
    }
}