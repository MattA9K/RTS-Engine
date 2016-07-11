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
    func playWalkUPAnimation() {}
    func playWalkDOWNAnimation() {}
    func playWalkLEFTAnimation() {}
    func playWalkRIGHTAnimation() {}
    
    
    func playAttackUPAnimation() {}
    func playAttackUPLEFTAnimation() {}
    func playAttackUPRIGHTAnimation() {}
    
    func playAttackDOWNLEFTAnimation() {}
    func playAttackDOWNAnimation() {}
    func playAttackDOWNRIGHTAnimation() {}
    
    func playAttackRIGHTAnimation() {}
    func playAttackLEFTAnimation() {}
    
    
    func playDeathAnimation() {}
    
    func walkUpSequence() {}
    func walkDownSequence() {}
    func walkLeftSequence() {}
    func walkRightSequence() {}
}