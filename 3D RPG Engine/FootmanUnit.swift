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
        CastClassUnit.xScale = 4.2
        CastClassUnit.yScale = 4.2
        CastClassUnit.position = unit.pointCG
        CastClassUnit.name = unit.unitType
        sprite = CastClassUnit
    }
    
    func OrderUnitToMoveOneStepUP() {
        let destination = ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.position.y + UnitDefaultProperty.Movement.Range
        (self.sprite as! SKFootmanSprite).playWalkUPAnimation()
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.angleFacing = UnitFaceAngle.Up
    }
    func OrderUnitToMoveOneStepDOWN() {
        let destination = ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.position.y - UnitDefaultProperty.Movement.Range
        (self.sprite as! SKFootmanSprite).playWalkDOWNAnimation()
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.angleFacing = UnitFaceAngle.Down
    }
    func OrderUnitToMoveOneStepLEFT() {
        let destination = ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.position.x - UnitDefaultProperty.Movement.Range
        (self.sprite as! SKFootmanSprite).playWalkLEFTAnimation()
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.angleFacing = UnitFaceAngle.Left
    }
    func OrderUnitToMoveOneStepRIGHT() {
        let destination = ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.position.x + UnitDefaultProperty.Movement.Range
        (self.sprite as! SKFootmanSprite).playWalkRIGHTAnimation()
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.playerSK.angleFacing = UnitFaceAngle.Right
    }
}



// ANIMATIONS
class SKFootmanSprite: SKSpriteNode {
    
    let AnimationDuration_WALK = 0.05
    // WALKING
    func playWalkUPAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkUpSequence()
        }
    }
    func playWalkDOWNAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 4; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_walk_down0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
        }
    }
    func playWalkLEFTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkLeftSequence()
        }
    }
    func playWalkRIGHTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkRightSequence()
        }
    }
    
    let AnimationDuration_ATTACK = 0.05
    // ATTACKING
    func playAttackUPAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 7; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_attack_up0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "footman_up_stand"
                self.texture = SKTexture(imageNamed: imageName)
            }
        }
    }
    func playAttackDOWNAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 8; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_attack_down0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "footman_down_down"
                self.texture = SKTexture(imageNamed: imageName)
            }
        }
    }
    func playAttackLEFTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 8; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_left_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
        }
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_left_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
    }
    func playAttackRIGHTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 8; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_right_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "footman_right_stand"
                self.texture = SKTexture(imageNamed: imageName)
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


extension SKFootmanSprite {
    func walkUpSequence() {
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_up_walk01"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_up_walk02"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_up_walk01"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_up_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_up_walk03"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_up_walk04"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_up_walk03"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_up_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
    }
    func walkDownSequence() {
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_walk_down01"
            self.texture = SKTexture(imageNamed: imageName)
        }
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_walk_down02"
            self.texture = SKTexture(imageNamed: imageName)
        }
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_walk_down"
            self.texture = SKTexture(imageNamed: imageName)
        }
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_walk_down03"
            self.texture = SKTexture(imageNamed: imageName)
        }
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_walk_down04"
            self.texture = SKTexture(imageNamed: imageName)
        }
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_down_down"
            self.texture = SKTexture(imageNamed: imageName)
        }
    }
    
    
    func walkLeftSequence() {
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_left_walk01"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_left_walk02"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_left_walk01"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_left_walk03"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_left_walk04"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_left_walk05"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_left_walk04"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_left_walk03"
            self.texture = SKTexture(imageNamed: imageName)
        }
    }
    
    func walkRightSequence() {
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_right_walk01"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_right_walk02"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_right_walk03"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_right_walk04"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_right_walk05"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "footman_right_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
    }
}