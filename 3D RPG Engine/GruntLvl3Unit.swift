//
//  GruntLvl3Unit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 9/22/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


class GruntLvl3Unit: MeleeUnitNEW {
    init(player: Int, spawnLocation: CGPoint? = nil) {
        super.init()
        nameGUI = "Grunt"
        teamNumber = player
        HP = 150
        DMG = 13
        Armor = 3
        
        HP_MAX = 30
        DMG_MAX = 3
        Armor_MAX = 3
        CastUnitClass(spawnLocation)
        referenceSpriteToSelf()
    }
    
    func referenceSpriteToSelf() {
        (sprite as! SKGruntLvl3).UnitReference = self
    }
    
    func CastUnitClass(_ spawnLocation: CGPoint? = nil) {
        let CastClassUnit = SKGruntLvl3(imageNamed: "gruntLvl3_down_stand")
        CastClassUnit.xScale = 0.35
        CastClassUnit.yScale = 0.35
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        if let location = spawnLocation {
            CastClassUnit.position = location
        }
        sprite = CastClassUnit
        (sprite as! SKGruntLvl3).loadTextures()
    }
}


class GruntLvl4Unit: MeleeUnitNEW {
    init(player: Int, spawnLocation: CGPoint? = nil) {
        super.init()
        nameGUI = "Grunt"
        teamNumber = player
        HP = 170
        DMG = 15
        Armor = 4
        
        HP_MAX = 170
        DMG_MAX = 15
        Armor_MAX = 4
        CastUnitClass(spawnLocation)
        referenceSpriteToSelf()
    }
    
    func referenceSpriteToSelf() {
        (sprite as! SKGruntLvl4).UnitReference = self
    }
    
    func CastUnitClass(_ spawnLocation: CGPoint? = nil) {
        let CastClassUnit = SKGruntLvl4(imageNamed: "gruntLvl4_down_stand")
        CastClassUnit.xScale = 0.34
        CastClassUnit.yScale = 0.34
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        if let location = spawnLocation {
            CastClassUnit.position = location
        }
        sprite = CastClassUnit
        (sprite as! SKGruntLvl4).loadTextures()
    }
}



