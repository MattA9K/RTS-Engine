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
        sprite = SKSpriteNode(imageNamed: "Grass")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKDirtTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "Dirt")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast__I: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "|Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_I_: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "| Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_TT: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "T Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast___: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "_ Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_L_: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "I_ Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}
class SKCoast__l: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "_lWater")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}
class SKCoast_TI: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "T| Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}
class SKCoast_IT: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "|T Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}
class SKWaterTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}


class SKDoodadStone: SKGroundTileGeneric {
    override init() {
        super.init()
        let imageName = ("stone-" + String(arc4random_uniform(3) + 1))
        print(imageName)
        sprite = SKDoodadBlocker(imageNamed: imageName)
//        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = 12//SpritePositionZ.SmallDoodad.Z
        sprite.xScale = 0.2
        sprite.yScale = 0.2
    }
}

class SKDoodadTree: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKDoodadBlocker(imageNamed: ("tree-" + String(arc4random_uniform(4) + 1)))
//        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.SmallDoodad.Z
        sprite.xScale = 0.2
        sprite.yScale = 0.2
        
    }
}