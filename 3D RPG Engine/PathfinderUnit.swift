//
//  PathfinderUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
import SwiftyJSON



let MIN_GRID_SIZE: CGFloat = 50.0

class PathfinderUnit: AbstractUnit, Pathfinding {
    
    var sightTimer: Timer?
    var attackTimer: Timer?
    
    var isMoving: Bool = false
    
    
    public func roundToFifties_(_ x : CGFloat) -> CGFloat {
        return CGFloat(50 * Int(round(x / 50.0)))
    }
    public func roundPointToFifties(_ point: CGPoint) -> CGPoint {
        var new = point
        new.x = roundToFifties_(new.x)
        new.y = roundToFifties_(new.y)
        return new
    }
    
    
    func OrderUnitToMoveOneStep(direction: UnitFaceAngle, completionHandler: @escaping (CGPoint?) -> ()) -> () {
        
        
        self.angleFacing = direction
        if self.isDead == true {
            completionHandler(self.positionLogical)
        } else {
            let destination = roundPointToFifties(calculateNextStepDestination(direction: direction))
            self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = true
            self.isMoving = true
            if self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] != true {
                
//                if self.ReferenceOfGameScene.playerSK.teamNumber == self.teamNumber {
//                    self.ReferenceOfGameScene.sendGameEventToSocket(event: .UnitWalk, unit: self)
//                }
                
                
                let dict : JSON = [
                    "unit_action":"walk",
                    "direction":direction.facingAngleString,
                    "sent_by_host":false,
                    "uuid":self.uuid.uuidString
                ]
                
                self.ReferenceOfGameScene.socket.write(string: dict.rawString()!)
                
                
                self.sprite.playWalkAnimation(direction: direction, completionHandler: {
                })
                
                self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = false
                self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] = true
                self.moveUnitWithSpritesInTheDirection(destination, direction: direction, destination: destination, finalDestination: { finalDestination in
                    self.moveSpriteControlPanel(direction)
                    self.isMoving = false
                    self.alertSpriteSight(finalDestination!)
                    completionHandler(finalDestination)
                })
                
            } else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }
        }
    }
    
    
    func calculateNextStepDestination(direction: UnitFaceAngle) -> CGPoint {
        switch direction {
        case .up:
            print("Up!!!")
            return CGPoint(x: self.positionLogical.x, y: self.positionLogical.y + 50)
        case .down:
            return CGPoint(x: self.positionLogical.x, y: self.positionLogical.y - 50)
        case .left:
            return CGPoint(x: self.positionLogical.x - 50, y: self.positionLogical.y)
        case .right:
            return CGPoint(x: self.positionLogical.x + 50, y: self.positionLogical.y)
        case .ul:
            return CGPoint(x: self.positionLogical.x - 50, y: self.positionLogical.y + 50)
        case .ur:
            return CGPoint(x: self.positionLogical.x + 50, y: self.positionLogical.y + 50)
        case .dl:
            return CGPoint(x: self.positionLogical.x - 50, y: self.positionLogical.y - 50)
        case .dr:
            return CGPoint(x: self.positionLogical.x + 50, y: self.positionLogical.y - 50)
        }
        
    }
    
    
    func logpathfinder(msg: Any) {
        print("[PATHFINDER]: \(msg)")
    }
    
    
    func moveSpriteControlPanel(_ directon: UnitFaceAngle) {
        
        if self is HeroFootmanUnit {
            if directon == .up {
                self.ReferenceOfGameScene.currentGridSizeY -= MIN_GRID_SIZE
                self.ReferenceOfGameScene.virtualAnchorPoint.y -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
//                self.ReferenceOfGameScene.anchorPoint.y -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYPositive()
                logpathfinder(msg: self.ReferenceOfGameScene.anchorPoint.y)
            }
            else if directon == .down {
                self.ReferenceOfGameScene.currentGridSizeY += MIN_GRID_SIZE
                self.ReferenceOfGameScene.virtualAnchorPoint.y += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYNegative()
                logpathfinder(msg: self.ReferenceOfGameScene.virtualAnchorPoint.y)
            }
            else if directon == .left {
                self.ReferenceOfGameScene.currentGridSizeX += MIN_GRID_SIZE
                self.ReferenceOfGameScene.virtualAnchorPoint.x += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXNegative()
                logpathfinder(msg: self.ReferenceOfGameScene.virtualAnchorPoint.y)
            }
            else if directon == .right {
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXPositive()
                self.ReferenceOfGameScene.currentGridSizeX -= MIN_GRID_SIZE
                self.ReferenceOfGameScene.virtualAnchorPoint.x -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                logpathfinder(msg: self.ReferenceOfGameScene.virtualAnchorPoint.y)
            }
            else if directon == .ul {
                self.ReferenceOfGameScene.currentGridSizeX += MIN_GRID_SIZE
                self.ReferenceOfGameScene.currentGridSizeY -= MIN_GRID_SIZE
                self.ReferenceOfGameScene.virtualAnchorPoint.x += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.virtualAnchorPoint.y -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXNegative()
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYPositive()
            }
            else if directon == .ur {
                self.ReferenceOfGameScene.currentGridSizeX -= MIN_GRID_SIZE
                self.ReferenceOfGameScene.currentGridSizeY -= MIN_GRID_SIZE
                self.ReferenceOfGameScene.virtualAnchorPoint.x -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.virtualAnchorPoint.y -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXPositive()
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYPositive()
            }
            else if directon == .dl {
                self.ReferenceOfGameScene.currentGridSizeX += MIN_GRID_SIZE
                self.ReferenceOfGameScene.currentGridSizeY += MIN_GRID_SIZE
                self.ReferenceOfGameScene.virtualAnchorPoint.x += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.virtualAnchorPoint.y += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXNegative()
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYNegative()
            }
            else if directon == .dr {
                self.ReferenceOfGameScene.currentGridSizeX -= MIN_GRID_SIZE
                self.ReferenceOfGameScene.currentGridSizeY += MIN_GRID_SIZE
                self.ReferenceOfGameScene.virtualAnchorPoint.x -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.virtualAnchorPoint.y += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXPositive()
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYNegative()
            }
        }
    }
    // ------
    
    
    func thereIsAnObstacleInTheWay(_ destination: CGPoint, completionHandler: (Bool?) -> ()) -> () {
        var finalAnswer = false
        
        if let pathIsBlocked = self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] {
            if pathIsBlocked == true {
                finalAnswer = true
                self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] = true
                completionHandler(finalAnswer)
            }
        }
        
        if let target = self.focusedTargetUnit {
            if destination == self.ReferenceOfGameScene.AllUnitsInGameScenePositions[(target.uuid.uuidString)] {
                finalAnswer = true
                completionHandler(finalAnswer)
            }
        }
        completionHandler(finalAnswer)
    }
    
    
    func alertSpriteSight(_ destination: CGPoint) {
        let getNodesAtDestination = ReferenceOfGameScene.nodes(at: destination)
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
            else if node is SKSpriteMeleeSightNode {
                
                let aMirror = Mirror(reflecting: node)
                
                if (node as! SKSpriteMeleeSightNode).UnitReference.teamNumber != self.teamNumber &&
                (node as! SKSpriteMeleeSightNode).UnitReference.isDead == false {
                    self.focusedTargetUnit = (node as! SKSpriteMeleeSightNode).UnitReference
                    self.stoppedForInteruptedMeleeCombat = true
                }
            }
        }
    }
    
    
    // returns value of destination rounded to fifties
    func moveUnitWithSpritesInTheDirection(_ currentPosition: CGPoint, direction: UnitFaceAngle, destination: CGPoint, finalDestination: @escaping (CGPoint?) -> ()) -> () {
        let finalSpeed = Double(UnitData.MovementSpeed() + self.isFrozen)
        self.angleFacing = direction
        
        /*
        var destination = currentPosition
        if direction == UnitFaceAngle.up {
            destination.y = currentPosition.y + 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.down {

            destination.y = currentPosition.y - 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.left {

            destination.x = currentPosition.x - 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.right {

            destination.x = currentPosition.x + 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        
        
        else if direction == UnitFaceAngle.ul {
            destination.x = self.sprite.position.x - 50
            destination.y = self.sprite.position.y + 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.ur {
            destination.x = self.sprite.position.x + 50
            destination.y = self.sprite.position.y + 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.dl {
            destination.x = self.sprite.position.x - 50
            destination.y = self.sprite.position.y - 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else if direction == UnitFaceAngle.dr {
            destination.x = self.sprite.position.x + 50
            destination.y = self.sprite.position.y - 50
            destination.x = roundToFifties(destination.x)
            destination.y = roundToFifties(destination.y)
        }
        else {
            print("I can't do that. \(direction)")
        }
        */
        
        self.positionLogical = destination
        
        var debugPosition1 = destination
        var debugPosition2 = destination
        debugPosition1.y -= 15
        debugPosition2.y += 15
        debugUnitLabel.text = "\(destination)"
        debugUnitLabel.position = debugPosition1
        debugUnitLabel2.text = "TARGETS: \(self.allFocusedTargets.count)"
        debugUnitLabel2.position = debugPosition2
        
        if ((direction == UnitFaceAngle.up) || (direction == UnitFaceAngle.down)) {
            self.sprite.run(SKAction.moveTo(
                y: destination.y, duration: finalSpeed), completion: {
                    self.spriteMovementBlocker.position = destination
                    self.spriteSight.position = destination
                    self.meleeSight.position = destination
                    finalDestination(destination)
            })
        }
        else if ((direction == UnitFaceAngle.left) || (direction == UnitFaceAngle.right)) {
            self.sprite.run(SKAction.moveTo(
                x: destination.x, duration: finalSpeed), completion: {
                    self.spriteMovementBlocker.position = destination
                    self.spriteSight.position = destination
                    self.meleeSight.position = destination
                    finalDestination(destination)
            })
        }
        else {
            self.sprite.run(SKAction.move(
                to: destination, duration: finalSpeed), completion: {
                    self.spriteMovementBlocker.position = destination
                    self.spriteSight.position = destination
                    self.meleeSight.position = destination
                    finalDestination(destination)
            })
        }
        

    }
    func roundToFifties(_ x : CGFloat) -> CGFloat {
        return CGFloat(50 * Int(round(x / 50.0)))
    }
    
    
    func issueOrderTargetingPoint(_ target: CGPoint, completionHandler: @escaping (CGPoint?) -> ()) -> () {
        let currentPositionOfSelf = sprite.position
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
        

        if currentPositionOfSelf.x < target.x && finishedMovingByX == false {
            OrderUnitToMoveOneStep(direction: .right, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .dr, completionHandler: { walkedDestination in
                        
                        if walkedDestination == currentPositionOfSelf {
                            
                            self.OrderUnitToMoveOneStep(direction: .ur, completionHandler: { walkedDestination in
                                if walkedDestination == currentPositionOfSelf {
//                                    self.OrderUnitToMoveOneStepDL({ walkedDestination in
                                        completionHandler(walkedDestination)
//                                    })
                                }
                                else {
                                    completionHandler(walkedDestination)
                                }
                            })
                        }
                        else {
                            completionHandler(walkedDestination)
                        }
                    })
                }
                else {
                    completionHandler(walkedDestination)
                }
                
            })
            
