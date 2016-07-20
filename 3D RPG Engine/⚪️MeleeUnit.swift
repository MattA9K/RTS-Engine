//
//  MeleeUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class MeleeUnit: PathfindingUnit {
    
    
    override func OrderUnitToAttackMeleeUP() {
        
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
        pointAttackedInWorld.y = attackY
        sprite.playAttackUPAnimation()
        
        let attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.1);
            dispatch_async(dispatch_get_main_queue()) {
                attackedUnit.hidden = false
            }
        }
        dealDamageToPointInWorld(pointAttackedInWorld)
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeUPLEFT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
            let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.y = attackY
            pointAttackedInWorld.x = attackX
            sprite.playAttackUPLEFTAnimation()
            
//            var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeUPRIGHT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            
            let attackY = currentPlayerPosition.y + UnitDefaultProperty.Melee.Range
            let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.y = attackY
            pointAttackedInWorld.x = attackX
            
            sprite.playAttackUPRIGHTAnimation()
            
//            var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    
    override func OrderUnitToAttackMeleeDOWN() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.y = attackY
            sprite.playAttackDOWNAnimation()
//            var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeDOWNLEFT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
            let attackX = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.y = attackY
            pointAttackedInWorld.x = attackX
            sprite.playAttackDOWNLEFTAnimation()
//            var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeDOWNRIGHT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.y - UnitDefaultProperty.Melee.Range
            let attackX = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.y = attackY
            pointAttackedInWorld.x = attackX
            sprite.playAttackDOWNRIGHTAnimation()
//            var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    
    
    override func OrderUnitToAttackMeleeLEFT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.x - UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.x = attackY
            sprite.playAttackLEFTAnimation()
//            var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
        //        dealDamageToAttackedUnit(pointAttackedInWorld, attackedUnit: attackedUnit)
    }
    override func OrderUnitToAttackMeleeRIGHT() {
        if isDead == false {
            let currentPlayerPosition = sprite.position
            var pointAttackedInWorld = currentPlayerPosition
            let attackY = currentPlayerPosition.x + UnitDefaultProperty.Melee.Range
            pointAttackedInWorld.x = attackY
            sprite.playAttackRIGHTAnimation()
//            var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
            dealDamageToPointInWorld(pointAttackedInWorld)
        }
        
    }
    
    
    
    func dealDamageToAttackedUnit(pointAttackedInWorld: CGPoint, attackedUnit: SKNode) {
//        if let IDOfAttackedUnit = attackedUnit.name {
            //            ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitInTheSceneTookDamage(IDOfAttackedUnit)
//            ReferenceOfGameScene🔶!.showDamagedPoint(pointAttackedInWorld)
//        }
    }
    
    func dealDamageToPointInWorld(pointAttackedInWorld: CGPoint) {
        let nodesAtAttackedPoint = ReferenceOfGameScene🔶!.nodesAtPoint(pointAttackedInWorld)
        
        for node in nodesAtAttackedPoint {
            if node is SKBlockMovementSpriteNode {
                let name = ((node as! SKBlockMovementSpriteNode).UnitReference🔶 as BaseUnit).sprite.name
                ReferenceOfGameScene🔶!.ThisUnitTookDamage((node as! SKBlockMovementSpriteNode))
                print("ATTACKED A UNIT!!!")
                print(name!)
            }
        }
        
        ReferenceOfGameScene🔶!.showDamagedPoint(pointAttackedInWorld)
    }
    
    
    
    
    
    
    
    
    
    override func issueOrderTargetingPoint(target: CGPoint, unitOrder: UnitOrderWithNoTarget) {
        print("FUCK")
        super.animateUnitToLookDamaged()
//        var unitIsInPosition = false
        let currentPositionOfSelf = sprite.position
        
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Current Position of Target: " + String(target.x))
        
        let differenceOfX = currentPositionOfSelf.x - target.x
        let differenceOfY = currentPositionOfSelf.y - target.y
        
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Difference X: " + String(differenceOfX))
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("X diff: " + String(differenceOfX) + "/n Y diff: " + String(differenceOfY))
        
        var finishedMovingByX = false
        if differenceOfX <= 50 && differenceOfX >= -50 {
            finishedMovingByX = true
        }
        
        var finishedMovingByY = false
        if differenceOfY <= 50 && differenceOfY >= -50 {
            finishedMovingByY = true
        }
        
        
        if currentPositionOfSelf.x < target.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepRIGHT()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepUP()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepDOWN()
                }
            }
        } else if currentPositionOfSelf.x > target.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepDOWN()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepUP()
                }
            }
        }
            
        else if currentPositionOfSelf.y < target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepUP()
            if tryMove == false {
                
                
                
                let tryMoveAgain = OrderUnitToMoveOneStepLEFT()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepDOWN()
                }
            }
        } else if currentPositionOfSelf.y > target.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepDOWN()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepRIGHT()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepLEFT()
                }
            }
        }
        
        
        if unitOrder == UnitOrderWithNoTarget.AttackMove {
            if finishedMovingByY == true && finishedMovingByX == true {
                let targetFinder = MeleeTargetFinder()
                targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY)
            }
            
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//                NSThread.sleepForTimeInterval(0.4);
//                dispatch_async(dispatch_get_main_queue()) {
//                    self.searchAreaForEnemyTarget()
//                }
//            }
        }
    }
    
    
    override func issueOrderTargetingUnit(unit: BaseUnit) {
//        var unitIsInPosition = false
        let currentPositionOfSelf = sprite.position
        
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Current Position of Target: " + String(target.x))
        
        let differenceOfX = currentPositionOfSelf.x - unit.sprite.position.x
        let differenceOfY = currentPositionOfSelf.y - unit.sprite.position.y
        
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Difference X: " + String(differenceOfX))
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("X diff: " + String(differenceOfX) + "/n Y diff: " + String(differenceOfY))
        
        var finishedMovingByX = false
        if differenceOfX <= 50 && differenceOfX >= -50 {
            finishedMovingByX = true
        }
        
        var finishedMovingByY = false
        if differenceOfY <= 50 && differenceOfY >= -50 {
            finishedMovingByY = true
        }
        
        
//        printToConsole("Orc position: " + String(sprite.position))
//        printToConsole("Player position: " + String(unit.sprite.position))
//        printToConsole("Finished moving by X and Y:")
//        printToConsole(String(finishedMovingByX) + " " + String(finishedMovingByY))
//        printToConsole("Target Difference by X and Y:")
//        printToConsole(String(differenceOfX) + " " + String(differenceOfY))
        
        
        if currentPositionOfSelf.x < unit.sprite.position.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepRIGHT()
//            if tryMove == false {
//                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//                    NSThread.sleepForTimeInterval(0.51);
//                    dispatch_async(dispatch_get_main_queue()) {
//                        let tryMoveAgain = self.OrderUnitToMoveOneStepRIGHT()
//                        if tryMoveAgain == false {
//                            self.OrderUnitToMoveOneStepUP()
//                        }
//                    }
//                }
//            }
        } else if currentPositionOfSelf.x > unit.sprite.position.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT()
