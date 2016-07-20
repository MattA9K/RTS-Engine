//
//  HeroFootmanUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/18/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class HeroFootmanUnit: MeleeUnit {
    
    override init(player: Int) {
        super.init(player: player)
        teamNumber = player
        HP = 35
        CastUnitClass()
        referenceSpriteToSelf()
        CastUnitReference()
    }
    
    override func referenceSpriteToSelf() {
        (sprite as! SKFootmanSprite).UnitReference = self
    }
    
    func CastUnitClass() {
        let CastClassUnit = SKFootmanSprite(imageNamed: "footman_walk_down01")
        CastClassUnit.loadTextures()
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
    }
    
    func CastUnitReference() {
        sprite.UnitReference = self
    }
    
}