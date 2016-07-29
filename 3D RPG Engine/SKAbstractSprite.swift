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
    
    var UnitReference: BaseUnit?
    
    
    // TODO:
    
    // do something like:
    
    //
    // if self is SKFootmanSprite
    //
    // var castedUnit = (self as! SKFootmanSprite)
    // castedUnit.playWalkUPAnimation()
    //
    
    func playWalkUPAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkUPAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playWalkUPAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playWalkUPAnimation()
        }
    }
    func playWalkDOWNAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkDOWNAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playWalkDOWNAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playWalkDOWNAnimation()
        }
    }
    func playWalkLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkLEFTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playWalkLEFTAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playWalkLEFTAnimation()
        }
    }
    func playWalkRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkRIGHTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playWalkRIGHTAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playWalkRIGHTAnimation()
        }
    }
    
    
    func playAttackUPAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackUPAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackUPAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playAttackUPAnimation()
        }
    }
    func playAttackUPLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackUPLEFTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackUPLEFTAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playAttackUPLEFTAnimation()
        }
    }
    func playAttackUPRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackUPRIGHTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackUPRIGHTAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playAttackUPRIGHTAnimation()
        }
        
    }
    
    func playAttackDOWNLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackDOWNLEFTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackDOWNLEFTAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playAttackDOWNLEFTAnimation()
        }
        
    }
    func playAttackDOWNAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackDOWNAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackDOWNAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playAttackDOWNAnimation()
        }
        
    }
    func playAttackDOWNRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackDOWNRIGHTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackDOWNRIGHTAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playAttackDOWNRIGHTAnimation()
        }
        
    }
    
    func playAttackRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackRIGHTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackRIGHTAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playAttackRIGHTAnimation()
        }
    }
    
    func playAttackLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackLEFTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackLEFTAnimation()
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playAttackLEFTAnimation()
        }
    }
    
    func playDeathAnimation() {
        
        let timerToHackDeathAnimation = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("FixDeathAnimationHack"), userInfo: nil, repeats: false)
        
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playDeathAnimation()
            runAction(SKAction.fadeOutWithDuration(UnitData.DecayLength()))
            
            UnitReference!.ReferenceOfGameScene!.runAction(
                SKAction.playSoundFileNamed(
                    "Hdead.wav",
                    waitForCompletion: true
                )
            )
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playDeathAnimation()
            runAction(SKAction.fadeOutWithDuration(UnitData.DecayLength()))
            
            UnitReference!.ReferenceOfGameScene!.runAction(
                SKAction.playSoundFileNamed(
                    "Odead.wav",
                    waitForCompletion: true
                )
            )
        } else if self is SKSpearThrowerSprite {
            (self as! SKSpearThrowerSprite).playDeathAnimation()
            runAction(SKAction.fadeOutWithDuration(UnitData.DecayLength()))
            
            UnitReference!.ReferenceOfGameScene!.runAction(
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