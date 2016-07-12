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
    
    override func OrderUnitToAttackRangedUP() {
        sprite.playAttackUPAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.y = bullet.position.y + 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
        let destination = bullet.position.y + UnitDefaultProperty.Ranged.Range
        bullet.runAction(SKAction.moveToY(destination, duration: 0.2))
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
                                    self.ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
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
    override func OrderUnitToAttackRangedUPLEFT() {
    
    }
    override func OrderUnitToAttackRangedUPRIGHT() {
    
    }
    
    override func OrderUnitToAttackRangedDOWNLEFT() {
    
    }
    override func OrderUnitToAttackRangedDOWNRIGHT() {
    
    }
    override func OrderUnitToAttackRangedDOWN() {
        sprite.playAttackDOWNAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.y = bullet.position.y - 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
        let destination = (bullet.position.y - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToY(destination, duration: 0.2))
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
                                    self.ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
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
    
    override func OrderUnitToAttackRangedLEFT() {
        sprite.playAttackLEFTAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.x = bullet.position.x - 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
        let destination = (bullet.position.x - UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToX(destination, duration: 0.2))
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
                                    self.ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
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
    
    override func OrderUnitToAttackRangedRIGHT() {
        sprite.playAttackRIGHTAnimation()
        let bullet = SKRangedBullet(imageNamed: "AttackBullet")
        bullet.position = self.spriteMovementBlocker.position
        bullet.position.x = bullet.position.x + 50
        bullet.zPosition = SpritePositionZ.AliveUnit.Z
        ReferenceOfGameScene🔶?.addChild(bullet)
        let destination = (bullet.position.x + UnitDefaultProperty.Ranged.Range)
        bullet.runAction(SKAction.moveToX(destination, duration: 0.2))
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
                                    self.ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitTookDamage((attackedUnit as! SKBlockMovementSpriteNode))
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
        var unitIsInPosition = false
        let currentPositionOfSelf = sprite.position
        
        //        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole("Current Position of Target: " + String(target.x))
        
        var differenceOfX = currentPositionOfSelf.x - target.x
        var differenceOfY = currentPositionOfSelf.y - target.y
        
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
        
        
        if unitOrder == UnitOrderWithNoTarget.AttackMove {
            if finishedMovingByY == true && finishedMovingByX == true {
                let targetFinder = RangedTargetFinder()
                targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY)
            }
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
                NSThread.sleepForTimeInterval(0.4);
                dispatch_async(dispatch_get_main_queue()) {
                    self.searchAreaForEnemyTarget()
                }
            }
        }
    }
}