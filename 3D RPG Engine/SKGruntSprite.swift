//
//  SKGruntSprite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class SKGruntSprite: SKAbstractSprite {
    let AnimationDuration_WALK = 0.05
    // WALKING
    override func playWalkUPAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkUpSequence()
        }
    }
    override func playWalkDOWNAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkDownSequence()
        }
    }
    override func playWalkLEFTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkLeftSequence()
        }
    }
    override func playWalkRIGHTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkRightSequence()
        }
    }
    
    let AnimationDuration_ATTACK = 0.05
    // ATTACKING
    override func playAttackUPAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 5; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "grunt_up_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "grunt_up_stand"
                self.texture = SKTexture(imageNamed: imageName)
            }
        }
    }
    override func playAttackDOWNAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 6; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "grunt_down_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "grunt_down_stand"
                self.texture = SKTexture(imageNamed: imageName)
            }
        }
    }
    override func playAttackLEFTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 5; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "grunt_left_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
        }
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_left_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
    }
    override func playAttackRIGHTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 5; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "grunt_right_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "grunt_right_stand"
                self.texture = SKTexture(imageNamed: imageName)
            }
        }
    }
    
    
    //DEATH
    override func playDeathAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 4; i+=1 {
                NSThread.sleepForTimeInterval(0.07);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "grunt_death_down0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
        }
    }
}




extension SKGruntSprite {
    override func walkUpSequence() {
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_up_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_up_walk02"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_up_walk01"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_up_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_up_walk03"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_up_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
    }
    override func walkDownSequence() {
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_down_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_down_walk02"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_down_walk01"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_down_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_down_walk03"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_down_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
    }
    
    
    override func walkLeftSequence() {
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_left_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_left_walk02"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_left_walk01"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_left_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_left_walk03"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_left_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
    }
    
    override func walkRightSequence() {
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_right_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_right_walk02"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_right_walk01"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_right_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_right_walk03"
            self.texture = SKTexture(imageNamed: imageName)
        }
        
        NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
        dispatch_async(dispatch_get_main_queue()) {
            let imageName = "grunt_right_stand"
            self.texture = SKTexture(imageNamed: imageName)
        }
    }
}