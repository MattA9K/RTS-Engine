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
    var gameSceneRef : GameScene? { get set }
    var hostTurret : AbstractUnit? { get set }
    var targetNode : SKSpriteNode? { get set }
    
    func spawnAtPointInGameScene(position: CGPoint, target: SKSpriteNode)
    func engageTarget()
}
class MissileAttackNode : SKSpriteNode, FollowEnemyTarget {
    var gameSceneRef: GameScene?
    var hostTurret : AbstractUnit?
    var targetNode : SKSpriteNode?
    var DMG: Int = 5
    
    func spawnAtPointInGameScene(position: CGPoint, target: SKSpriteNode) {
        self.position = position
        self.targetNode = target
    }
    
    func engageTarget() {
        
        runAction(SKAction.moveTo(self.targetNode!.position, duration: 1.0), completion: {
            self.texture = SKTexture(imageNamed: "AttackBullet6")
            self.size = CGSizeMake(20, 20)
            self.runAction(SKAction.fadeOutWithDuration(0.3))
        })
        

//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
//            var count = 30
//            while count > -1 {
//                NSThread.sleepForTimeInterval(0.10);
//                dispatch_async(dispatch_get_main_queue()) {
//                    let node = self.gameSceneRef?.nodeAtPoint(self.position)
//                    if node is SKBlockMovementSpriteNode {
//                        if (node as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.hostTurret?.teamNumber {
//
//                            (node as! SKBlockMovementSpriteNode).UnitReference.unitWillTakeDamageReturnIfUnitDies(self.DMG, fromUnit: self.hostTurret!)
//                        }
//                    }
//                }
//            }
//        }
    }
}