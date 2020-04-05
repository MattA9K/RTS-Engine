//
// Created by Mateusz Andrzejczuk on 11/30/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit








class StructureUnit : AbstractUnit {

}



class OrcHutUnit: StructureUnit {
    init(player: Int, spawnLocation: CGPoint? = nil) {
        super.init()
        nameGUI = "Hut"
        teamNumber = player
        HP = 350
        DMG = 13
        Armor = 3

        HP_MAX = 30
        DMG_MAX = 3
        Armor_MAX = 3
        CastUnitClass(spawnLocation)
        referenceSpriteToSelf()
    }

    func referenceSpriteToSelf() {
        (sprite as! CSKOrcHut).UnitReference = self
    }

    func CastUnitClass(_ spawnLocation: CGPoint? = nil) {
        let CastClassUnit = CSKOrcHut(imageNamed: "OrcHut.png")
        CastClassUnit.xScale = 0.5
        CastClassUnit.yScale = 0.5
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        if let location = spawnLocation {
            CastClassUnit.position = location
        }
        sprite = CastClassUnit
        (sprite as! CSKOrcHut).loadTextures()
    }
}


class OrcHutHatcheryUnit : HatcheryUnit {
    init(player: Int, spawnLocation: CGPoint? = nil) {
        super.init()
        nameGUI = "Hut"
        teamNumber = player
        HP = 350
        DMG = 13
        Armor = 3

        HP_MAX = 30
        DMG_MAX = 3
        Armor_MAX = 3
        hasHatcheryBehavior = true

        CastUnitClass(spawnLocation)
        referenceSpriteToSelf()
    }

    func referenceSpriteToSelf() {
        (sprite as! CSKOrcHut).UnitReference = self
    }

    func CastUnitClass(_ spawnLocation: CGPoint? = nil) {
        let CastClassUnit = CSKOrcHut(imageNamed: "OrcHut.png")
        CastClassUnit.xScale = 0.5
        CastClassUnit.yScale = 0.5
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        if let location = spawnLocation {
            CastClassUnit.position = location
        }
        sprite = CastClassUnit
        (sprite as! CSKOrcHut).loadTextures()
    }
}




class TreeUnit: StructureUnit {
    init(player: Int, spawnLocation: CGPoint? = nil) {
        super.init()
        nameGUI = "Hut"
        teamNumber = player
        HP = 350
        DMG = 13
        Armor = 3

        HP_MAX = 30
        DMG_MAX = 3
        Armor_MAX = 3
        CastUnitClass(spawnLocation)
        referenceSpriteToSelf()
    }

    func referenceSpriteToSelf() {
        (sprite as! CSKOrcHut).UnitReference = self
    }

    func CastUnitClass(_ spawnLocation: CGPoint? = nil) {
        let CastClassUnit = CSKOrcHut(imageNamed: "tree-2.PNG")
        CastClassUnit.xScale = 0.15
        CastClassUnit.yScale = 0.15
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        if let location = spawnLocation {
            CastClassUnit.position = location
        }
        sprite = CastClassUnit
        (sprite as! CSKOrcHut).loadTextures()
    }
}