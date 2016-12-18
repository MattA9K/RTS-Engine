//
//  HeroFootmanUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/18/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
/*

class HeroFootmanUnit: FootmanUnit {
    
    init(player: Int) {
        super.init(player: player)
//        teamNumber = player // OVERRIDE PLAYER NUMBER HERE
        nameGUI = "Rullo"
        HP = 220
        HP_MAX = 220
        Armor = 1
        DMG = 25
        MANA = 50
        
        HP_MAX = 320
        DMG_MAX = 25
        Armor_MAX = 8
        MANA_MAX = 50
    }
    
    override func CastUnitClass() {
        let CastClassUnit = SKHeroFootmanSprite(imageNamed: "footmanCenturionLvl1_down_stand")
        CastClassUnit.unitIdentifier = "Hero"
        CastClassUnit.loadTextures()
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        sprite = CastClassUnit
        
    }


}
*/


class HeroFootmanUnit: MeleeUnitNEW {
    init(player: Int, gameScene: GameScene) {
        super.init()
        nameGUI = "Rullo"
        HP = 620
        HP_MAX = 620
        Armor = 1
        DMG = 25
        MANA = 50

        HP_MAX = 620
        DMG_MAX = 25
        Armor_MAX = 8
        MANA_MAX = 50
        teamNumber = player
//        referenceSpriteToSelf()
        CastUnitClass(gameScene)
    }

    init(player: Int, gameScene: GameScene, loadSpriteImmediately: Bool) {
        super.init()
        nameGUI = "Rullo"
        HP = 620
        HP_MAX = 620
        Armor = 1
        DMG = 25
        MANA = 50

        HP_MAX = 620
        DMG_MAX = 25
        Armor_MAX = 8
        MANA_MAX = 50
        teamNumber = player
//        referenceSpriteToSelf()
        if loadSpriteImmediately == true {
            CastUnitClass(gameScene)
        }
    }

    func referenceSpriteToSelf() {
        (sprite as! SKHeroFootmanSprite).UnitReference = self
    }

    func CastUnitClass(_ gameScene: GameScene) {
        let CastClassUnit = SKHeroFootmanSprite(imageNamed: "footmanLvl1_down_stand")
        CastClassUnit.UnitReference = self
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.aliveUnit.Z
        sprite = CastClassUnit


        if self.teamNumber == 1 {
            (sprite as! SKHeroFootmanSprite).load(PLAYER_1_TEXTURE_SET)
        } else {
            (sprite as! SKHeroFootmanSprite).load(PLAYER_2_TEXTURE_SET)
        }

//        (sprite as! SKHeroFootmanSprite).loadTextures()
    }
}



class HeroFootmanUnit3: MeleeUnitNEW {
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
