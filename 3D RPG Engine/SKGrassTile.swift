//
//  SKGrassTile.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class SKGroundTileGeneric {
    var sprite: SKSpriteNode!
    
    init() {
        sprite = SKSpriteNode()
    }
}

class SKGrassTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "grass_Forest-large")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.5
        sprite.yScale = 0.5
    }
}