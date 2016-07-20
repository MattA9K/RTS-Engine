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
    
    func playWalkUPAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkUPAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playWalkUPAnimation()
        }
    }
    func playWalkDOWNAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkDOWNAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playWalkDOWNAnimation()
        }
    }
    func playWalkLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkLEFTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playWalkLEFTAnimation()
        }
    }
    func playWalkRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playWalkRIGHTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playWalkRIGHTAnimation()
        }
    }
    
    
    func playAttackUPAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackUPAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackUPAnimation()
        }
    }
    func playAttackUPLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackUPLEFTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackUPLEFTAnimation()
        }
    }
    func playAttackUPRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackUPRIGHTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackUPRIGHTAnimation()
        }
        
    }
    
    func playAttackDOWNLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackDOWNLEFTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackDOWNLEFTAnimation()
        }
        
    }
    func playAttackDOWNAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackDOWNAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackDOWNAnimation()
        }
        
    }
    func playAttackDOWNRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackDOWNRIGHTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackDOWNRIGHTAnimation()
        }
        
    }
    
    func playAttackRIGHTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackRIGHTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackRIGHTAnimation()
        }
        
    }
    
    func playAttackLEFTAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playAttackLEFTAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playAttackLEFTAnimation()
        }
        
    }
    
    func playDeathAnimation() {
        if self is SKFootmanSprite {
            (self as! SKFootmanSprite).playDeathAnimation()
        } else if self is SKGruntSprite {
            (self as! SKGruntSprite).playDeathAnimation()
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