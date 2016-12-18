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

/// PathfinderUnit
///
/// A basic non-attacking unit which can move.
/// `METHODS`
///
/// - **OrderUnitToMoveOneStep**: Make a unit in the game scene move one step in a specific direction.
/// - **calculateNextStepDestination**: Convert potential unit direction into `CGPoint`
/// - **moveSpriteControlPanel**: Invoked for the player's main unit
/// - **alertSpriteSight**
/// - **moveUnitWithSpritesInTheDirection**
/// - **forceUnitPositionTo**
/// - **issueMultiplayerAIOrderTargetingPoint**
/// - **forwardSocketMessage**
class PathfinderUnit: AbstractUnit, Pathfinding {


    /// sightTimer is depricated
    var sightTimer: Timer?
    var attackTimer: Timer?
    var isMoving: Bool = false
    
    var lastPositionFromWebSocket : CGPoint?
    var attackMoveOrderLocation : CGPoint?

    
    public func roundToFifties_(_ x : CGFloat) -> CGFloat {
        return CGFloat(50 * Int(round(x / 50.0)))
    }
    public func roundPointToFifties(_ point: CGPoint) -> CGPoint {
        var new = point
        new.x = roundToFifties_(new.x)
        new.y = roundToFifties_(new.y)
        return new
    }




