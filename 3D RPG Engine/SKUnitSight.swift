//
//  SKUnitSight.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/14/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class SKUnitSight: SKSpriteNode {
    
    var UnitReference: BaseUnit!
    
//    let SightCategory   : UInt32 = 0x1 << 0
//    let UnitCategory   : UInt32 = 0x1 << 1
    
    func applyPhysics() {
//        physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
//        physicsBody!.categoryBitMask = SightCategory
//        UnitReference.sight.physicsBody!.contactTestBitMask = UnitCategory
//        UnitReference.sight.UnitReference = UnitReference
//        physicsBody!.affectedByGravity = false
//        physicsBody!.allowsRotation = true
//        physicsBody!.dynamic = true;
//        physicsBody!.linearDamping = 0.75
//        physicsBody!.angularDamping = 0.75
//        physicsBody!.collisionBitMask = 0
//        UnitReference.sprite.physicsBody = SKPhysicsBody(rectangleOfSize: UnitReference.sprite.size)
//        UnitReference.sprite.physicsBody?.dynamic = false
//        UnitReference.sprite.physicsBody!.affectedByGravity = false
//        UnitReference.sprite.physicsBody!.categoryBitMask = UnitCategory
//        UnitReference.sprite.physicsBody!.contactTestBitMask = SightCategory
    }
    
}

enum Sight {
    case Image;
    
    var Invisible : String {
        return "SearchRadiusDummy"
    }
    var VisibleDebugMode : String {
        return "SearchRadiusDummyV"
    }
}