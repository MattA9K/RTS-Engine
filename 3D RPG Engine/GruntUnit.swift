//
//  GruntUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


class GruntUnit: MeleeUnitNEW {
 
    init(player: Int) {
        super.init()
        teamNumber = player
        HP = 25
        CastUnitClass()
        referenceSpriteToSelf()
    }
    
    func referenceSpriteToSelf() {
        (sprite as! SKGruntSprite).UnitReference = self
    }

    func CastUnitClass() {
        let CastClassUnit = SKGruntSprite(imageNamed: "grunt_down_stand")
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        (sprite as! SKGruntSprite).loadTextures()
    }
}