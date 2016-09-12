//
//  BaseStructure.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/13/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class BaseStructure: AbstractUnit {
    
    override init() {
        super.init()
        sprite = SKAbstractSprite()
        initMovementBlocker()
    }
    
    override func initMovementBlocker() {
        spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "Enemy")
        spriteMovementBlocker.xScale = 1.2
        spriteMovementBlocker.yScale = 1.2
        spriteMovementBlocker.position = sprite.position
        spriteMovementBlocker.zPosition = 2662
        spriteMovementBlocker.UnitReference = self
    }
}

class OrcHut_Structure: BaseStructure {
    
    override init() {
        super.init()
        sprite = SKAbstractSprite(imageNamed: "OrcHut")
        setDefaultValues()
        HP = 1
        Armor = 0
    }
    
    init(player: Int) {
        super.init()
        sprite = SKAbstractSprite(imageNamed: "OrcHut")
        setDefaultValues()
        teamNumber = player
        HP = 1
        Armor = 0
    }
    
    func setDefaultValues() {
        sprite.xScale = 0.6
        sprite.yScale = 0.6
        sprite.zPosition = SpritePositionZ.AliveUnit.Z
        HP = 1
        Armor = 0
    }
}

