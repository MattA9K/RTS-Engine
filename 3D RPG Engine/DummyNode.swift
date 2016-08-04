//
//  DummyNode.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/3/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



protocol DummyNodeAction {
    func getDummyNodeToAppend(id: Int, position: CGPoint) -> SKSpriteNode
}


struct DummyNode : DummyNodeAction {
    func getDummyNodeToAppend(id: Int, position: CGPoint) -> SKSpriteNode {
        let name = "AttackBullet\(id)"
        let nodeDebug = SKSpriteNode(imageNamed: name)
        nodeDebug.xScale = 1.0
        nodeDebug.yScale = 1.0
        nodeDebug.zPosition = 1200
        nodeDebug.position = position
        return nodeDebug
    }
}
