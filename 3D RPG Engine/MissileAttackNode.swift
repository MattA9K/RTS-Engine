//
//  MissileAttackNode.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 9/19/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit




protocol FollowEnemyTarget {
    var DMG : Int { get set }
    
    func engageTarget(_ target: CGPoint)
}
class MissileAttackNode : SKSpriteNode, FollowEnemyTarget {
    var DMG: Int = 5
    
    func engageTarget(_ target: CGPoint) {
        self.run(SKAction.move(to: target, duration: 1.0), completion: {
            self.texture = SKTexture(imageNamed: "AttackBullet6")
            self.size = CGSize(width: 20, height: 20)
            self.run(SKAction.fadeOut(withDuration: 0.3))
        })
    }
    
    func engageTargetAndWait(_ target: CGPoint, duration: Double, completion: @escaping () -> Void) {
        self.run(SKAction.move(to: target, duration: duration), completion: {
            completion()
        })
    }
}
