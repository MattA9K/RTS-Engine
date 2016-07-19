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
    
    var UnitReference🔶: BaseUnit?
    
    func playWalkUPAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkUPAnimation()
        }
    }
    func playWalkDOWNAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkDOWNAnimation()
        }
    }
    func playWalkLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkLEFTAnimation()
        }
    }
    func playWalkRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkRIGHTAnimation()
        }
    }
    
    
    func playAttackUPAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackUPAnimation()
        }
    }
    func playAttackUPLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackUPLEFTAnimation()
        }
    }
    func playAttackUPRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackUPRIGHTAnimation()
        }
        
    }
    
    func playAttackDOWNLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackDOWNLEFTAnimation()
        }
        
    }
    func playAttackDOWNAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackDOWNAnimation()
        }
        
    }
    func playAttackDOWNRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackDOWNRIGHTAnimation()
        }
        
    }
    
    func playAttackRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackRIGHTAnimation()
        }
        
    }
    
    func playAttackLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackLEFTAnimation()
        }
        
    }
    
    func playDeathAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playDeathAnimation()
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