//            if tryMove == false {
//                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//                    NSThread.sleepForTimeInterval(0.51);
//                    dispatch_async(dispatch_get_main_queue()) {
//                        let tryMoveAgain = self.OrderUnitToMoveOneStepLEFT()
//                        if tryMoveAgain == false {
//                            self.OrderUnitToMoveOneStepDOWN()
//                        }
//                    }
//                }
//            }
        }
        else if currentPositionOfSelf.y < unit.sprite.position.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepUP()
//            if tryMove == false {
//                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//                    NSThread.sleepForTimeInterval(0.51);
//                    dispatch_async(dispatch_get_main_queue()) {
//                        let tryMoveAgain = self.OrderUnitToMoveOneStepUP()
//                        if tryMoveAgain == false {
//                            self.OrderUnitToMoveOneStepLEFT()
//                        }
//                    }
//                }
//            }
        } else if currentPositionOfSelf.y > unit.sprite.position.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepDOWN()
//            if tryMove == false {
//                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//                    NSThread.sleepForTimeInterval(0.51);
//                    dispatch_async(dispatch_get_main_queue()) {
//                        let tryMoveAgain = self.OrderUnitToMoveOneStepDOWN()
//                        if tryMoveAgain == false {
//                            self.OrderUnitToMoveOneStepRIGHT()
//                        }
//                    }
//                }
//            }
        }
        
        
//        let selfLocation = self.sprite.position
//        let enemyLocation = unit.sprite.position
//        let dx = selfLocation.x - enemyLocation.x
//        let dy = selfLocation.y - enemyLocation.y
//        let distance = sqrt(dx*dx + dy*dy)

        if unit.isDead == false {
            
            if finishedMovingByY == true && finishedMovingByX == true {
                
                self.printToConsole("trying to face and attack target.")
                let targetFinder = MeleeTargetFinder()
                targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY)
                unit.addTargetToBuffer(self)

            } else {

            }
            
        }
        
//        if unitOrder == UnitOrderWithNoTarget.AttackMove {
//        }
    }
    
    
    
    //                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
    //                                NSThread.sleepForTimeInterval(0.41);
    //                                dispatch_async(dispatch_get_main_queue()) {
    //                                    self.issueOrderTargetingUnit(unit, unitOrder: .AttackMove)
    //                                }
    //                            }
    
    
}