//
//  SKAbstractSprite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class SKAbstractSprite: SKMapSprite, AbstractSpriteProtocol {
    
    var UnitReference: AbstractUnit?
    
    let AnimationDuration_WALK = 0.07
    let AnimationDuration_ATTACK = 0.07
    let AnimationDuration_DEATH = 0.09
    
    var deathSound = "Hdead.wav"
    
    // ATTACK
    var attackUp_Frames: [SKTexture] = [];
    var attackDown_Frames: [SKTexture] = [];
    var attackLeft_Frames: [SKTexture] = [];
    var attackRight_Frames: [SKTexture] = [];
    
    var attackUpRight_Frames: [SKTexture] = [];
    var attackUpLeft_Frames: [SKTexture] = [];
    
    var attackDownLeft_Frames: [SKTexture] = [];
    var attackDownRight_Frames: [SKTexture] = [];
    
    var walkUp_Frames: [SKTexture] = [];
    var walkDown_Frames: [SKTexture] = [];
    var walkLeft_Frames: [SKTexture] = [];
    var walkRight_Frames: [SKTexture] = [];
    
    var walkUL_Frames: [SKTexture] = [];
    var walkUR_Frames: [SKTexture] = [];
    
    var walkDL_Frames: [SKTexture] = [];
    var walkDR_Frames: [SKTexture] = [];
    
    var deathUp_Frames: [SKTexture] = [];
    var deathDown_Frames: [SKTexture] = [];
    
    // TODO:
    
    // do something like:
    
    //
    // if self is SKFootmanSprite
    //
    // var castedUnit = (self as! SKFootmanSprite)
    // castedUnit.playWalkUPAnimation()
    //
    func playFaceUpAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                [walkUp_Frames[0]], timePerFrame: AnimationDuration_WALK))
    }
    func playFaceDownAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                [walkDown_Frames[0]], timePerFrame: AnimationDuration_WALK))
    }
    func playFaceLeftAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                [walkLeft_Frames[0]], timePerFrame: AnimationDuration_WALK))
    }
    func playFaceRightAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                [walkRight_Frames[0]], timePerFrame: AnimationDuration_WALK))
    }
    
    //---
    
    // UP
    func playFaceULAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                [walkUL_Frames[0]], timePerFrame: AnimationDuration_WALK))
    }
    func playFaceURAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                [walkUR_Frames[0]], timePerFrame: AnimationDuration_WALK))
    }
    
    // DOWN
    func playFaceDLAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                [walkDL_Frames[0]], timePerFrame: AnimationDuration_WALK))
    }
    func playFaceDRAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                [walkDR_Frames[0]], timePerFrame: AnimationDuration_WALK))
    }
    //---

    
    // UP
    func playWalkULAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            walkUL_Frames, timePerFrame: AnimationDuration_WALK)
        self.runAction(action, completion: {
            completionHandler(true)
        })
    }
    func playWalkURAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            walkUR_Frames, timePerFrame: AnimationDuration_WALK)
        self.runAction(action, completion: {
            completionHandler(true)
        })
    }
    
    // DOWN
    func playWalkDLAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            walkDL_Frames, timePerFrame: AnimationDuration_WALK)
        self.runAction(action, completion: {
            completionHandler(true)
        })
    }
    func playWalkDRAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            walkDR_Frames, timePerFrame: AnimationDuration_WALK)
        
        self.runAction(action, completion: {
            completionHandler(true)
        })
    }
    //---
    
    
    
    
//    func scanRangedAndGetUnit(unit: AbstractUnit, completionHandler: (AbstractUnit?) -> ()) -> () {
//        let positionOfSearchingUnit = unit.sprite.position
//        for pos in self.searchArea_s5 {
//            
//            var posFinal = pos
//            posFinal.x = pos.x + positionOfSearchingUnit.x
//            posFinal.y = pos.y + positionOfSearchingUnit.y
//            
//            let spritesAtPoint = self.nodesAtPoint(posFinal)
//            
//            
//            
//            
//            spritesInNodeLoop: for sprite in spritesAtPoint {
//                
//                if sprite is SKAbstractSprite {
//                    if (sprite as! SKAbstractSprite).UnitReference!.teamNumber != unit.teamNumber {
//                        completionHandler((sprite as! SKAbstractSprite).UnitReference)
//                    }
//                }
//                
//            }
//        }
//        completionHandler(nil)
//        //        completionHandler(unitsReturned)
//    }
//    
    
    func playWalkDOWNAnimation(completionHandler: (Bool?) -> ()) -> () {
        self.runAction(SKAction.animateWithTextures(
            walkDown_Frames, timePerFrame: AnimationDuration_WALK), completion: {
                completionHandler(true)
        })

    }
    func playWalkUPAnimation(completionHandler: (Bool?) -> ()) -> () {
        self.runAction(SKAction.animateWithTextures(
            walkUp_Frames, timePerFrame: AnimationDuration_WALK), completion: {
                completionHandler(true)
        })
    }
    func playWalkLEFTAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            walkLeft_Frames, timePerFrame: AnimationDuration_WALK)
        
        self.runAction(action, completion: {
            completionHandler(true)
        })
    }
    func playWalkRIGHTAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            walkRight_Frames, timePerFrame: AnimationDuration_WALK)
        
        self.runAction(action, completion: {
            completionHandler(true)
        })

    }
    
    func playAttackUPAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            attackUp_Frames, timePerFrame: AnimationDuration_ATTACK)
        self.runAction(action, completion: {
            completionHandler(true)
        })
    }
    
    func playAttackUPLEFTAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            attackUpLeft_Frames, timePerFrame: AnimationDuration_ATTACK)
        self.runAction(action, completion: {
            completionHandler(true)
        })
    }
    func playAttackUPRIGHTAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            attackUpRight_Frames, timePerFrame: AnimationDuration_ATTACK)
        
        self.runAction(action, completion: {
            completionHandler(true)
        })

    }
    
    func playAttackDOWNLEFTAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            attackDownLeft_Frames, timePerFrame: AnimationDuration_ATTACK)
        self.runAction(action, completion: {
            completionHandler(true)
        })
