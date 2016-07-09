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
    override init(unit: Actor, scene: GameScene) {
        super.init(unit: unit, scene: scene)
        
        let CastClassUnit = SKGruntSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = 0.3
        CastClassUnit.yScale = 0.3
        CastClassUnit.position = unit.pointCG
        CastClassUnit.name = unit.unitType
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        teamNumber = 1
        HP = 3
        referenceSpriteToSelf()
    }
    

    override init(unit: Actor) {
        super.init(unit: unit)
        let CastClassUnit = SKGruntSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = 0.3
        CastClassUnit.yScale = 0.3
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        teamNumber = 1
        HP = 3
        referenceSpriteToSelf()
    }
    
    override init(unit: Actor, player: Int) {
        super.init(unit: unit)
        let CastClassUnit = SKGruntSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = 0.3
        CastClassUnit.yScale = 0.3
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        
        let imageName = "grunt_down_stand"
        sprite.texture = SKTexture(imageNamed: imageName)
        HP = 3
        referenceSpriteToSelf()
    }
    
    override func referenceSpriteToSelf() {
        (sprite as! SKGruntSprite).UnitReference🔶 = self
    }
    
    /*
    override func OrderUnitToMoveOneStepUP() -> Bool {
//        let bool = super.OrderUnitToMoveOneStepUP()
        let imageName = "grunt_up_stand"
        sprite.texture = SKTexture(imageNamed: imageName)
        return bool
    }
    override func OrderUnitToMoveOneStepDOWN() -> Bool {
//        let bool = super.OrderUnitToMoveOneStepDOWN()
        let imageName = "grunt_down_stand"
        sprite.texture = SKTexture(imageNamed: imageName)
    }
    override func OrderUnitToMoveOneStepLEFT() -> Bool {
//        let bool = super.OrderUnitToMoveOneStepLEFT()
        let imageName = "grunt_left_stand"
        sprite.texture = SKTexture(imageNamed: imageName)
    }
    override func OrderUnitToMoveOneStepRIGHT() -> Bool {
//        let bool = super.OrderUnitToMoveOneStepRIGHT()
        let imageName = "grunt_right_stand"
        sprite.texture = SKTexture(imageNamed: imageName)
    }
 */
}