//
//  GruntUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


class GruntUnit: MeleeUnit {
 
    override init(player: Int) {
        let imageName = "grunt_down_stand"
        
        super.init(player: player)
        
        let CastClassUnit = SKGruntSprite(imageNamed: imageName)
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        
        sprite.texture = SKTexture(imageNamed: imageName)
        HP = 25
        referenceSpriteToSelf()
        CastUnitReference()
        (sprite as! SKGruntSprite).loadTextures()
    }
    
    override func referenceSpriteToSelf() {
        (sprite as! SKGruntSprite).UnitReference = self
    }
    
    override func attackAllUnitsInBuffer() {
        super.attackAllUnitsInBuffer()
    }

    
    func CastUnitReference() {
        sprite.UnitReference = self
    }

}