//        self.runAction(
//            SKAction.animateWithTextures(
//                attackDownLeft_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    func playAttackDOWNAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            attackDown_Frames, timePerFrame: AnimationDuration_ATTACK)
        
        self.runAction(action, completion: {
            completionHandler(true)
        })
//        self.runAction(
//            SKAction.animateWithTextures(
//                attackDown_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    func playAttackDOWNRIGHTAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            attackDownRight_Frames, timePerFrame: AnimationDuration_ATTACK)
        
        self.runAction(action, completion: {
            completionHandler(true)
        })
//        self.runAction(
//            SKAction.animateWithTextures(
//                attackDownRight_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    
    func playAttackRIGHTAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            attackRight_Frames, timePerFrame: AnimationDuration_ATTACK)
        
        self.runAction(action, completion: {
            completionHandler(true)
        })
//        self.runAction(
//            SKAction.animateWithTextures(
//                attackRight_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    
    func playAttackLEFTAnimation(completionHandler: (Bool?) -> ()) -> () {
        let action = SKAction.animateWithTextures(
            attackLeft_Frames, timePerFrame: AnimationDuration_ATTACK)
        
        self.runAction(action, completion: {
            completionHandler(true)
        })
//        self.runAction(
//            SKAction.animateWithTextures(
//                attackLeft_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    
    func playDeathAnimation(completionHandler: (Bool?) -> ()) -> () {
//        let timerToHackDeathAnimation = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("FixDeathAnimationHack"), userInfo: nil, repeats: false)
        
        var deathSound = "Odead.wav";
        if self is SKFootmanSprite {
            deathSound = "Hdead.wav";
        }
        else if self is SKSpearThrowerSprite {
            deathSound = "Odead.wav";
        }
        else if self is SKGruntLvl1 {
            deathSound = "Odead.wav";
        }
        else if self is SKGruntLvl2 {
            deathSound = "Odead.wav";
        }
        
        let action = SKAction.animateWithTextures(
            deathUp_Frames, timePerFrame:
            AnimationDuration_DEATH
        )
        
        self.UnitReference!.ReferenceOfGameScene.runAction(
            SKAction.playSoundFileNamed(
                deathSound,
                waitForCompletion: false
            )
        )
        
        self.runAction(action, completion: {
            completionHandler(true)
        })
//        self.runAction(
//            SKAction.animateWithTextures(
//                deathUp_Frames, timePerFrame:
//                AnimationDuration_DEATH
//            ),
//            completion: {
//                self.FixDeathAnimationHack()
//            }
//            
//        )
    
        
    }
    
    func FixDeathAnimationHack() {

        let finalDeathFrame = self.deathUp_Frames.count - 1
        
        let DeadBodyActiom = SKAction.animateWithTextures(
            [deathUp_Frames[finalDeathFrame]], timePerFrame:
            AnimationDuration_ATTACK
        )
        
        self.runAction(DeadBodyActiom, completion: {
            self.runAction(DeadBodyActiom)
            self.zPosition = 1
        })
        
        
        let delayAction = SKAction.waitForDuration(1.32)
        self.runAction(delayAction, completion: {
            self.runAction(DeadBodyActiom)
        })
        

        
        /*
        self.runAction(
            SKAction.animateWithTextures(
                [deathUp_Frames[finalDeathFrame]], timePerFrame:
                AnimationDuration_ATTACK
            )
        )
        */
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let unit = self.UnitReference {
            unit.ReferenceOfGameScene.UnitWasSelectedByThePlayer(unit)
        }
    }
    
    func walkUpSequence() {}
    func walkDownSequence() {}
    func walkLeftSequence() {}
    func walkRightSequence() {}
}