//
//  GruntMarineUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


class GruntMarineUnit: MeleeUnitNEW {
    
    
    init(player: Int, spawnLocation: CGPoint? = nil) {
        super.init()
        nameGUI = "Grunt"
        teamNumber = player
        HP = 50
        DMG = 3
        Armor = 3
        
        HP_MAX = 30
        DMG_MAX = 3
        Armor_MAX = 3
        CastUnitClass(spawnLocation)
        referenceSpriteToSelf()
    }
    
    func referenceSpriteToSelf() {
        (sprite as! SKGruntLvl2).UnitReference = self
    }
    
    func CastUnitClass(spawnLocation: CGPoint? = nil) {
        let CastClassUnit = SKGruntLvl2(imageNamed: "gruntLvl2_down_stand")
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        if let location = spawnLocation {
            CastClassUnit.position = location
        }
        sprite = CastClassUnit
        (sprite as! SKGruntLvl2).loadTextures()
    }
}