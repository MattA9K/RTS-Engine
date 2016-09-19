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
    
    var isMoving: Bool = false
    
    
    func OrderUnitToMoveOneStepUP(completionHandler: (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.Up
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.y = currentPosition.y + 50
        
        self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                self.sprite.playWalkUPAnimation({ bool in
                })
                self.moveUnitWithSpritesInTheDirection(currentPosition, direction: .Up, finalDestination: { finalDestination in
                    self.moveSpriteControlPanel(.Up)
                    self.isMoving = false
                    
                    self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(finalDestination!)] = true
                    self.alertSpriteSight(finalDestination!)
                    completionHandler(finalDestination)
                })
            } else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }
        })
    }
    func OrderUnitToMoveOneStepDOWN(completionHandler: (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        
        self.angleFacing = UnitFaceAngle.Down
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.y = currentPosition.y - 50
        self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                self.sprite.playWalkDOWNAnimation({ bool in
                })
                self.moveUnitWithSpritesInTheDirection(currentPosition, direction: .Down, finalDestination: { finalDestination in
                    self.moveSpriteControlPanel(.Down)
                    self.isMoving = false
                    
                    
                    self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(finalDestination!)] = true
                    self.alertSpriteSight(finalDestination!)
                    completionHandler(finalDestination)
                })

            } else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }
        })
        
    }
    func OrderUnitToMoveOneStepLEFT(completionHandler: (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.Left
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x - 50
        self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                self.sprite.playWalkLEFTAnimation({ bool in
                })
                self.moveUnitWithSpritesInTheDirection(currentPosition, direction: .Left, finalDestination: { finalDestination in
                    self.moveSpriteControlPanel(.Left)
                    self.isMoving = false
                    self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(finalDestination!)] = true
                    self.alertSpriteSight(finalDestination!)
                    completionHandler(finalDestination)
                })

            }
            else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }

        })
    }
    func OrderUnitToMoveOneStepRIGHT(completionHandler: (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.Right
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x + 50
        self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                self.sprite.playWalkRIGHTAnimation({ bool in
                })
                self.moveUnitWithSpritesInTheDirection(currentPosition, direction: .Right, finalDestination: { finalDestination in
                    self.moveSpriteControlPanel(.Right)
                    self.isMoving = false
                    self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(finalDestination!)] = true
                    self.alertSpriteSight(finalDestination!)
                    completionHandler(finalDestination)
                })

            }
            else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }

        })
    }
    

    
    // ------
    func OrderUnitToMoveOneStepUL(completionHandler: (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.UL
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x - 50
        destination.y = currentPosition.y + 50
        
        self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                self.sprite.playWalkULAnimation({ bool in
                })
                self.moveUnitWithSpritesInTheDirection(destination, direction: .UL, finalDestination: { finalDestination in
                    self.moveSpriteControlPanel(.UL)
                    self.isMoving = false
                    self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(finalDestination!)] = true
                    self.alertSpriteSight(finalDestination!)
                    completionHandler(finalDestination)
                })

            }
            else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }

        })
    }
    func OrderUnitToMoveOneStepUR(completionHandler: (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.UR
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x + 50
        destination.y = currentPosition.y + 50
        self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            
            if bool == false {
                
                self.sprite.playWalkURAnimation({ bool in
                })
                self.moveUnitWithSpritesInTheDirection(destination, direction: .UR, finalDestination: { finalDestination in
                    self.moveSpriteControlPanel(.UR)
                    self.isMoving = false
                    self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(finalDestination!)] = true
                    self.alertSpriteSight(finalDestination!)
                    completionHandler(finalDestination)
                })

            }
            else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }
            

        })
    
    }
    //*
    func OrderUnitToMoveOneStepDL(completionHandler: (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.DL
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x - 50
        destination.y = currentPosition.y - 50
        
        self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                self.sprite.playWalkDLAnimation({ bool in
                })
                self.moveUnitWithSpritesInTheDirection(destination, direction: .DL, finalDestination: { finalDestination in
                    self.moveSpriteControlPanel(.DL)
                    self.isMoving = false
                    self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(finalDestination!)] = true
                    self.alertSpriteSight(finalDestination!)
                    completionHandler(finalDestination)
                })

            } else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }
        })
        

    }
    func OrderUnitToMoveOneStepDR(completionHandler: (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.DR
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x + 50
        destination.y = currentPosition.y - 50
        self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                self.sprite.playWalkDRAnimation({ bool in
                })
                self.moveUnitWithSpritesInTheDirection(destination, direction: .DR, finalDestination: { finalDestination in
                    self.moveSpriteControlPanel(.DR)
                    self.isMoving = false
                    self.ReferenceOfGameScene.PathsBlocked[String(currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(finalDestination!)] = true
                    self.alertSpriteSight(finalDestination!)
                    completionHandler(finalDestination)
                })
                

            } else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }
        })

    }
    
    
    func moveSpriteControlPanel(directon: UnitFaceAngle) {
        if self is HeroFootmanUnit {
            if directon == .Up {
                self.ReferenceOfGameScene.anchorPoint.y -= 50.0 / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYPositive()
            }
            else if directon == .Down {
                self.ReferenceOfGameScene.anchorPoint.y += 50.0 / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYNegative()
            }
            else if directon == .Left {
                self.ReferenceOfGameScene.anchorPoint.x += 50.0 / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXNegative()
            }
            else if directon == .Right {
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXPositive()
                self.ReferenceOfGameScene.anchorPoint.x -= 50.0 / self.ReferenceOfGameScene.size.width
            }
            else if directon == .UL {
                self.ReferenceOfGameScene.anchorPoint.x += 50.0 / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.anchorPoint.y -= 50.0 / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXNegative()
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYPositive()
            }
            else if directon == .UR {
                self.ReferenceOfGameScene.anchorPoint.x -= 50.0 / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.anchorPoint.y -= 50.0 / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXPositive()
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYPositive()
            }
            else if directon == .DL {
                self.ReferenceOfGameScene.anchorPoint.x += 50.0 / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.anchorPoint.y += 50.0 / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXNegative()
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYNegative()
            }
            else if directon == .DR {
                self.ReferenceOfGameScene.anchorPoint.x -= 50.0 / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.anchorPoint.y += 50.0 / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXPositive()
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYNegative()
            }
        }
    }
    // ------
    
    
    func thereIsAnObstacleInTheWay(destination: CGPoint, completionHandler: (Bool?) -> ()) -> () {
        
        var finalAnswer = false
        
        if let pathIsBlocked = self.ReferenceOfGameScene.PathsBlocked[String(destination)] {
            if pathIsBlocked == true {
                finalAnswer = true
                self.ReferenceOfGameScene.PathsBlocked[String(destination)] = true
                completionHandler(finalAnswer)
            }
        }
        
        
        if let target = self.focusedTargetUnit {
            if destination == self.ReferenceOfGameScene.AllUnitsInGameScenePositions[(target.uuid.UUIDString)] {
                finalAnswer = true
                completionHandler(finalAnswer)
            }
        }
        
//        let getNodesAtDestination = ReferenceOfGameScene.nodesAtPoint(destination)
//        print("----- Debugz BEGIN ------")
//        for node in getNodesAtDestination {
//            print("Node at destination: \(Reflection().getClassNameBasic(node))")
//            if node is SKBlockMovementSpriteNode {
//                finalAnswer = true
//            }
//        }
//        print("----- Debugz END ------")
        completionHandler(finalAnswer)
    }
    
    
    func alertSpriteSight(destination: CGPoint) {
        let getNodesAtDestination = ReferenceOfGameScene.nodesAtPoint(destination)
        for node in getNodesAtDestination {
            if node is SKSpriteSightNode {
                if (node as! SKSpriteSightNode).UnitReference.teamNumber != self.teamNumber &&
                (node as! SKSpriteSightNode).UnitReference.uuid != self.uuid {
                    if (node as! SKSpriteSightNode).UnitReference.focusedTargetUnit?.isDead == true {
                        (node as! SKSpriteSightNode).UnitReference.focusedTargetUnit = self
                        allFocusedTargets.insert(self)
                    }
                    else if (node as! SKSpriteSightNode).UnitReference.focusedTargetUnit == nil {
                        (node as! SKSpriteSightNode).UnitReference.focusedTargetUnit = self
                        allFocusedTargets.insert(self)
                    }
                }
            }
        }
    }
    
    
    // returns value of destination rounded to fifties
    func moveUnitWithSpritesInTheDirection(currentPosition: CGPoint, direction: UnitFaceAngle, finalDestination: (CGPoint?) -> ()) -> () {
        self.angleFacing = direction
        var destination = currentPosition
        
        if direction == UnitFaceAngle.Up {

            destination.y = currentPosition.y + 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.Down {

            destination.y = currentPosition.y - 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.Left {

            destination.x = currentPosition.x - 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.Right {

            destination.x = currentPosition.x + 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        
        
        else if direction == UnitFaceAngle.UL {
            destination.x = self.sprite.position.x - 50
            destination.y = self.sprite.position.y + 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.UR {
            destination.x = self.sprite.position.x + 50
            destination.y = self.sprite.position.y + 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.DL {
            destination.x = self.sprite.position.x - 50
            destination.y = self.sprite.position.y - 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.DR {
            destination.x = self.sprite.position.x + 50
            destination.y = self.sprite.position.y - 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else {
            print("I can't do that. \(direction)")
        }
        
        self.positionLogical = destination
        
        var debugPosition1 = destination
        var debugPosition2 = destination
        debugPosition1.y -= 15
        debugPosition2.y += 15
        debugUnitLabel.text = "\(destination)"
        debugUnitLabel.position = debugPosition1
        debugUnitLabel2.text = "TARGETS: \(self.allFocusedTargets.count)"
        debugUnitLabel2.position = debugPosition2
        
        if ((direction == UnitFaceAngle.Up) || (direction == UnitFaceAngle.Down)) {
            self.sprite.runAction(SKAction.moveToY(
                destination.y, duration: UnitData.MovementSpeed()), completion: {
                    self.spriteMovementBlocker.position = destination
                    self.spriteSight.position = destination
                    finalDestination(destination)
            })
        }
        else if ((direction == UnitFaceAngle.Left) || (direction == UnitFaceAngle.Right)) {
            self.sprite.runAction(SKAction.moveToX(
                destination.x, duration: UnitData.MovementSpeed()), completion: {
                    self.spriteMovementBlocker.position = destination
                    self.spriteSight.position = destination
                    finalDestination(destination)
            })
        }
        else {
            self.sprite.runAction(SKAction.moveTo(
                destination, duration: UnitData.MovementSpeed()), completion: {
                    self.spriteMovementBlocker.position = destination
                    self.spriteSight.position = destination
                    finalDestination(destination)
            })
        }
        

    }
    func roundToFifties(x : CGFloat) -> CGFloat {
        return CGFloat(50 * Int(round(x / 50.0)))
    }
    
    
    func issueOrderTargetingPoint(target: CGPoint, completionHandler: (CGPoint?) -> ()) -> () {
        
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
            let tryMove = OrderUnitToMoveOneStepRIGHT({ finalDestination in
                completionHandler(finalDestination)
            })
            
//            if self.isPlayer == true { printPlayer("PLAYER TRIED MOVING RIGHT.") }
            
        } else if currentPositionOfSelf.x > target.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT({ finalDestination in
                completionHandler(finalDestination)
            })

//            if self.isPlayer == true { printPlayer("PLAYER TRIED MOVING LEFT.") }
        }
        else if currentPositionOfSelf.y < target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepUP({ finalDestination in
                completionHandler(finalDestination)
            })

//            if self.isPlayer == true { printPlayer("PLAYER TRIED MOVING UP.") }
        } else if currentPositionOfSelf.y > target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepDOWN({ finalDestination in
                completionHandler(finalDestination)
            })

//            if self.isPlayer == true { printPlayer("PLAYER TRIED MOVING DOWN.") }
        }
        
        if self.isPlayer == true {
            printPlayer("")
            printPlayer("=======================================================")
            printPlayer("")
        }
        
        
//        let movePoint = SKSpriteNode(imageNamed: "SearchRadiusDummyV")
//        movePoint.position = target
//        movePoint.xScale = GameSettings.SpriteScale.Default
//        movePoint.yScale = GameSettings.SpriteScale.Default
//        movePoint.zPosition = SpritePositionZ.AliveUnit.Z + 5
//        ReferenceOfGameScene.addChild(movePoint)
//        movePoint.runAction(SKAction.fadeOutWithDuration(1.0))
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
            let tryMove = OrderUnitToMoveOneStepRIGHT({ bool in
                
            })
            
            
        }
        else if currentPositionOfSelf.x > unit.sprite.position.x &&
            finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT({ bool in
                
            })
            
        }
        else if currentPositionOfSelf.y < unit.sprite.position.y &&
            finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepUP({ bool in
                
            })
            
            
        }
        else if currentPositionOfSelf.y > unit.sprite.position.y &&
            finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepDOWN({ bool in
                
            })
            
        }
    }
}