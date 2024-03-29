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

/*
class GruntUnit: MeleeUnitNEW {
    init(player: Int, spawnLocation: CGPoint? = nil) {
        super.init()
        nameGUI = "Grunt"
        teamNumber = player
        HP = 25
        DMG = 3
        Armor = 1
        
        HP_MAX = 25
        DMG_MAX = 3
        Armor_MAX = 1
        
        CastUnitClass(spawnLocation)
        referenceSpriteToSelf()
    }
    
    func referenceSpriteToSelf() {
        (sprite as! SKGruntSprite).UnitReference = self
    }

    func CastUnitClass(spawnLocation: CGPoint? = nil) {
        let CastClassUnit = SKGruntSprite(imageNamed: "grunt_down_stand")
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        if let location = spawnLocation {
            CastClassUnit.position = location
        }
        sprite = CastClassUnit
        (sprite as! SKGruntSprite).loadTextures()
    }
}
*/


class GruntEliteUnit: MeleeUnitNEW {
    
    init(player: Int, spawnLocation: CGPoint? = nil) {
        super.init()
        nameGUI = "Grunt"
        teamNumber = player
        HP = 70
        DMG = 6
        Armor = 2
        
        HP_MAX = 60
        DMG_MAX = 6
        Armor_MAX = 2
        
        CastUnitClass(spawnLocation)
        referenceSpriteToSelf()
    }
    
    func referenceSpriteToSelf() {
        (sprite as! SKGruntLvl2Elite).UnitReference = self
    }
    
    func CastUnitClass(_ spawnLocation: CGPoint? = nil) {
        let CastClassUnit = SKGruntLvl2Elite(imageNamed: "gruntLvl2Elite_down_stand")
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        if let location = spawnLocation {
            CastClassUnit.position = location
        }
        sprite = CastClassUnit
        (sprite as! SKGruntLvl2Elite).loadTextures()
    }
}
