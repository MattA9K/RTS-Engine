//
//  Orc_Structures.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/14/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class OrcGreatHall_Structure: BaseStructure {
    
    override init() {
        super.init()
        sprite = SKOrcGreatHall(imageNamed: "greatHall-Alive")
        setDefaultValues()
        initMovementBlocker()
    }
    
    init(player: Int) {
        super.init()
        sprite = SKOrcGreatHall(imageNamed: "greatHall-Alive")
        setDefaultValues()
        teamNumber = player
        initMovementBlocker()
    }
    
    func setDefaultValues() {
        sprite.xScale = 1.0
        sprite.yScale = 1.0
        sprite.zPosition = SpritePositionZ.AliveUnit.Z
        initMovementBlocker()
        spriteMovementBlocker.xScale = 8.2
        spriteMovementBlocker.yScale = 8.2
    }
}

class SKOrcGreatHall: SKAbstractSprite {
    override func playDeathAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 4; i+=1 {
                NSThread.sleepForTimeInterval(0.07);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "grunt_death_down0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
        }
    }
}


class OrcBarracks_Structure: BaseStructure {
    
    override init() {
        super.init()
        sprite = SKOrcGreatHall(imageNamed: "OrcBarracks-Alive")
        setDefaultValues()
    }
    
    init(player: Int) {
        super.init()
        sprite = SKOrcGreatHall(imageNamed: "OrcBarracks-Alive")
        setDefaultValues()
        teamNumber = player
    }
    
    func setDefaultValues() {
        sprite.xScale = 0.5
        sprite.yScale = 0.5
        spriteMovementBlocker.xScale = 8.0
        spriteMovementBlocker.yScale = 8.0
        sprite.zPosition = SpritePositionZ.AliveUnit.Z
    }
}


class OrcBlacksmith_Structure: BaseStructure {
    
    override init() {
        super.init()
        sprite = SKOrcGreatHall(imageNamed: "OrcBlacksmith-Alive")
        setDefaultValues()
    }
    
    init(player: Int) {
        super.init()
        sprite = SKOrcGreatHall(imageNamed: "OrcBlacksmith-Alive")
        setDefaultValues()
        teamNumber = player
    }
    
    func setDefaultValues() {
        sprite.xScale = 0.7
        sprite.yScale = 0.7
        spriteMovementBlocker.xScale = 6.2
        spriteMovementBlocker.yScale = 6.2
        sprite.zPosition = SpritePositionZ.AliveUnit.Z
    }
}


class OrcLumbermill_Structure: BaseStructure {
    
    override init() {
        super.init()
        sprite = SKOrcGreatHall(imageNamed: "OrcLumberMill-Alive")
        setDefaultValues()
    }
    
    init(player: Int) {
        super.init()
        sprite = SKOrcGreatHall(imageNamed: "OrcLumberMill-Alive")
        setDefaultValues()
        teamNumber = player
    }
    
    func setDefaultValues() {
        sprite.xScale = 0.8
        sprite.yScale = 0.8
        spriteMovementBlocker.xScale = 6.2
        spriteMovementBlocker.yScale = 6.2
        sprite.zPosition = SpritePositionZ.AliveUnit.Z
    }
}


class OrcWall_Structure: BaseStructure {
    
    override init() {
        super.init()
        sprite = SKOrcGreatHall(imageNamed: "OrcWall-single-Alive")
        setDefaultValues()
    }
    
    init(player: Int) {
        super.init()
        sprite = SKOrcGreatHall(imageNamed: "OrcWall-single-Alive")
        setDefaultValues()
        teamNumber = player
    }
    
    func setDefaultValues() {
        sprite.xScale = 0.7
        sprite.yScale = 0.7
        spriteMovementBlocker.xScale = 2.2
        spriteMovementBlocker.yScale = 2.2
        sprite.zPosition = SpritePositionZ.AliveUnit.Z
    }
}


