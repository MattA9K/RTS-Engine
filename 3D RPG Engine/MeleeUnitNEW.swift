//
//  MeleeUnitNEW.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class MeleeUnitNEW: PathfinderUnit, MeleeCombat {
    
    var range = 50
    var CoolingDown = false
    
    func OrderUnitToAttackMeleeUP() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.melee.Range
        pointAttackedInWorld.y = attackY
        self.CoolingDown = true
        if self.ReferenceOfGameScene.playerSK.teamNumber == self.teamNumber {
            self.ReferenceOfGameScene.sendGameEventToSocket(event: .UnitAttack, unit: self)
        }
        self.sprite.playAttackUPAnimation({_ in 
            self.CoolingDown = false
            self.dealDamageToPointInWorld(pointAttackedInWorld)
        })
    }
    func OrderUnitToAttackMeleeUPLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.melee.Range
        let attackX = currentPlayerPosition.x - UnitDefaultProperty.melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.CoolingDown = true
        if self.ReferenceOfGameScene.playerSK.teamNumber == self.teamNumber {
            self.ReferenceOfGameScene.sendGameEventToSocket(event: .UnitAttack, unit: self)
        }
        self.sprite.playAttackUPLEFTAnimation({_ in
            self.CoolingDown = false
            self.dealDamageToPointInWorld(pointAttackedInWorld)
            
        })
    }
    func OrderUnitToAttackMeleeUPRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.melee.Range
        let attackX = currentPlayerPosition.x + UnitDefaultProperty.melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.CoolingDown = true
        if self.ReferenceOfGameScene.playerSK.teamNumber == self.teamNumber {
            self.ReferenceOfGameScene.sendGameEventToSocket(event: .UnitAttack, unit: self)
        }
        self.sprite.playAttackUPRIGHTAnimation({_ in
            self.CoolingDown = false
            self.dealDamageToPointInWorld(pointAttackedInWorld)
            
        })
    }
    
    func OrderUnitToAttackMeleeDOWNLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.melee.Range
        let attackX = currentPlayerPosition.x - UnitDefaultProperty.melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.CoolingDown = true
        if self.ReferenceOfGameScene.playerSK.teamNumber == self.teamNumber {
            self.ReferenceOfGameScene.sendGameEventToSocket(event: .UnitAttack, unit: self)
        }
        self.sprite.playAttackDOWNLEFTAnimation({_ in
            self.CoolingDown = false
            self.dealDamageToPointInWorld(pointAttackedInWorld)
            
        })
    }
    func OrderUnitToAttackMeleeDOWNRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.melee.Range
        let attackX = currentPlayerPosition.x + UnitDefaultProperty.melee.Range
        pointAttackedInWorld.y = attackY
        pointAttackedInWorld.x = attackX
        self.CoolingDown = true
        if self.ReferenceOfGameScene.playerSK.teamNumber == self.teamNumber {
            self.ReferenceOfGameScene.sendGameEventToSocket(event: .UnitAttack, unit: self)
        }
        self.sprite.playAttackDOWNRIGHTAnimation({_ in
            self.CoolingDown = false
            self.dealDamageToPointInWorld(pointAttackedInWorld)
            
        })
    }
    func OrderUnitToAttackMeleeDOWN() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.melee.Range
        pointAttackedInWorld.y = attackY
        self.CoolingDown = true
        if self.ReferenceOfGameScene.playerSK.teamNumber == self.teamNumber {
            self.ReferenceOfGameScene.sendGameEventToSocket(event: .UnitAttack, unit: self)
        }
        self.sprite.playAttackDOWNAnimation({_ in
            self.CoolingDown = false
            self.dealDamageToPointInWorld(pointAttackedInWorld)
            
        })
    }
    
    func OrderUnitToAttackMeleeLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x - UnitDefaultProperty.melee.Range
        pointAttackedInWorld.x = attackY
        self.CoolingDown = true
        if self.ReferenceOfGameScene.playerSK.teamNumber == self.teamNumber {
            self.ReferenceOfGameScene.sendGameEventToSocket(event: .UnitAttack, unit: self)
        }
        self.sprite.playAttackLEFTAnimation({_ in
            self.CoolingDown = false
            self.dealDamageToPointInWorld(pointAttackedInWorld)
            
        })
    }
    
    func OrderUnitToAttackMeleeRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x + UnitDefaultProperty.melee.Range
        pointAttackedInWorld.x = attackY
        print123(Reflection().getClassNameBasic(sprite))
        self.CoolingDown = true
        
        if self.ReferenceOfGameScene.playerSK.teamNumber == self.teamNumber {
            self.ReferenceOfGameScene.sendGameEventToSocket(event: .UnitAttack, unit: self)
        }
        self.sprite.playAttackRIGHTAnimation({_ in
            self.CoolingDown = false
            self.dealDamageToPointInWorld(pointAttackedInWorld)
            
        })
    }
    
    // -------------------------------------------------------
    
    func fireAttackMelee(_ unit: AbstractUnit) {
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
        
        printn("self position: \(currentPositionOfSelf)")
        printn("target position: \(unit.sprite.position)")
        printn("diff of X: \(differenceOfX)")
        printn("diff of Y: \(differenceOfY)")
        
        if unit.isDead == false  && self.isDead == false {
            if finishedMovingByY == true && finishedMovingByX == true {
                let targetFinder = MeleeTargetFinderNEW()
                targetFinder.faceTargetAndAttack(self, X: differenceOfX, Y: differenceOfY)
                //                unit.addTargetToBuffer(self)
            } else {
            }
        }
    }
    
    // THIS SHOULD BE IN THE GAME SCENE:
    func dealDamageToPointInWorld(_ pointAttackedInWorld: CGPoint) {
        let node = ReferenceOfGameScene.atPoint(pointAttackedInWorld)
        if node is SKBlockMovementSpriteNode {
            if (node as! SKBlockMovementSpriteNode).UnitReference.isDead == false {
                ReferenceOfGameScene.ThisUnitTookDamage((node as! SKBlockMovementSpriteNode), fromUnit: self)
                (node as! SKBlockMovementSpriteNode).UnitReference.alertTheReceivingUnitItIsBeingAttacked(self)
            }
        }
        
        // MAY WANT TO RESTORE THIS:
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
//            let nodesAtAttackedPoint = self.ReferenceOfGameScene.nodesAtPoint(pointAttackedInWorld)
//            for node in nodesAtAttackedPoint {
//                if node is SKSpriteSightNode {
//                    if (node as! SKSpriteSightNode).UnitReference.focusedTargetUnit?.isDead == true ||
//                        (node as! SKSpriteSightNode).UnitReference.focusedTargetUnit == nil {
//                        if (node as! SKSpriteSightNode).UnitReference.teamNumber != self.teamNumber {
//                            (node as! SKSpriteSightNode).UnitReference.focusedTargetUnit = self
//                        }
//                    }
//                }
//            }
//        }

    }
}



