//
//  BaseStructure.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/13/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class BaseStructure {
    var teamNumber: Int?
    var sprite: SKBuilding!
    
    init() {
        sprite = SKBuilding()
    }
}

class OrcHut_Structure: BaseStructure {
    
    override init() {
        super.init()
        sprite = SKBuilding(imageNamed: "OrcHut")
        setDefaultValues()
    }
    
    init(player: Int) {
        super.init()
        sprite = SKBuilding(imageNamed: "OrcHut")
        setDefaultValues()
        teamNumber = player
    }
    
    func setDefaultValues() {
        sprite.xScale = 0.6
        sprite.yScale = 0.6
        sprite.zPosition = SpritePositionZ.AliveUnit.Z
    }
}

class OrcGreatHall_Structure: BaseStructure {
    
    override init() {
        super.init()
        sprite = SKBuilding(imageNamed: "greatHall-Alive")
        setDefaultValues()
    }
    
    init(player: Int) {
        super.init()
        sprite = SKBuilding(imageNamed: "greatHall-Alive")
        setDefaultValues()
        teamNumber = player
    }
    
    func setDefaultValues() {
        sprite.xScale = 1.0
        sprite.yScale = 1.0
        sprite.zPosition = SpritePositionZ.AliveUnit.Z
    }
}