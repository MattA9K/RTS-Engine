//
//  FootmanUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/1/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class FootmanUnit: BaseUnit {
    
    override init(unit: Actor, scene: GameScene) {
        super.init(unit: unit, scene: scene)
        
        let CastClassUnit = SKFootmanSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = 1.2
        CastClassUnit.yScale = 1.2
        CastClassUnit.position = unit.pointCG
        CastClassUnit.name = unit.unitType
        sprite = CastClassUnit
    }
    
    func OrderUnitToMoveOneStepUP() {
        let destination = ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.position.y + UnitDefaultProperty.Movement.Range
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.angleFacing = UnitFaceAngle.Up
        (self.sprite as! SKFootmanSprite).playWalkUPAnimation()
    }
    func OrderUnitToMoveOneStepDOWN() {
        let destination = ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.position.y - UnitDefaultProperty.Movement.Range
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.angleFacing = UnitFaceAngle.Down
        (self.sprite as! SKFootmanSprite).playWalkDOWNAnimation()
    }
    func OrderUnitToMoveOneStepLEFT() {
        let destination = ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.position.x - UnitDefaultProperty.Movement.Range
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.angleFacing = UnitFaceAngle.Left
        (self.sprite as! SKFootmanSprite).playWalkLEFTAnimation()
    }
    func OrderUnitToMoveOneStepRIGHT() {
        let destination = ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.position.x + UnitDefaultProperty.Movement.Range
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.angleFacing = UnitFaceAngle.Right
        (self.sprite as! SKFootmanSprite).playWalkRIGHTAnimation()
    }
}



// ANIMATIONS
class SKFootmanSprite: SKSpriteNode {
    
    let AnimationDuration_WALK = 1.07
    
    // WALKING
    func playWalkUPAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 5; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_up_walk0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
        }
    }
    func playWalkDOWNAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 5; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_down_walk0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
        }
    }
    func playWalkLEFTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 5; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_left_walk0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
        }
    }
    func playWalkRIGHTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 5; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_right_walk0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
        }
    }
    
    
    //DEATH
    func playDeathAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 5; i+=1 {
                NSThread.sleepForTimeInterval(0.07);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_death_up0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
        }
    }
}