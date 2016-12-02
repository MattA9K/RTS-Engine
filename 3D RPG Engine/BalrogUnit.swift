//
// Created by Mateusz Andrzejczuk on 11/30/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class BalrogUnit: MeleeUnitNEW {
    init(player: Int, spawnLocation: CGPoint? = nil) {
        super.init()
        nameGUI = "Grunt"
        teamNumber = player
        HP = 350
        DMG = 13
        Armor = 3

        HP_MAX = 30
        DMG_MAX = 3
        Armor_MAX = 3
        CastUnitClass(spawnLocation)
//        referenceSpriteToSelf()
    }

    func referenceSpriteToSelf() {
        (sprite as! SKBalrog).UnitReference = self
    }

    func CastUnitClass(_ spawnLocation: CGPoint? = nil) {
        let CastClassUnit = SKBalrog(imageNamed: "balrog_down_stand")
        CastClassUnit.UnitReference = self
        CastClassUnit.xScale = 0.5
        CastClassUnit.yScale = 0.5
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        if let location = spawnLocation {
            CastClassUnit.position = location
        }
        sprite = CastClassUnit
        (sprite as! SKBalrog).load(textureSet: BALROG_TEXTURE_SET)
    }
}