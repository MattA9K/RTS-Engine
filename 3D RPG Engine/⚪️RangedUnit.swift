//
//  RangedUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit




class RangedUnit: PathfindingUnit {
    
    func OrderUnitToAttackRangedUP_(targetLocation: CGPoint) {
        sprite.playAttackUPAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.y = bullet.position.y + 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
        let destination = bullet.position.y + UnitDefaultProperty.Ranged.Range
        bullet.runAction(SKAction.moveToY(destination, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene🔶!.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene🔶!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    func OrderUnitToAttackRangedUPLEFT_(targetLocation: CGPoint) {
        sprite.playAttackUPLEFTAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.y = bullet.position.y - 50
        bullet.position.x = bullet.position.x + 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
//        var destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToY(targetLocation.y, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene🔶!.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene🔶!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    func OrderUnitToAttackRangedUPRIGHT_(targetLocation: CGPoint) {
        sprite.playAttackUPRIGHTAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.y = bullet.position.y - 50
        bullet.position.x = bullet.position.x - 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
//        var destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToY(targetLocation.y, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene🔶!.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene🔶!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func OrderUnitToAttackRangedDOWNLEFT_(targetLocation: CGPoint) {
        sprite.playAttackDOWNLEFTAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.y = bullet.position.y + 50
        bullet.position.x = bullet.position.x + 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
//        var destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToY(targetLocation.y, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene🔶!.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene🔶!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    func OrderUnitToAttackRangedDOWNRIGHT_(targetLocation: CGPoint) {
        sprite.playAttackDOWNRIGHTAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.y = bullet.position.y + 50
        bullet.position.x = bullet.position.x - 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
//        var destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToY(targetLocation.y, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene🔶!.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene🔶!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    func OrderUnitToAttackRangedDOWN_(targetLocation: CGPoint) {
        sprite.playAttackDOWNAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.y = bullet.position.y - 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
        let destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToY(destination, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene🔶!.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene🔶!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func OrderUnitToAttackRangedLEFT_(targetLocation: CGPoint) {
        sprite.playAttackLEFTAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.x = bullet.position.x - 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
        let destination = (bullet.position.x - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToX(destination, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene🔶!.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene🔶!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func OrderUnitToAttackRangedRIGHT_(targetLocation: CGPoint) {
        sprite.playAttackRIGHTAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.x = bullet.position.x + 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
        let destination = (bullet.position.x + UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToX(destination, duration: 0.2))
        bullet.runAction(SKAction.moveToX(targetLocation.x, duration: 0.2))
        var count = 10
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            while count > -1 {
                NSThread.sleepForTimeInterval(0.02);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let attackedUnit = self.ReferenceOfGameScene🔶!.nodeAtPoint(bullet.position)
                        if attackedUnit is SKBlockMovementSpriteNode {
                            if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.isDead == false {
                                if (attackedUnit as! SKBlockMovementSpriteNode).UnitReference🔶.teamNumber != self.teamNumber {
                                    self.ReferenceOfGameScene🔶!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
                                    bullet.removeFromParent()
                                }
                            }
                        }
                    } else if count == 0 {
                        bullet.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func issueOrderTargetingPoint(target: CGPoint, unitOrder: UnitOrderWithNoTarget) {
        super.animateUnitToLookDamaged()
//        var unitIsInPosition = false
        let currentPositionOfSelf = sprite.position
        
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Current Position of Target: " + String(target.x))
        
        let differenceOfX = currentPositionOfSelf.x - target.x
        let differenceOfY = currentPositionOfSelf.y - target.y
        
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Difference X: " + String(differenceOfX))
        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("X diff: " + String(differenceOfX) + "/n Y diff: " + String(differenceOfY))
        
        var finishedMovingByX = false
        if differenceOfX <= 250 && differenceOfX >= -250 {
            finishedMovingByX = true
        }
        
        var finishedMovingByY = false
        if differenceOfY <= 250 && differenceOfY >= -250 {
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
        
        
        let movePoint = SKSpriteNode(imageNamed: "player-test")
        movePoint.position = target
        movePoint.xScale = GameSettings.SpriteScale.Default
        movePoint.yScale = GameSettings.SpriteScale.Default
        movePoint.zPosition = SpritePositionZ.AliveUnit.Z + 5
        ReferenceOfGameScene🔶?.addChild(movePoint)
        
        
        
        if finishedMovingByY == true && finishedMovingByX == true {
            let targetFinder = RangedTargetFinder()
            targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY, targetLocation: target)
        }
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.4);
            dispatch_async(dispatch_get_main_queue()) {
                self.searchAreaForEnemyTarget()
                movePoint.removeFromParent()
            }
        }
        
        
        if unitOrder == UnitOrderWithNoTarget.AttackMove {

        }
    }
    
    
    
    
    
    
    
    
    override func issueOrderTargetingUnit(unit: BaseUnit) {
        print("FUCK")
        super.animateUnitToLookDamaged()
//        var unitIsInPosition = false
        let currentPositionOfSelf = sprite.position
        
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Current Position of Target: " + String(target.x))
        
        let differenceOfX = currentPositionOfSelf.x - unit.sprite.position.x
        let differenceOfY = currentPositionOfSelf.y - unit.sprite.position.y
        
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Difference X: " + String(differenceOfX))
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("X diff: " + String(differenceOfX) + "/n Y diff: " + String(differenceOfY))
        
        var finishedMovingByX = false
        if differenceOfX <= 250 && differenceOfX >= -250 {
            finishedMovingByX = true
        }
        
        var finishedMovingByY = false
        if differenceOfY <= 250 && differenceOfY >= -250 {
            finishedMovingByY = true
        }
        
        
        if currentPositionOfSelf.x < unit.sprite.position.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepRIGHT()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepUP()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepDOWN()
                }
            }
        } else if currentPositionOfSelf.x > unit.sprite.position.x && finishedMovingByX == false {
            let tryMove = OrderUnitToMoveOneStepLEFT()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepDOWN()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepUP()
                }
            }
        }
            
        else if currentPositionOfSelf.y < unit.sprite.position.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepUP()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepLEFT()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepDOWN()
                }
            }
        } else if currentPositionOfSelf.y > unit.sprite.position.y && finishedMovingByY == false {
            let tryMove = OrderUnitToMoveOneStepDOWN()
            if tryMove == false {
                let tryMoveAgain = OrderUnitToMoveOneStepRIGHT()
                if tryMoveAgain == false {
                    OrderUnitToMoveOneStepLEFT()
                }
            }
        }
        
        
//        let movePoint = SKSpriteNode(imageNamed: "player-test")
//        movePoint.position = unit.sprite.position
//        movePoint.xScale = GameSettings.SpriteScale.Default
//        movePoint.yScale = GameSettings.SpriteScale.Default
//        movePoint.zPosition = SpritePositionZ.AliveUnit.Z + 5
//        ReferenceOfGameScene🔶?.addChild(movePoint)
        
        
//        if unitOrder == UnitOrderWithNoTarget.AttackMove {
            if finishedMovingByY == true && finishedMovingByX == true {
                let targetFinder = RangedTargetFinder()
                targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY, targetLocation: unit.sprite.position)
                
            }
//        }
    }
    
    
    
    
    
    
    
}