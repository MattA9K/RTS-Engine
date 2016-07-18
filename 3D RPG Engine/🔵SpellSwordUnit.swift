
//
//  SpellSwordUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

class SpellSwordUnit: RangedUnit {
    
    /*
    override init(unit: Actor, scene: GameScene) {
        super.init(unit: unit, scene: scene)
        
        let CastClassUnit = SKSpellSword(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.position = unit.pointCG
        CastClassUnit.name = unit.unitType
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        teamNumber = 1
        HP = 35
        referenceSpriteToSelf()
    }
    
    
    override init(unit: Actor) {
        super.init(unit: unit)
        let CastClassUnit = SKSpellSword(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        sprite = CastClassUnit
        teamNumber = 1
        HP = 35
        referenceSpriteToSelf()
    }
    
    override init(unit: Actor, player: Int) {
        super.init(unit: unit)
        let CastClassUnit = SKSpellSword(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        sprite = CastClassUnit
        referenceSpriteToSelf()
    }
 */
    
    override func referenceSpriteToSelf() {
        (sprite as! SKSpellSword).UnitReference🔶 = self
    }
}