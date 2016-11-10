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
    
    var sightTimer: Timer?
    var attackTimer: Timer?
    
    var isMoving: Bool = false
    
    
    func OrderUnitToMoveOneStepUP(_ completionHandler: @escaping (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.up
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.y = currentPosition.y + 50
        
        self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                if self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] != true {
                    self.sprite.playWalkUPAnimation({ bool in
                    })
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] = true
                    self.moveUnitWithSpritesInTheDirection(currentPosition, direction: .up, finalDestination: { finalDestination in
                        self.moveSpriteControlPanel(.up)
                        self.isMoving = false
                        self.alertSpriteSight(finalDestination!)
                        completionHandler(finalDestination)
                    })
                }

            } else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }
        })
    }
    func OrderUnitToMoveOneStepDOWN(_ completionHandler: @escaping (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        
        self.angleFacing = UnitFaceAngle.down
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.y = currentPosition.y - 50
        self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                if self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] != true {
                    self.sprite.playWalkDOWNAnimation({ bool in
                    })
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] = true
                    self.moveUnitWithSpritesInTheDirection(currentPosition, direction: .down, finalDestination: { finalDestination in
                        self.moveSpriteControlPanel(.down)
                        self.isMoving = false
                        self.alertSpriteSight(finalDestination!)
                        completionHandler(finalDestination)
                    })
                }


            } else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }
        })
        
    }
    func OrderUnitToMoveOneStepLEFT(_ completionHandler: @escaping (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.left
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x - 50
        self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                if self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] != true {
                    self.sprite.playWalkLEFTAnimation({ bool in
                    })
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] = true
                    self.moveUnitWithSpritesInTheDirection(currentPosition, direction: .left, finalDestination: { finalDestination in
                        self.moveSpriteControlPanel(.left)
                        self.isMoving = false
                        self.alertSpriteSight(finalDestination!)
                        completionHandler(finalDestination)
                    })
                }


            }
            else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }

        })
    }
    func OrderUnitToMoveOneStepRIGHT(_ completionHandler: @escaping (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.right
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x + 50
        self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                if self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] != true {
                    self.sprite.playWalkRIGHTAnimation({ bool in
                    })
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] = true
                    self.moveUnitWithSpritesInTheDirection(currentPosition, direction: .right, finalDestination: { finalDestination in
                        self.moveSpriteControlPanel(.right)
                        self.isMoving = false
                        self.alertSpriteSight(finalDestination!)
                        completionHandler(finalDestination)
                    })
                }


            }
            else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }

        })
    }
    

    
    // ------
    func OrderUnitToMoveOneStepUL(_ completionHandler: @escaping (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.ul
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x - 50
        destination.y = currentPosition.y + 50
        
        self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                if self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] != true {
                    self.sprite.playWalkULAnimation({ bool in
                    })
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] = true
                    self.moveUnitWithSpritesInTheDirection(destination, direction: .ul, finalDestination: { finalDestination in
                        self.moveSpriteControlPanel(.ul)
                        self.isMoving = false
                        self.alertSpriteSight(finalDestination!)
                        completionHandler(finalDestination)
                    })
                }
            }
            else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }

        })
    }
    func OrderUnitToMoveOneStepUR(_ completionHandler: @escaping (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.ur
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x + 50
        destination.y = currentPosition.y + 50
        self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                if self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] != true {
                    self.sprite.playWalkURAnimation({ bool in
                    })
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] = true
                    self.moveUnitWithSpritesInTheDirection(destination, direction: .ur, finalDestination: { finalDestination in
                        self.moveSpriteControlPanel(.ur)
                        self.isMoving = false
                        self.alertSpriteSight(finalDestination!)
                        completionHandler(finalDestination)
                    })
                }

            }
            else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }
            
            
        })
    
    }
    //*
    func OrderUnitToMoveOneStepDL(_ completionHandler: @escaping (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.dl
        
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x - 50
        destination.y = currentPosition.y - 50
        
        self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                if self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] != true {
                    self.sprite.playWalkDLAnimation({ bool in
                    })
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] = true
                    self.moveUnitWithSpritesInTheDirection(destination, direction: .dl, finalDestination: { finalDestination in
                        self.moveSpriteControlPanel(.dl)
                        self.isMoving = false
                        self.alertSpriteSight(finalDestination!)
                        completionHandler(finalDestination)
                    })
                }


            } else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }
        })
        

    }
    func OrderUnitToMoveOneStepDR(_ completionHandler: @escaping (CGPoint?) -> ()) -> () {
        if self.isDead == true {
            completionHandler(self.positionLogical)
        }
        self.angleFacing = UnitFaceAngle.dr
        let currentPosition = self.positionLogical
        var destination = currentPosition
        destination.x = currentPosition.x + 50
        destination.y = currentPosition.y - 50
        self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = true
        self.isMoving = true
        thereIsAnObstacleInTheWay(destination, completionHandler: { bool in
            if bool == false {
                
                if self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] != true {
                    self.sprite.playWalkDRAnimation({ bool in
                    })
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: currentPosition)] = false
                    self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] = true
                    self.moveUnitWithSpritesInTheDirection(destination, direction: .dr, finalDestination: { finalDestination in
                        self.moveSpriteControlPanel(.dr)
                        self.isMoving = false
                        self.alertSpriteSight(finalDestination!)
                        completionHandler(finalDestination)
                    })
                }
                

            } else {
                self.isMoving = false
                self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = true
                completionHandler(self.positionLogical)
            }
        })
    }
    
    
    func OrderUnitToMoveOneStep(direction: UnitFaceAngle, completionHandler: @escaping (CGPoint?) -> ()) -> () {
        self.angleFacing = direction
        if self.isDead == true {
            completionHandler(self.positionLogical)
        } else {
            let destination = calculateNextStepDestination(direction: direction)
            self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = true
            self.isMoving = true
            if self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] != true {
                self.sprite.playWalkAnimation(direction: direction, completionHandler: {
                })
                self.ReferenceOfGameScene.PathsBlocked[String(describing: self.positionLogical)] = false
                self.ReferenceOfGameScene.PathsBlocked[String(describing: destination)] = true
                self.moveUnitWithSpritesInTheDirection(destination, direction: direction, finalDestination: { finalDestination in
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
                self.ReferenceOfGameScene.anchorPoint.y -= 50.0 / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYPositive()
            }
            else if directon == .down {
                self.ReferenceOfGameScene.anchorPoint.y += 50.0 / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYNegative()
            }
            else if directon == .left {
                self.ReferenceOfGameScene.anchorPoint.x += 50.0 / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXNegative()
            }
            else if directon == .right {
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXPositive()
                self.ReferenceOfGameScene.anchorPoint.x -= 50.0 / self.ReferenceOfGameScene.size.width
            }
            else if directon == .ul {
                self.ReferenceOfGameScene.anchorPoint.x += 50.0 / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.anchorPoint.y -= 50.0 / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXNegative()
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYPositive()
            }
            else if directon == .ur {
                self.ReferenceOfGameScene.anchorPoint.x -= 50.0 / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.anchorPoint.y -= 50.0 / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXPositive()
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYPositive()
            }
            else if directon == .dl {
                self.ReferenceOfGameScene.anchorPoint.x += 50.0 / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.anchorPoint.y += 50.0 / self.ReferenceOfGameScene.size.height
                self.ReferenceOfGameScene.spriteControlPanel?.moveByXNegative()
                self.ReferenceOfGameScene.spriteControlPanel?.moveByYNegative()
            }
            else if directon == .dr {
                self.ReferenceOfGameScene.anchorPoint.x -= 50.0 / self.ReferenceOfGameScene.size.width
                self.ReferenceOfGameScene.anchorPoint.y += 50.0 / self.ReferenceOfGameScene.size.height
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
                print("PRE-DEBUG: \(aMirror)")
                print("DEBUGGING SOME SHIT: \((node as! SKSpriteMeleeSightNode).UnitReference.teamNumber)")
                print(self.teamNumber)
                
                if (node as! SKSpriteMeleeSightNode).UnitReference.teamNumber != self.teamNumber &&
                (node as! SKSpriteMeleeSightNode).UnitReference.isDead == false {
                    self.focusedTargetUnit = (node as! SKSpriteMeleeSightNode).UnitReference
                    self.stoppedForInteruptedMeleeCombat = true
                }
            }
        }
    }
    
    
    // returns value of destination rounded to fifties
    func moveUnitWithSpritesInTheDirection(_ currentPosition: CGPoint, direction: UnitFaceAngle, finalDestination: @escaping (CGPoint?) -> ()) -> () {
        let finalSpeed = Double(UnitData.MovementSpeed() + self.isFrozen)
        self.angleFacing = direction
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
            let tryMove = OrderUnitToMoveOneStepRIGHT({ walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStepDR({ walkedDestination in
                        
                        if walkedDestination == currentPositionOfSelf {
                            
                            self.OrderUnitToMoveOneStepUR({ walkedDestination in
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
            let tryMove = OrderUnitToMoveOneStepLEFT({ walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStepDL({ walkedDestination in
                        
                        if walkedDestination == currentPositionOfSelf {
                            
                            self.OrderUnitToMoveOneStepUL({ walkedDestination in
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
            let tryMove = OrderUnitToMoveOneStepUP({ walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStepUL({ walkedDestination in
                        
                        if walkedDestination == currentPositionOfSelf {
                            self.OrderUnitToMoveOneStepUR({ walkedDestination in
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
            let tryMove = OrderUnitToMoveOneStepDOWN({ walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStepDR({ walkedDestination in
                        
                        if walkedDestination == currentPositionOfSelf {
                            
                            self.OrderUnitToMoveOneStepDL({ walkedDestination in
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
            let tryMove = OrderUnitToMoveOneStepRIGHT({ walkedDestination in
                    completionHandler(walkedDestination)
            })
            
        } else if currentPositionOfSelf.x > target.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT({ walkedDestination in
                    completionHandler(walkedDestination)
            })
        }
        else if currentPositionOfSelf.y < target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepUP({ walkedDestination in
                    completionHandler(walkedDestination)
            })
        } else if currentPositionOfSelf.y > target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepDOWN({ walkedDestination in
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
