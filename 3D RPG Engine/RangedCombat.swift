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
    
    func OrderUnitToAttackRangedUP(targetLocation: CGPoint)
    func OrderUnitToAttackRangedDOWN(targetLocation: CGPoint)
    func OrderUnitToAttackRangedLEFT(targetLocation: CGPoint)
    func OrderUnitToAttackRangedRIGHT(targetLocation: CGPoint)
    
    func OrderUnitToAttackRangedUPLEFT(targetLocation: CGPoint)
    func OrderUnitToAttackRangedUPRIGHT(targetLocation: CGPoint)
    
    func OrderUnitToAttackRangedDOWNLEFT(targetLocation: CGPoint)
    func OrderUnitToAttackRangedDOWNRIGHT(targetLocation: CGPoint)
    
    func fireAttackRanged(unit: AbstractUnit)
    func dealDamageToPointInWorld(pointAttackedInWorld: CGPoint)
}