//            if self.isPlayer == true { printPlayer("PLAYER TRIED MOVING RIGHT.") }
            
        } else if currentPositionOfSelf.x > target.x && finishedMovingByX == false {
            OrderUnitToMoveOneStep(direction: .left, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .dl, completionHandler: { walkedDestination in
                        
                        if walkedDestination == currentPositionOfSelf {
                            
                            self.OrderUnitToMoveOneStep(direction: .ul, completionHandler: { walkedDestination in
                                if walkedDestination == currentPositionOfSelf {
//                                    self.OrderUnitToMoveOneStepUR({ walkedDestination in
                                        completionHandler(walkedDestination)
//                                    })
                                }
                                else {
                                    completionHandler(walkedDestination)
                                }
                            })
                        }
                        else {
                            completionHandler(walkedDestination)
                        }
                    })
                }
                else {
                    completionHandler(walkedDestination)
                }
                
            })

//            if self.isPlayer == true { printPlayer("PLAYER TRIED MOVING LEFT.") }
        }
        else if currentPositionOfSelf.y < target.y && finishedMovingByY == false {
            OrderUnitToMoveOneStep(direction: .up, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .ul, completionHandler: { walkedDestination in
                        
                        if walkedDestination == currentPositionOfSelf {
                            self.OrderUnitToMoveOneStep(direction: .ur, completionHandler: { walkedDestination in
                                    if walkedDestination == currentPositionOfSelf {
//                                        self.OrderUnitToMoveOneStepDR({ walkedDestination in
                                            completionHandler(walkedDestination)
//                                        })
                                    }
                                    else {
                                        completionHandler(walkedDestination)
                                    }
                                })
                        }
                        else {
                            completionHandler(walkedDestination)
                        }
                    })
                }
                else {
                    completionHandler(walkedDestination)
                }
                
            })

