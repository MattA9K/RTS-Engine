//
//  SKAbstractSprite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class SKAbstractSprite: SKMapSprite {
    
    var UnitReference: AbstractUnit?
    
    
    // TODO:
    
    // do something like:
    
    //
    // if self is SKFootmanSprite
    //
    // var castedUnit = (self as! SKFootmanSprite)
    // castedUnit.playWalkUPAnimation()
    //

    func playWalkDOWNAnimation() {}
    func playWalkUPAnimation() {}
    func playWalkLEFTAnimation() {}
    func playWalkRIGHTAnimation() {}
    
    func playAttackUPAnimation() {
        /*
        if let sp = (self as? SKFootmanSprite) {
            sp.playAttackUPAnimation()
        }
        if let sp = (self as? SKGruntSprite) {
            sp.playAttackUPAnimation()
        }
        if let sp = (self as? SKSpearThrowerSprite) {
            sp.playAttackUPAnimation()
        }
        */
        
        //        if self is SKFootmanSprite {
        //            (self as! SKFootmanSprite).playAttackUPAnimation()
        //        } else if self is SKGruntSprite {
        //            (self as! SKGruntSprite).playAttackUPAnimation()
        //        } else if self is SKSpearThrowerSprite {
        //            (self as! SKSpearThrowerSprite).playAttackUPAnimation()
        //        }
    }
    func playAttackUPLEFTAnimation() {
        /*
        if let sp = (self as? SKFootmanSprite) {
            sp.playAttackUPLEFTAnimation()
        }
        if let sp = (self as? SKGruntSprite) {
            sp.playAttackUPLEFTAnimation()
        }
        if let sp = (self as? SKSpearThrowerSprite) {
            sp.playAttackUPLEFTAnimation()
        }
        */
        
        //        if self is SKFootmanSprite {
        //            (self as! SKFootmanSprite).playAttackUPLEFTAnimation()
        //        } else if self is SKGruntSprite {
        //            (self as! SKGruntSprite).playAttackUPLEFTAnimation()
        //        } else if self is SKSpearThrowerSprite {
        //            (self as! SKSpearThrowerSprite).playAttackUPLEFTAnimation()
        //        }
    }
    func playAttackUPRIGHTAnimation() {
        /*
        if let sp = (self as? SKFootmanSprite) {
            sp.playAttackUPRIGHTAnimation()
        }
        if let sp = (self as? SKGruntSprite) {
            sp.playAttackUPRIGHTAnimation()
        }
        if let sp = (self as? SKSpearThrowerSprite) {
            sp.playAttackUPRIGHTAnimation()
        }
        */
        
        //        if self is SKFootmanSprite {
        //            (self as! SKFootmanSprite).playAttackUPRIGHTAnimation()
        //        } else if self is SKGruntSprite {
        //            (self as! SKGruntSprite).playAttackUPRIGHTAnimation()
        //        } else if self is SKSpearThrowerSprite {
        //            (self as! SKSpearThrowerSprite).playAttackUPRIGHTAnimation()
        //        }
        
    }
    
    func playAttackDOWNLEFTAnimation() {
        /*
        if let sp = (self as? SKFootmanSprite) {
            sp.playAttackDOWNLEFTAnimation()
        }
        if let sp = (self as? SKGruntSprite) {
            sp.playAttackDOWNLEFTAnimation()
        }
        if let sp = (self as? SKSpearThrowerSprite) {
            sp.playAttackDOWNLEFTAnimation()
        }
        */
        
    }
    func playAttackDOWNAnimation() {
        /*
        if let sp = (self as? SKFootmanSprite) {
            sp.playAttackDOWNAnimation()
        }
        if let sp = (self as? SKGruntSprite) {
            sp.playAttackDOWNAnimation()
        }
        if let sp = (self as? SKSpearThrowerSprite) {
            sp.playAttackDOWNAnimation()
        }
        */
        
        //        if self is SKFootmanSprite {
        //            (self as! SKFootmanSprite).playAttackDOWNAnimation()
        //        } else if self is SKGruntSprite {
        //            (self as! SKGruntSprite).playAttackDOWNAnimation()
        //        } else if self is SKSpearThrowerSprite {
        //            (self as! SKSpearThrowerSprite).playAttackDOWNAnimation()
        //        }
        
    }
    func playAttackDOWNRIGHTAnimation() {
        /*
        if let sp = (self as? SKFootmanSprite) {
            sp.playAttackDOWNRIGHTAnimation()
        }
        if let sp = (self as? SKGruntSprite) {
            sp.playAttackDOWNRIGHTAnimation()
        }
        if let sp = (self as? SKSpearThrowerSprite) {
            sp.playAttackDOWNRIGHTAnimation()
        }
        */
        
        //        if self is SKFootmanSprite {
        //            (self as! SKFootmanSprite).playAttackDOWNRIGHTAnimation()
        //        } else if self is SKGruntSprite {
        //            (self as! SKGruntSprite).playAttackDOWNRIGHTAnimation()
        //        } else if self is SKSpearThrowerSprite {
        //            (self as! SKSpearThrowerSprite).playAttackDOWNRIGHTAnimation()
        //        }
        
    }
    
    func playAttackRIGHTAnimation() {
        /*
        if let sp = (self as? SKFootmanSprite) {
            sp.playAttackRIGHTAnimation()
        }
        if let sp = (self as? SKGruntSprite) {
            sp.playAttackRIGHTAnimation()
        }
        if let sp = (self as? SKSpearThrowerSprite) {
            sp.playAttackRIGHTAnimation()
        }
        */
        
        //        if self is SKFootmanSprite {
        //            (self as! SKFootmanSprite).playAttackRIGHTAnimation()
        //        } else if self is SKGruntSprite {
        //            (self as! SKGruntSprite).playAttackRIGHTAnimation()
        //        } else if self is SKSpearThrowerSprite {
        //            (self as! SKSpearThrowerSprite).playAttackRIGHTAnimation()
        //        }
    }
    
    func playAttackLEFTAnimation() {
        /*
        if let sp = (self as? SKFootmanSprite) {
            sp.playAttackLEFTAnimation()
        }
        if let sp = (self as? SKGruntSprite) {
            sp.playAttackLEFTAnimation()
        }
        if let sp = (self as? SKSpearThrowerSprite) {
            sp.playAttackLEFTAnimation()
        }
        */
        
        //        if self is SKFootmanSprite {
        //            (self as! SKFootmanSprite).playAttackLEFTAnimation()
        //        } else if self is SKGruntSprite {
        //            (self as! SKGruntSprite).playAttackLEFTAnimation()
        //        } else if self is SKSpearThrowerSprite {
        //            (self as! SKSpearThrowerSprite).playAttackLEFTAnimation()
        //        }
    }
    
    func playDeathAnimation() {
        let timerToHackDeathAnimation = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("FixDeathAnimationHack"), userInfo: nil, repeats: false)
        
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playDeathAnimation()
            runAction(SKAction.fadeOutWithDuration(UnitData.DecayLength()))
            
            UnitReference!.ReferenceOfGameScene.runAction(
                SKAction.playSoundFileNamed(
                    "Hdead.wav",
                    waitForCompletion: true
                )
            )
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playDeathAnimation()
            runAction(SKAction.fadeOutWithDuration(UnitData.DecayLength()))
            
            UnitReference!.ReferenceOfGameScene.runAction(
                SKAction.playSoundFileNamed(
                    "Odead.wav",
                    waitForCompletion: true
                )
            )
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playDeathAnimation()
            runAction(SKAction.fadeOutWithDuration(UnitData.DecayLength()))
            
            UnitReference!.ReferenceOfGameScene.runAction(
                SKAction.playSoundFileNamed(
                    "Odead.wav",
                    waitForCompletion: true
                )
            )
        }
    }
    
    func FixDeathAnimationHack() {
        // Something after a delay
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playDeathHackAnimation()
            
            runAction(SKAction.fadeOutWithDuration(UnitData.DecayLength()))
        }
        
    }
    
    func playFaceDownAnimation() {}
    func playFaceUpAnimation() {}
    func playFaceLeftAnimation() {}
    func playFaceRightAnimation() {}
    
    func walkUpSequence() {}
    func walkDownSequence() {}
    func walkLeftSequence() {}
    func walkRightSequence() {}
}