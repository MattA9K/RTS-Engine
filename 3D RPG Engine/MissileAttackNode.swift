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
    
    func engageTarget(target: CGPoint)
}
class MissileAttackNode : SKSpriteNode, FollowEnemyTarget {
    var DMG: Int = 5
    
    func engageTarget(target: CGPoint) {
        self.runAction(SKAction.moveTo(target, duration: 1.0), completion: {
            self.texture = SKTexture(imageNamed: "AttackBullet6")
            self.size = CGSizeMake(20, 20)
            self.runAction(SKAction.fadeOutWithDuration(0.3))
        })
    }
    
    func engageTargetAndWait(target: CGPoint, duration: Double, completion: () -> Void) {
        self.runAction(SKAction.moveTo(target, duration: duration), completion: {
            completion()
        })
    }
}