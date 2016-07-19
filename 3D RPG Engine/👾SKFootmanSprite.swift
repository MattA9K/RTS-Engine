//
//  SKFootmanSprite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


// ANIMATIONS
class SKFootmanSprite: SKAbstractSprite {
    
//    override var UnitReference🔶: FootmanUnit!
    
    let AnimationDuration_WALK = 0.05
    // WALKING
    override func playWalkUPAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkUpSequence()
        }
    }
    override func playWalkDOWNAnimation() {
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
    override func playAttackUPLEFTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 8; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_ul_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "footman_ul_stand"
                self.texture = SKTexture(imageNamed: imageName)
            }
        }
    }
    override func playAttackUPRIGHTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 8; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_ur_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "footman_ur_stand"
                self.texture = SKTexture(imageNamed: imageName)
            }
        }
    }
    override func playAttackDOWNAnimation() {
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
    override func playAttackDOWNLEFTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 8; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_dl_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "footman_dl_stand"
                self.texture = SKTexture(imageNamed: imageName)
            }
        }
    }
    override func playAttackDOWNRIGHTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 8; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "footman_attack_dr0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "footman_dr_stand"
                self.texture = SKTexture(imageNamed: imageName)
            }
        }
    }
    override func playAttackLEFTAnimation() {
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
    override func playAttackRIGHTAnimation() {
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
    override func playDeathAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 4; i+=1 {
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
    
    override func playFaceDownAnimation() {
        let imageName = "footman_down_down"
        self.texture = SKTexture(imageNamed: imageName)
    }
    override func playFaceUpAnimation() {
        let imageName = "footman_up_stand"
        self.texture = SKTexture(imageNamed: imageName)
    }
    override func playFaceLeftAnimation() {
        let imageName = "footman_left_walk03"
        self.texture = SKTexture(imageNamed: imageName)
    }
    override func playFaceRightAnimation() {
        let imageName = "footman_right_stand"
        self.texture = SKTexture(imageNamed: imageName)
    }
    
    override func walkUpSequence() {
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
    override func walkDownSequence() {
        
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
    
    
    override func walkLeftSequence() {
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
    
    override func walkRightSequence() {
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