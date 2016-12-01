//
//  FootmanUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/1/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class FootmanUnit: MeleeUnitNEW {
    
    init(player: Int) {
        super.init()
        nameGUI = "non_moving"
        teamNumber = player
        DMG = 3
        Armor = 1
        HP = 40
        
        HP_MAX = 22
        DMG_MAX = 3
        Armor_MAX = 1

//        referenceSpriteToSelf()
        CastUnitClass()
    }
    
    func referenceSpriteToSelf() {
//        (sprite as! SKFootmanSprite).UnitReference = self
    }
    
    func CastUnitClass() {
        let CastClassUnit = SKFootmanSprite(imageNamed: "footmanLvl1_down_stand")
        CastClassUnit.UnitReference = self
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        sprite = CastClassUnit
        (sprite as! SKFootmanSprite).loadTextures()
    }
}


class FootmanMercUnit: FootmanUnit {
    override init(player: Int) {
        super.init(player:player)
        nameGUI = "merc_unit"
    }
}
