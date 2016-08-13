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
        let CastClassUnit = SKFootmanSprite(imageNamed: "footmanLvl1_down_stand")
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        (sprite as! SKFootmanSprite).loadTextures()
    }
    


}


