//
//  GruntRecruitUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/9/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


class GruntRecruitUnit: MeleeUnitNEW {
    
    init(player: Int, spawnLocation: CGPoint? = nil) {
        super.init()
        nameGUI = "Grunt"
        teamNumber = player
        HP = 20
        DMG = 3
        Armor = 1
        
        HP_MAX = 20
        DMG_MAX = 3
        Armor_MAX = 1
        CastUnitClass(spawnLocation)
        referenceSpriteToSelf()
    }
    
    func referenceSpriteToSelf() {
        (sprite as! SKGruntLvl1).UnitReference = self
    }
    
    func CastUnitClass(_ spawnLocation: CGPoint? = nil) {
        let CastClassUnit = SKGruntLvl1(imageNamed: "gruntLvl1_down_walk06.png")
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        if let location = spawnLocation {
            CastClassUnit.position = location
        }
        sprite = CastClassUnit
        (sprite as! SKGruntLvl1).loadTextures()
    }
}


class PeonUnit : JunkyardDogUnit {
    init(player: Int, spawnLocation: CGPoint? = nil) {
        super.init()
        nameGUI = "Grunt"
        teamNumber = player
        HP = 20
        DMG = 3
        Armor = 1

        HP_MAX = 20
        DMG_MAX = 3
        Armor_MAX = 1
        hasJunkyardDogBehavior = true

        CastUnitClass(spawnLocation)
        referenceSpriteToSelf()
    }

    func referenceSpriteToSelf() {
        (sprite as! SKGruntLvl1).UnitReference = self 
    }

    func CastUnitClass(_ spawnLocation: CGPoint? = nil) {
        let CastClassUnit = SKGruntLvl1(imageNamed: "gruntLvl1_down_walk06.png")
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        if let location = spawnLocation {
            CastClassUnit.position = location
        }
        sprite = CastClassUnit
        (sprite as! SKGruntLvl1).loadTextures()
    }
}
