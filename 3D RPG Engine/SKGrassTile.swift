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

class SKDoodadStone: SKGroundTileGeneric {
    override init() {
        super.init()
        let imageName = ("stone-" + String(arc4random_uniform(3) + 1))
        print(imageName)
        sprite = SKSpriteNode(imageNamed: imageName)
//        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = 12//SpritePositionZ.SmallDoodad.Z
        sprite.xScale = 0.2
        sprite.yScale = 0.2
    }
}

class SKDoodadTree: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: ("tree-" + String(arc4random_uniform(4) + 1)))
//        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.SmallDoodad.Z
        sprite.xScale = 0.2
        sprite.yScale = 0.2
    }
}