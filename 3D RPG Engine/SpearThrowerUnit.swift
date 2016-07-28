//
//  SpearThrowerUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class SpearThrowerUnit: RangedUnit {
    
    /*
    override init(unit: Actor, scene: GameScene) {
        super.init(unit: unit, scene: scene)
        
        let CastClassUnit = SKSpearThrowerSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.position = unit.pointCG
        CastClassUnit.name = unit.unitType
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        teamNumber = 1
        HP = 35
        referenceSpriteToSelf()
        CastUnitReference()
    }
    
    
    override init(unit: Actor) {
        super.init(unit: unit)
        let CastClassUnit = SKSpearThrowerSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        teamNumber = 1
        HP = 35
        referenceSpriteToSelf()
        CastUnitReference()
    }
    */
 
    override init(player: Int) {
        super.init(player: player)
        let CastClassUnit = SKSpearThrowerSprite(imageNamed: "spear_down_stand")
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        HP = 10
        sprite = CastClassUnit
        referenceSpriteToSelf()
        CastUnitReference()
    }
    
    override func referenceSpriteToSelf() {
        (sprite as! SKSpearThrowerSprite).UnitReference = self
    }
    
    func CastUnitReference() {
        sprite.UnitReference = self
    }
}