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
        nameGUI = "Footman"
        teamNumber = player
        DMG = 3
        Armor = 1
        HP = 32
        CastUnitClass()
        referenceSpriteToSelf()
    }
    
    func referenceSpriteToSelf() {
        (sprite as! SKFootmanSprite).UnitReference = self
    }
    
    func CastUnitClass() {
        let CastClassUnit = SKFootmanSprite(imageNamed: "footman_walk_down01")
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        (sprite as! SKFootmanSprite).loadTextures()
    }
    


}


