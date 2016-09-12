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
        DMG = 10
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