//
//  AbstractSpriteProtocol.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/3/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation

protocol AbstractSpriteProtocol {
    
    func playWalkDOWNAnimation()
    func playWalkUPAnimation()
    func playWalkLEFTAnimation()
    func playWalkRIGHTAnimation()
    
    func playWalkULAnimation()
    func playWalkURAnimation()
    
    func playWalkDLAnimation()
    func playWalkDRAnimation()
    
    func playAttackUPAnimation()
    func playAttackUPLEFTAnimation()
    func playAttackUPRIGHTAnimation()
    
    func playAttackDOWNLEFTAnimation()
    func playAttackDOWNAnimation()
    func playAttackDOWNRIGHTAnimation()
    func playAttackRIGHTAnimation()
    func playAttackLEFTAnimation()
    
    func playDeathAnimation()
    func FixDeathAnimationHack()
}