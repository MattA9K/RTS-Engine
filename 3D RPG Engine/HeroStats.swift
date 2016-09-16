//
//  HeroStats.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 9/15/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation



protocol HeroStats {
    var unitReference: AbstractUnit { get set }
    
    var Level: Int { get set }
    var SpendPoints: Int { get set }
    var XP: Int { get set }
    var XP_MAX: Int { get set }
    
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
    var unitReference: AbstractUnit
    
    var Level: Int = 1
    var SpendPoints: Int = 5
    var XP: Int = 0
    var XP_MAX: Int = 500
    
    var Strength: Int = 10
    var Dexterity: Int = 5
    var Stamina: Int = 10
    var Magic: Int = 5
    
    var Strength_MAX: Int = 10
    var Dexterity_MAX: Int = 5
    var Stamina_MAX: Int = 10
    var Magic_MAX: Int = 5
    
    var BonusDMG: Int = 0
    var BonusARM: Int = 0
    var BonusHP: Int = 0
    var BonusMagic: Int = 0
    
    init(unit: AbstractUnit) {
        self.unitReference = unit
    }
    
    func addStrength() {
        Strength += 1
        SpendPoints -= 1
        BonusDMG = Int(CGFloat(Strength) * 0.1)
        autoHideLevelUpButton()
    }
    
    func addDexterity() {
        Dexterity += 1
        SpendPoints -= 1
        BonusARM = Int(CGFloat(Dexterity) * 0.1)
        autoHideLevelUpButton()
    }
    
    func addStamina() {
        Stamina += 1
        SpendPoints -= 1
        BonusHP = Int(CGFloat(Stamina) * 0.1)
        autoHideLevelUpButton()
    }
    
    func addMagic() {
        Magic += 1
        SpendPoints -= 1
        BonusMagic = Int(CGFloat(Magic) * 0.5)
        autoHideLevelUpButton()
    }
    
    func addExperience(dyingUnit: AbstractUnit) -> Bool {
        let rewardXP = dyingUnit.HP_MAX
        XP += rewardXP
        if XP >= XP_MAX {
            Level += 1
            SpendPoints += 5
            XP_MAX = Int(CGFloat(XP_MAX) * 1.5)
            XP = 0
            unitReference.HP = unitReference.HP_MAX
            return true
        } else {
            return false
        }
    }
    
    func autoHideLevelUpButton() {
        if SpendPoints <= 0 {
            SpendPoints = 0
            unitReference.ReferenceOfGameScene.spriteControlPanel?.ralleyButton.hidden = true
        }
    }
}




