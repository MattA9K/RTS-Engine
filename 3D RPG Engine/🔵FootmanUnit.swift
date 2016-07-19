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
    
    /*
    override init(unit: Actor, scene: GameScene) {
        super.init(unit: unit, scene: scene)
        CastUnitClass()

        teamNumber = 1
        HP = 35
        referenceSpriteToSelf()
        CastUnitReference()
    }
    
    override init(unit: Actor) {
        super.init(unit: unit)
        CastUnitClass()
        
        teamNumber = 1
        HP = 35
        referenceSpriteToSelf()
        CastUnitReference()
    }
    */
    
    override init(player: Int) {
        super.init(player: player)
        teamNumber = player
        HP = 5
        CastUnitClass()
        referenceSpriteToSelf()
        CastUnitReference()
    }
    
    override func referenceSpriteToSelf() {
        (sprite as! SKFootmanSprite).UnitReference🔶 = self
    }
    
    func CastUnitClass() {
        let CastClassUnit = SKFootmanSprite(imageNamed: "footman_walk_down01")
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        (sprite as! SKFootmanSprite).loadTextures()
    }
    
    func CastUnitReference() {
        sprite.UnitReference🔶 = self
    }

}


