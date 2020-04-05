//
//  RangedCombat.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

protocol RangedCombat {
    
    var CoolingDown: Bool { get set }
    
    func OrderUnitToAttackRangedUP(_ targetLocation: CGPoint)
    func OrderUnitToAttackRangedDOWN(_ targetLocation: CGPoint)
    func OrderUnitToAttackRangedLEFT(_ targetLocation: CGPoint)
    func OrderUnitToAttackRangedRIGHT(_ targetLocation: CGPoint)
    
    func OrderUnitToAttackRangedUPLEFT(_ targetLocation: CGPoint)
    func OrderUnitToAttackRangedUPRIGHT(_ targetLocation: CGPoint)
    
    func OrderUnitToAttackRangedDOWNLEFT(_ targetLocation: CGPoint)
    func OrderUnitToAttackRangedDOWNRIGHT(_ targetLocation: CGPoint)
    
    func fireAttackRanged(_ unit: AbstractUnit)
    func dealDamageToPointInWorld(_ pointAttackedInWorld: CGPoint)
}
