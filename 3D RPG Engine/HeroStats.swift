//
//  HeroStats.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 9/15/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation



protocol HeroStats {
    var BonusDMG: Int { get set }
    var BonusARM: Int { get set }
    var BonusHP: Int { get set }
    var BonusMagic: Int { get set }
    
    var Strength: Int { get set }
    var Dexterity: Int { get set }
    var Stamina: Int { get set }
    var Magic: Int { get set }
}


class HeroStat: HeroStats {
    var Strength: Int = 10
    var Dexterity: Int = 5
    var Stamina: Int = 10
    var Magic: Int = 5
    
    var BonusDMG: Int = 0
    var BonusARM: Int = 0
    var BonusHP: Int = 0
    var BonusMagic: Int = 0
    
    func addStrength() {
        Strength += 1
        
        BonusDMG = Strength * 0.2
    }
    
    func addDexterity() {
        Dexterity += 1
        
        BonusARM = Dexterity * 0.1
    }
    
    func addStamina() {
        Stamina += 1
        
        BonusHP = Stamina
    }
    
    func addMagic() {
        Magic += 1
        
        BonusMagic = Magic * 0.5
    }
}