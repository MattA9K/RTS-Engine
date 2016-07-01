//
//  DummyGruntSprite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/30/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class GruntSprite: UnitSprite {
    override init(unit: GameUnit){
        super.init(unit: unit)
        let CastClassUnit = SKGruntSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = 2.0
        CastClassUnit.yScale = 2.0
        CastClassUnit.position = unit.pointCG
        CastClassUnit.name = unit.unitType
        sprite = CastClassUnit
    }
}



// ANIMATIONS
class SKGruntSprite: SKSpriteNode {
    func playDeathAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for var i = 1; i < 9; i+=1 {
                NSThread.sleepForTimeInterval(0.07);
                dispatch_async(dispatch_get_main_queue()) {
                    let imageName = "dummy0" + String(i)
                    self.texture = SKTexture(imageNamed: imageName)
                }
            }
        }
    }
}