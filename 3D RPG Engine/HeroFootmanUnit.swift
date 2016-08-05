//
//  HeroFootmanUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/18/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class HeroFootmanUnit: FootmanUnit {
    
    override init(player: Int) {
        super.init(player: player)
//        teamNumber = player // OVERRIDE PLAYER NUMBER HERE
        nameGUI = "Rullo"
        HP = 235
        Armor = 2
        DMG = 5
    }
    
    override func CastUnitClass() {
        let CastClassUnit = SKFootmanSprite(imageNamed: "footman_walk_down01")
        CastClassUnit.unitIdentifier = "Hero"
        CastClassUnit.loadTextures()
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
    }


}