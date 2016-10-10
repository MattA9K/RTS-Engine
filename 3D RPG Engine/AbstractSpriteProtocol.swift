//
//  AbstractSpriteProtocol.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/3/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation

protocol AbstractSpriteProtocol {
    
    func playWalkDOWNAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func playWalkUPAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func playWalkLEFTAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func playWalkRIGHTAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    
    func playWalkULAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func playWalkURAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    
    func playWalkDLAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func playWalkDRAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    
    func playAttackUPAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func playAttackUPLEFTAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func playAttackUPRIGHTAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    
    func playAttackDOWNLEFTAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func playAttackDOWNAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func playAttackDOWNRIGHTAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func playAttackRIGHTAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func playAttackLEFTAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    
    func playDeathAnimation(_ completionHandler: @escaping (Bool) -> ()) -> ()
    func FixDeathAnimationHack()
}
