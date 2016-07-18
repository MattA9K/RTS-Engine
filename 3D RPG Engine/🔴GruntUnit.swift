//
//  GruntUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class GruntUnit: MeleeUnit {
    
    /*
    override init(unit: Actor, scene: GameScene) {
        super.init(unit: unit, scene: scene)
        
        let CastClassUnit = SKGruntSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.position = unit.pointCG
        CastClassUnit.name = unit.unitType
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        teamNumber = 1
        HP = 3
        referenceSpriteToSelf()
        CastUnitReference()
    }
    

    override init(unit: Actor) {
        super.init(unit: unit)
        let CastClassUnit = SKGruntSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        teamNumber = 1
        HP = 3
        referenceSpriteToSelf()
        CastUnitReference()
    }
    */
 
    override init(player: Int) {
        let imageName = "grunt_down_stand"
        
        super.init(player: player)
        
        let CastClassUnit = SKGruntSprite(imageNamed: imageName)
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        
        sprite.texture = SKTexture(imageNamed: imageName)
        HP = 3
        referenceSpriteToSelf()
        CastUnitReference()
    }
    
    override func referenceSpriteToSelf() {
        (sprite as! SKGruntSprite).UnitReference🔶 = self
    }
    
    override func attackAllUnitsInBuffer() {
        super.attackAllUnitsInBuffer()
    }

    
    func CastUnitReference() {
        sprite.UnitReference🔶 = self
    }
}