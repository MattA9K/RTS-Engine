//
//  FootmanUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/1/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class FootmanUnit: MeleeUnit {
    
    override init(unit: Actor, scene: GameScene) {
        super.init(unit: unit, scene: scene)
        
        let CastClassUnit = SKFootmanSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = 0.3
        CastClassUnit.yScale = 0.3
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
        
        let CastClassUnit = SKFootmanSprite(imageNamed: unit.SpritePNG)
        sprite = CastClassUnit
        teamNumber = 1
        HP = 35
        referenceSpriteToSelf()
    }
    
    override init(unit: Actor, player: Int) {
        super.init(unit: unit)
        referenceSpriteToSelf()
    }
    
    override func referenceSpriteToSelf() {
        (sprite as! SKFootmanSprite).UnitReference🔶 = self
    }
}


class SpellSwordUnit: RangedUnit {
    
    override init(unit: Actor, scene: GameScene) {
        super.init(unit: unit, scene: scene)
        
        let CastClassUnit = SKFootmanSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = 0.3
        CastClassUnit.yScale = 0.3
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
        
        let CastClassUnit = SKFootmanSprite(imageNamed: unit.SpritePNG)
        sprite = CastClassUnit
        teamNumber = 1
        HP = 35
        referenceSpriteToSelf()
    }
    
    override init(unit: Actor, player: Int) {
        super.init(unit: unit)
        referenceSpriteToSelf()
    }
    
    override func referenceSpriteToSelf() {
//        (sprite as! SKFootmanSprite).UnitReference🔶 = self
    }
}