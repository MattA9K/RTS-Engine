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
    
    override init(unit: Actor, scene: GameScene) {
        super.init(unit: unit, scene: scene)
        
        let CastClassUnit = SKSpearThrowerSprite(imageNamed: unit.SpritePNG)
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
        let CastClassUnit = SKSpearThrowerSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = 0.3
        CastClassUnit.yScale = 0.3
        sprite = CastClassUnit
        teamNumber = 1
        HP = 35
        referenceSpriteToSelf()
    }
    
    override init(unit: Actor, player: Int) {
        super.init(unit: unit)
        let CastClassUnit = SKSpearThrowerSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = 0.3
        CastClassUnit.yScale = 0.3
        sprite = CastClassUnit
        referenceSpriteToSelf()
    }
    
    override func referenceSpriteToSelf() {
        (sprite as! SKSpearThrowerSprite).UnitReference🔶 = self
    }
}