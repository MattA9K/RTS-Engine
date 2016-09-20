//
//  SpearThrowerUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class SpearThrowerUnit: RangedUnitNEW {
    init(player: Int) {
        super.init()
        nameGUI = "Spear Thrower"
        teamNumber = player
        HP = 15
        DMG = 5
        
        HP_MAX = 15
        DMG_MAX = 10
        Armor_MAX = 0
        
        CastUnitReference()
        referenceSpriteToSelf()
    }
    
    func referenceSpriteToSelf() {
        (sprite as! SKSpearThrowerSprite).UnitReference = self
    }
    
    func CastUnitReference() {
        let CastClassUnit = SKSpearThrowerSprite(imageNamed: "spearThrower_down_stand")
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        (sprite as! SKSpearThrowerSprite).loadTextures()
    }
}


class SpearThrowerEliteUnit: RangedUnitNEW {
    init(player: Int) {
        super.init()
        nameGUI = "Spear Thrower"
        teamNumber = player
        HP = 50
        DMG = 10
        Armor = 1
        
        HP_MAX = 50
        DMG_MAX = 10
        Armor_MAX = 1
        
        CastUnitReference()
        referenceSpriteToSelf()
    }
    
    func referenceSpriteToSelf() {
        (sprite as! SKSpearElite).UnitReference = self
    }
    
    func CastUnitReference() {
        let CastClassUnit = SKSpearElite(imageNamed: "SpearElite_down_stand")
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        (sprite as! SKSpearElite).loadTextures()
    }
}


class SpearThrowerSuperUnit: RangedUnitNEW {
    init(player: Int) {
        super.init()
        nameGUI = "Spear Thrower"
        teamNumber = player
        HP = 150
        DMG = 15
        Armor = 1
        
        HP_MAX = 150
        DMG_MAX = 15
        Armor_MAX = 1
        
        CastUnitReference()
        referenceSpriteToSelf()
    }
    
    func referenceSpriteToSelf() {
        (sprite as! SKSpearSuper).UnitReference = self
    }
    
    func CastUnitReference() {
        let CastClassUnit = SKSpearSuper(imageNamed: "SpearSuper_down_stand")
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        (sprite as! SKSpearSuper).loadTextures()
    }
}