//            if self.isPlayer == true { printPlayer("PLAYER TRIED MOVING UP.") }
        } else if currentPositionOfSelf.y > target.y && finishedMovingByY == false {
            OrderUnitToMoveOneStep(direction: .down, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .dr, completionHandler: { walkedDestination in
                        
                        if walkedDestination == currentPositionOfSelf {
                            
                            self.OrderUnitToMoveOneStep(direction: .dl, completionHandler: { walkedDestination in
                                if walkedDestination == currentPositionOfSelf {
//                                    self.OrderUnitToMoveOneStepUL({ walkedDestination in
                                        completionHandler(walkedDestination)
//                                    })
                                }
                                else {
                                    completionHandler(walkedDestination)
                                }
                            })
                        }
                        else {
                            completionHandler(walkedDestination)
                        }
                    })
                } else {
                    completionHandler(walkedDestination)
                }
                
            })
        }
        
        if self.isPlayer == true {
            printPlayer("")
            printPlayer("=======================================================")
            printPlayer("")
        }
    }
    
    
    func issueOrderTargetingPoint_NoDiagnalMovement(_ target: CGPoint, completionHandler: @escaping (CGPoint?) -> ()) -> () {
        let currentPositionOfSelf = sprite.position
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
        
        
        if currentPositionOfSelf.x < target.x && finishedMovingByX == false {
            OrderUnitToMoveOneStep(direction: .right, completionHandler: { walkedDestination in
                    completionHandler(walkedDestination)
            })
            
        } else if currentPositionOfSelf.x > target.x && finishedMovingByX == false {
            OrderUnitToMoveOneStep(direction: .left, completionHandler: { walkedDestination in
                    completionHandler(walkedDestination)
            })
        }
        else if currentPositionOfSelf.y < target.y && finishedMovingByY == false {
            OrderUnitToMoveOneStep(direction: .up, completionHandler: { walkedDestination in
                    completionHandler(walkedDestination)
            })
        } else if currentPositionOfSelf.y > target.y && finishedMovingByY == false {
            OrderUnitToMoveOneStep(direction: .down, completionHandler: { walkedDestination in
                    completionHandler(walkedDestination)
            })
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func issueOrderTargetingUnit(_ unit: UnitFoundation) {
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
            OrderUnitToMoveOneStep(direction: .right, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .dr, completionHandler: { walkedDestination in
                    })
                }
            })
        }
        else if currentPositionOfSelf.x > unit.sprite.position.x &&
            finishedMovingByX == false {
            OrderUnitToMoveOneStep(direction: .left, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .dl, completionHandler: { walkedDestination in
                    })
                }
            })
        }
        else if currentPositionOfSelf.y < unit.sprite.position.y &&
            finishedMovingByY == false {
            OrderUnitToMoveOneStep(direction: .up, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .ul, completionHandler: { walkedDestination in
                    })
                }
            })
        }
        else if currentPositionOfSelf.y > unit.sprite.position.y &&
            finishedMovingByY == false {
            OrderUnitToMoveOneStep(direction: .down, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .dr, completionHandler: { walkedDestination in
                    })
                }
            })
        }
    }
}