    /// Make a unit in the game scene move one step in a specific direction.
    /// - **Parameter direction**:   The direction of the movement.
    /// - **Completion**: A new string with `str` repeated `times` times.
    func OrderUnitToMoveOneStep(direction: UnitFaceAngle, completionHandler: @escaping (CGPoint?) -> ()) -> () {
        self.angleFacing = direction
        if self.isDead == true {
            completionHandler(self.positionLogical)
        } else {
            let destination = roundPointToFifties(calculateNextStepDestination(direction: direction))
            let point : CGPoint = self.positionLogical

            var st : String = "VOID"
            if self.teamNumber == 1 {
                st = "HOST"
            } else if self.teamNumber > 1000 {
                st = "CPU"
            } else {
                st = "MISC"
            }

            let keyStrOrigin : String = "{\(point.x), \(point.y)}"
            let keyStrDestination : String = "{\(destination.x), \(destination.y)}"

            self.isMoving = true
            if self.ReferenceOfGameScene.PathsBlocked[keyStrDestination] == nil {

                let x : CGFloat = point.x
                let y : CGFloat = point.y
                let gpmp : GamePathMatrixPoint = GamePathMatrixPoint(
                        LandPoint: point,
                        IsBlocked: false,
                        spaceTime: st,
                        _color: DEFAULT_UNBLOCKED)
//            self.ReferenceOfGameScene.PathsBlocked[keyStr] = gpmp
                self.ReferenceOfGameScene.setPathsBlockedValueToNil(at: point)

                self.sprite.playWalkAnimation(direction: direction, completionHandler: {
                })
                self.moveSpriteControlPanel(direction)
                self.moveUnitWithSpritesInTheDirection(destination, direction: direction, destination: destination, finalDestination: { finalDestination in
                    self.isMoving = false
                    self.alertSpriteSight(finalDestination!)

                    let point : CGPoint = finalDestination!
                    let x : CGFloat = point.x
                    let y : CGFloat = point.y
                    let gpmp : GamePathMatrixPoint = GamePathMatrixPoint(
                            LandPoint: point,
                            IsBlocked: true,
                            spaceTime: "Unit",
                            _color: self.primaryColor)
                    let keyStr : String = "{\(x), \(y)}"
//                    self.ReferenceOfGameScene.PathsBlocked[keyStr] = gpmp
                    self.ReferenceOfGameScene.setPathsBlockedValue(at: destination, usingMatrixPoint: gpmp)

                    self.ReferenceOfGameScene.broadcastAIDidArriveAtDestination(self, destination: finalDestination!)
                    completionHandler(finalDestination)
                })
            } else {
                self.isMoving = false
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
//        print("[PATHFINDER]: \(msg)")
    }
    
    
    func moveSpriteControlPanel(_ directon: UnitFaceAngle) {

//        if let plyr = self.ReferenceOfGameScene.playerSK {
            if self.nameGUI == "GUI_HOLDER" {
                if directon == .up {
                    self.ReferenceOfGameScene.currentGridSizeY -= MIN_GRID_SIZE
                    self.ReferenceOfGameScene.virtualAnchorPoint.y -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                    let point : CGPoint = CGPoint(x: 0, y: 50)
                    self.ReferenceOfGameScene.spriteControlPanel?.moveBy(point)
                    logpathfinder(msg: self.ReferenceOfGameScene.anchorPoint.y)
                }
                else if directon == .down {
                    self.ReferenceOfGameScene.currentGridSizeY += MIN_GRID_SIZE
                    self.ReferenceOfGameScene.virtualAnchorPoint.y += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                    let point : CGPoint = CGPoint(x: 0, y: -50)
                    self.ReferenceOfGameScene.spriteControlPanel?.moveBy(point)
                    logpathfinder(msg: self.ReferenceOfGameScene.virtualAnchorPoint.y)
                }
                else if directon == .left {
                    self.ReferenceOfGameScene.currentGridSizeX += MIN_GRID_SIZE
                    self.ReferenceOfGameScene.virtualAnchorPoint.x += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                    let point : CGPoint = CGPoint(x: -50, y: 0)
                    self.ReferenceOfGameScene.spriteControlPanel?.moveBy(point)
                    logpathfinder(msg: self.ReferenceOfGameScene.virtualAnchorPoint.y)
                }
                else if directon == .right {
                    let point : CGPoint = CGPoint(x: 50, y: 0)
                    self.ReferenceOfGameScene.spriteControlPanel?.moveBy(point)
                    self.ReferenceOfGameScene.currentGridSizeX -= MIN_GRID_SIZE
                    self.ReferenceOfGameScene.virtualAnchorPoint.x -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                    logpathfinder(msg: self.ReferenceOfGameScene.virtualAnchorPoint.y)
                }
                else if directon == .ul {
                    self.ReferenceOfGameScene.currentGridSizeX += MIN_GRID_SIZE
                    self.ReferenceOfGameScene.currentGridSizeY -= MIN_GRID_SIZE
                    self.ReferenceOfGameScene.virtualAnchorPoint.x += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                    self.ReferenceOfGameScene.virtualAnchorPoint.y -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                    let point : CGPoint = CGPoint(x: -50, y: 50)
                    self.ReferenceOfGameScene.spriteControlPanel?.moveBy(point)
                }
                else if directon == .ur {
                    self.ReferenceOfGameScene.currentGridSizeX -= MIN_GRID_SIZE
                    self.ReferenceOfGameScene.currentGridSizeY -= MIN_GRID_SIZE
                    self.ReferenceOfGameScene.virtualAnchorPoint.x -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                    self.ReferenceOfGameScene.virtualAnchorPoint.y -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                    let point : CGPoint = CGPoint(x: 50, y: 50)
                    self.ReferenceOfGameScene.spriteControlPanel?.moveBy(point)
                }
                else if directon == .dl {
                    self.ReferenceOfGameScene.currentGridSizeX += MIN_GRID_SIZE
                    self.ReferenceOfGameScene.currentGridSizeY += MIN_GRID_SIZE
                    self.ReferenceOfGameScene.virtualAnchorPoint.x += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                    self.ReferenceOfGameScene.virtualAnchorPoint.y += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                    let point : CGPoint = CGPoint(x: -50, y: -50)
                    self.ReferenceOfGameScene.spriteControlPanel?.moveBy(point)
                }
                else if directon == .dr {
                    self.ReferenceOfGameScene.currentGridSizeX -= MIN_GRID_SIZE
                    self.ReferenceOfGameScene.currentGridSizeY += MIN_GRID_SIZE
                    self.ReferenceOfGameScene.virtualAnchorPoint.x -= MIN_GRID_SIZE / self.ReferenceOfGameScene.size.width
                    self.ReferenceOfGameScene.virtualAnchorPoint.y += MIN_GRID_SIZE / self.ReferenceOfGameScene.size.height
                    let point : CGPoint = CGPoint(x: 50, y: -50)
                    self.ReferenceOfGameScene.spriteControlPanel?.moveBy(point)
                }
            }
//        }

    }
    // ------
    
    
    func thereIsAnObstacleInTheWay(_ destination: CGPoint, completionHandler: (Bool?) -> ()) -> () {
        var finalAnswer = false
        
        if let pathIsBlocked = self.ReferenceOfGameScene.PathsBlocked["{\(destination.x), \(destination.y)}"] {
            if pathIsBlocked.isBlockedLand == true {
                finalAnswer = true

//                let point : CGPoint = destination
//                let x : CGFloat = point.x
//                let y : CGFloat = point.y
//                let gpmp : GamePathMatrixPoint = GamePathMatrixPoint(
//                        LandPoint: point,
//                        IsBlocked: true,
//                        spaceTime: "VOID")
//                let keyStr : String = "{\(x), \(y)}"
//                self.ReferenceOfGameScene.PathsBlocked[keyStr] = gpmp

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

                    if self is PeonUnit {
                        if (node as! SKSpriteSightNode).UnitReference is TreeUnit {
                            self.focusedTargetUnit = (node as! SKSpriteSightNode).UnitReference
                        }
                    }
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


    func forceUnitPositionTo(destination: CGPoint) {
        self.positionLogical = destination
        self.sprite.position = destination
        self.spriteMovementBlocker.position = destination
        self.spriteSight.position = destination
        self.meleeSight.position = destination
    }


    
    func issueMultiplayerAIOrderTargetingPoint(_ target: CGPoint, completionHandler: @escaping (CGPoint?) -> ()) -> () {
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
        
//        print("player isn't fucking moving \n \(self.ReferenceOfGameScene.PathsBlocked)")





        if (differenceOfX <= 0 && differenceOfY <= 0 && finishedMovingByX == false && finishedMovingByY == false) {
            let point = CGPoint(x:currentPositionOfSelf.x + 50, y:currentPositionOfSelf.y + 50)
            guard let matrix = self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"] else {
                forwardSocketMessage(direction: .ur)
                print("No address to submit")
                return
            }
            guard matrix.isBlockedLand != true else {
                return
            }
            forwardSocketMessage(direction: .ur)
        }
        else if (differenceOfX <= 0 && differenceOfY <= 0 && finishedMovingByX == true && finishedMovingByY == false) {
            let point = CGPoint(x:currentPositionOfSelf.x, y:currentPositionOfSelf.y + 50)
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"] != nil else {
                forwardSocketMessage(direction: .up)
                print("No address to submit")
                return
            }
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"]!.isBlockedLand != true else {
                return
            }
            forwardSocketMessage(direction: .up)
        }
        else if (differenceOfX >= 0 && differenceOfY <= 0 && finishedMovingByX == false && finishedMovingByY == false) {
            let point = CGPoint(x:currentPositionOfSelf.x - 50, y:currentPositionOfSelf.y + 50)
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"] != nil else {
                forwardSocketMessage(direction: .ul)
                print("No address to submit")
                return
            }
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"]!.isBlockedLand != true else {
                return
            }
            forwardSocketMessage(direction: .ul)
        }
        else if (differenceOfX >= 0 && differenceOfY <= 0 && finishedMovingByX == true && finishedMovingByY == false) {
            let point = CGPoint(x:currentPositionOfSelf.x - 50, y:currentPositionOfSelf.y + 50)
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"] != nil else {
                forwardSocketMessage(direction: .ul)
                print("No address to submit")
                return
            }
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"]!.isBlockedLand != true else {
                return
            }
            forwardSocketMessage(direction: .ul)
        }
        else if (differenceOfX >= 0 && differenceOfY >= 0 && finishedMovingByX == false && finishedMovingByY == true) {
            let point = CGPoint(x:currentPositionOfSelf.x - 50, y:currentPositionOfSelf.y)
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"] != nil else {
                forwardSocketMessage(direction: .left)
                print("No address to submit")
                return
            }
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"]!.isBlockedLand != true else {
                return
            }
            forwardSocketMessage(direction: .left)
        }
        else if (differenceOfX >= 0 && differenceOfY >= 0 && finishedMovingByX == false && finishedMovingByY == false) {
            let point = CGPoint(x:currentPositionOfSelf.x - 50, y:currentPositionOfSelf.y - 50)
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"] != nil else {
                forwardSocketMessage(direction: .dl)
                print("No address to submit")
                return
            }
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"]!.isBlockedLand != true else {
                return
            }
            forwardSocketMessage(direction: .dl)
        }
        else if (differenceOfX >= 0 && differenceOfY >= 0 && finishedMovingByX == true && finishedMovingByY == false) {
            let point = CGPoint(x:currentPositionOfSelf.x - 50, y:currentPositionOfSelf.y - 50)
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"] != nil else {
                forwardSocketMessage(direction: .dl)
                print("No address to submit")
                return
            }
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"]!.isBlockedLand != true else {
                return
            }
            forwardSocketMessage(direction: .dl)
        }
        else if (differenceOfX <= 0 && differenceOfY >= 0 && finishedMovingByX == false && finishedMovingByY == false) {
            let point = CGPoint(x:currentPositionOfSelf.x + 50, y:currentPositionOfSelf.y - 50)
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"] != nil else {
                forwardSocketMessage(direction: .dr)
                print("No address to submit")
                return
            }
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"]!.isBlockedLand != true else {
                return
            }
            forwardSocketMessage(direction: .dr)
        }
        else if (differenceOfX <= 0 && differenceOfY >= 0 && finishedMovingByX == true && finishedMovingByY == false) {
            let point = CGPoint(x:currentPositionOfSelf.x, y:currentPositionOfSelf.y - 50)
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"] != nil else {
                forwardSocketMessage(direction: .down)
                print("No address to submit")
                return
            }
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"]!.isBlockedLand != true else {
                return
            }
            forwardSocketMessage(direction: .down)
        }
        else if (differenceOfX <= 0 && differenceOfY >= 0 && finishedMovingByX == false && finishedMovingByY == true) {
            let point = CGPoint(x:currentPositionOfSelf.x + 50, y:currentPositionOfSelf.y)
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"] != nil else {
                forwardSocketMessage(direction: .right)
                print("No address to submit")
                return
            }
            guard self.ReferenceOfGameScene.PathsBlocked["{\(point.x), \(point.y)}"]!.isBlockedLand != true else {
                return
            }
            forwardSocketMessage(direction: .right)
        }
        else if finishedMovingByX != true && finishedMovingByY != true {
            print("\n\n\nENEMY IS UNREACHABLE!! \n |\(currentPositionOfSelf)| \n |\(target)|\n\n")
        }
    }
    
    func forwardSocketMessage(direction: UnitFaceAngle) {
//        print("self.uuid: \(self.uuid) \n playerSK_UUID: \(self.ReferenceOfGameScene.playerSK!.uuid)")
        if self.isAutonomous == true {
        print("AI Movement broadcasted... \(self.sprite.name)")
            self.ReferenceOfGameScene.broadcastUnitAIMovementToGameScene(self, direction)
        } else {
            if let plyr = self.ReferenceOfGameScene.playerSK {
                if self.uuid == plyr.uuid {
                    self.ReferenceOfGameScene.broadcastUnitAIMovementToGameScene(self, direction)
                }
            }
        }
    }
    
    // SINGLE PLAYER ONLY, MIGHT BE DEPRECATED AT THIS POINT:
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
        
        
        if /*currentPositionOfSelf.x < target.x &&*/ finishedMovingByX == false {
            if self.ReferenceOfGameScene.playerSK.teamNumber == 1 && self.isAutonomous == true {

                let testNode = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
                testNode.position = self.positionLogical
                self.ReferenceOfGameScene.addChildTemporary(testNode)


                let point : CGPoint = CGPoint(x:currentPositionOfSelf.x + 50, y:currentPositionOfSelf.y)
                let x : CGFloat = point.x
                let y : CGFloat = point.y
                let keyStr : String = "{\(x), \(y)}"


                if self.ReferenceOfGameScene.PathsBlocked[keyStr]!.isBlockedLand != true {
                    self.ReferenceOfGameScene.broadcastUnitAIMovementToGameScene(self, .right)
                }
            }
            /*
            OrderUnitToMoveOneStep(direction: .right, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .dr, completionHandler: { walkedDestination in
                        if walkedDestination == currentPositionOfSelf {
                            self.OrderUnitToMoveOneStep(direction: .ur, completionHandler: { walkedDestination in
                                if walkedDestination == currentPositionOfSelf {
                                        completionHandler(walkedDestination)
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
            })*/
        } else if /*currentPositionOfSelf.x > target.x &&*/ finishedMovingByX == false {
            if self.ReferenceOfGameScene.playerSK.teamNumber == 1 && self.isAutonomous == true {
                
                let testNode = SKSpriteNode(color: .yellow, size: CGSize(width: 50, height: 50))
                testNode.position = self.positionLogical
                self.ReferenceOfGameScene.addChildTemporary(testNode)



                let point : CGPoint = CGPoint(x:currentPositionOfSelf.x - 50, y:currentPositionOfSelf.y)
                let x : CGFloat = point.x
                let y : CGFloat = point.y
                let keyStr : String = "{\(x), \(y)}"


                if self.ReferenceOfGameScene.PathsBlocked[keyStr]!.isBlockedLand != true {
                    self.ReferenceOfGameScene.broadcastUnitAIMovementToGameScene(self, .left)
                }
            }
            /*
            OrderUnitToMoveOneStep(direction: .left, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .dl, completionHandler: { walkedDestination in
                        if walkedDestination == currentPositionOfSelf {
                            self.OrderUnitToMoveOneStep(direction: .ul, completionHandler: { walkedDestination in
                                if walkedDestination == currentPositionOfSelf {
                                        completionHandler(walkedDestination)
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
            })*/
        }
        else if /*currentPositionOfSelf.y < target.y &&*/ finishedMovingByY == false {
            if self.ReferenceOfGameScene.playerSK.teamNumber == 1 && self.isAutonomous == true {
                
                let testNode = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
                testNode.position = self.positionLogical
                self.ReferenceOfGameScene.addChildTemporary(testNode)

//                let point = CGPoint(x:currentPositionOfSelf.x, y:currentPositionOfSelf.y + 50)

                /* if self.ReferenceOfGameScene.PathsBlocked[String(describing: point)] != true */

                let point : CGPoint = CGPoint(x:currentPositionOfSelf.x, y:currentPositionOfSelf.y + 50)
                let x : CGFloat = point.x
                let y : CGFloat = point.y
                let keyStr : String = "{\(x), \(y)}"


                if self.ReferenceOfGameScene.PathsBlocked[keyStr]!.isBlockedLand != true {
                    self.ReferenceOfGameScene.broadcastUnitAIMovementToGameScene(self, .up)
                }
            }
            /*
            OrderUnitToMoveOneStep(direction: .up, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .ul, completionHandler: { walkedDestination in
                        if walkedDestination == currentPositionOfSelf {
                            self.OrderUnitToMoveOneStep(direction: .ur, completionHandler: { walkedDestination in
                                    if walkedDestination == currentPositionOfSelf {
                                            completionHandler(walkedDestination)
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
            })*/
        } else if /*currentPositionOfSelf.y > target.y &&*/ finishedMovingByY == false {
            if self.ReferenceOfGameScene.playerSK.teamNumber == 1 && self.isAutonomous == true {
                
                let testNode = SKSpriteNode(color: .green, size: CGSize(width: 50, height: 50))
                testNode.position = self.positionLogical
                self.ReferenceOfGameScene.addChildTemporary(testNode)

                /*
                let point = CGPoint(x:currentPositionOfSelf.x, y:currentPositionOfSelf.y - 50)

                if self.ReferenceOfGameScene.PathsBlocked[String(describing: point)] != true */

                let point : CGPoint = CGPoint(x:currentPositionOfSelf.x, y:currentPositionOfSelf.y - 50)
                let x : CGFloat = point.x
                let y : CGFloat = point.y
                let keyStr : String = "{\(x), \(y)}"


                if self.ReferenceOfGameScene.PathsBlocked[keyStr]!.isBlockedLand != true {
                    self.ReferenceOfGameScene.broadcastUnitAIMovementToGameScene(self, .down)
                }
            }
            /*
            OrderUnitToMoveOneStep(direction: .down, completionHandler: { walkedDestination in
                if walkedDestination == currentPositionOfSelf {
                    self.OrderUnitToMoveOneStep(direction: .dr, completionHandler: { walkedDestination in
                        if walkedDestination == currentPositionOfSelf {
                            self.OrderUnitToMoveOneStep(direction: .dl, completionHandler: { walkedDestination in
                                if walkedDestination == currentPositionOfSelf {
                                        completionHandler(walkedDestination)
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
            })*/
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
