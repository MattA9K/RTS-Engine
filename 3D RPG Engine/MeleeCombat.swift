//
//  MeleeCombat.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

protocol MeleeCombat {
    
    var CoolingDown: Bool { get set }
    
    func OrderUnitToAttackMeleeUP()
    func OrderUnitToAttackMeleeDOWN()
    func OrderUnitToAttackMeleeLEFT()
    func OrderUnitToAttackMeleeRIGHT()
    
    func OrderUnitToAttackMeleeUPLEFT()
    func OrderUnitToAttackMeleeUPRIGHT()
    
    func OrderUnitToAttackMeleeDOWNLEFT()
    func OrderUnitToAttackMeleeDOWNRIGHT()
    
    func fireAttackMelee(unit: AbstractUnit)
    func dealDamageToPointInWorld(pointAttackedInWorld: CGPoint)
}