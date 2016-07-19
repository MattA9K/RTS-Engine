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
    
//    var UnitReference🔶: GruntUnit!
    
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
    
    let AnimationDuration_ATTACK = 0.1
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
    
    // ATTACKING
    func getAttackUPSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 5; i+=1 {
            let imageName = "grunt_up_attack0" + String(i)
            textures.append(SKTexture(imageNamed: imageName))
        }
        let imageName = "grunt_up_stand"
        textures.append(SKTexture(imageNamed: imageName))
        return textures
    }
    
    
    override func playAttackUPLEFTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 3; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "grunt_ul_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "grunt_ul_stand"
                self.texture = SKTexture(imageNamed: imageName)
            }
        }
    }
    override func playAttackUPRIGHTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 3; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "grunt_ur_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "grunt_ur_stand"
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
    override func playAttackDOWNLEFTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 4; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "grunt_dl_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "grunt_dl_stand"
                self.texture = SKTexture(imageNamed: imageName)
            }
        }
    }
    override func playAttackDOWNRIGHTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 4; i+=1 {
                NSThread.sleepForTimeInterval(self.AnimationDuration_ATTACK);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "grunt_dr_attack0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
            NSThread.sleepForTimeInterval(self.AnimationDuration_WALK);
            dispatch_async(dispatch_get_main_queue()) {
                let imageName = "grunt_dr_stand"
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
    
    override func playFaceDownAnimation() {
        let imageName = "grunt_down_stand"
        self.texture = SKTexture(imageNamed: imageName)
    }
    override func playFaceUpAnimation() {
        let imageName = "grunt_up_stand"
        self.texture = SKTexture(imageNamed: imageName)
    }
    override func playFaceLeftAnimation() {
        let imageName = "grunt_left_stand"
        self.texture = SKTexture(imageNamed: imageName)
    }
    override func playFaceRightAnimation() {
        let imageName = "grunt_right_stand"
        self.texture = SKTexture(imageNamed: imageName)
    }
    
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