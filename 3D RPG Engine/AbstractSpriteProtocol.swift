//
//  AbstractSpriteProtocol.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/3/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation

protocol AbstractSpriteProtocol {
    
    func playWalkDOWNAnimation(completionHandler: (Bool?) -> ())
    func playWalkUPAnimation(completionHandler: (Bool?) -> ())
    func playWalkLEFTAnimation(completionHandler: (Bool?) -> ())
    func playWalkRIGHTAnimation(completionHandler: (Bool?) -> ())
    
    func playWalkULAnimation(completionHandler: (Bool?) -> ())
    func playWalkURAnimation(completionHandler: (Bool?) -> ())
    
    func playWalkDLAnimation(completionHandler: (Bool?) -> ())
    func playWalkDRAnimation(completionHandler: (Bool?) -> ())
    
    func playAttackUPAnimation(completionHandler: (Bool?) -> ())
    func playAttackUPLEFTAnimation(completionHandler: (Bool?) -> ())
    func playAttackUPRIGHTAnimation(completionHandler: (Bool?) -> ())
    
    func playAttackDOWNLEFTAnimation(completionHandler: (Bool?) -> ())
    func playAttackDOWNAnimation(completionHandler: (Bool?) -> ())
    func playAttackDOWNRIGHTAnimation(completionHandler: (Bool?) -> ())
    func playAttackRIGHTAnimation(completionHandler: (Bool?) -> ())
    func playAttackLEFTAnimation(completionHandler: (Bool?) -> ())
    
    func playDeathAnimation(completionHandler: (Bool?) -> ())
    func FixDeathAnimationHack()
}