//
//  DummyGruntSprite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/30/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class GruntSprite: BaseUnit {
    
    
    override init(unit: Actor){
        super.init(unit: unit)
        let CastClassUnit = SKGruntSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = 0.2
        CastClassUnit.yScale = 0.2
        CastClassUnit.position = unit.pointCG
        CastClassUnit.name = unit.unitType
        sprite = CastClassUnit
        
        HP = 3
    }
    
    override func unitIsNowDying() {
        super.unitIsNowDying()
        (sprite as! SKGruntSprite).playDeathAnimation()
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