//
//  DummyGruntSprite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/30/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class GruntSprite: BaseUnit {
    

 
    override func unitIsNowDying() {
        super.unitIsNowDying()
        (sprite as! SKDummyGruntSprite).playDeathAnimation()
    }
    
    override func animateUnitToLookDamaged() {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.25);
            dispatch_async(dispatch_get_main_queue()) {
                self.sprite.texture = SKTexture(imageNamed: "dummy02")
            }
            NSThread.sleepForTimeInterval(0.15);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "dummy01"
                    self.sprite.texture = SKTexture(imageNamed: imageName)
                }
        }
    }
}



// ANIMATIONS
class SKDummyGruntSprite: SKAbstractSprite {
    override func playDeathAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 9; i+=1 {
                NSThread.sleepForTimeInterval(0.07);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "dummy0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                    self.zPosition = SpritePositionZ.DeadUnit.Z
                }
            }
        }
    }
}