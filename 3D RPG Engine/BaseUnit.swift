//
//  EnemySpriteNode.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class BaseUnit {
    
    var location: CGPoint?
    var sprite: SKSpriteNode!
    var angleFacing: UnitFaceAngle!
    var ReferenceOfGameScene🔶: GameScene?
    var isDead = false
    
    var HP: Int?
    
    init(unit: Actor){
        location = CGPointMake(500, 400)
        sprite = SKSpriteNode(imageNamed: unit.SpritePNG)
        
        sprite.xScale = 2.0
        sprite.yScale = 2.0
        sprite.position = unit.pointCG
        sprite.name = unit.unitType
        self.angleFacing = UnitFaceAngle.Up
    }
    
    init(unit: Actor, scene: GameScene){
        location = CGPointMake(500, 400)
        sprite = SKSpriteNode(imageNamed: unit.SpritePNG)
        
        sprite.xScale = 2.0
        sprite.yScale = 2.0
        sprite.position = unit.pointCG
        sprite.name = unit.unitType
        self.angleFacing = UnitFaceAngle.Up
        ReferenceOfGameScene🔶 = scene
    }
    
    var DefaultMovement: CGFloat {
        get {
            return 50;
        }
    }
    
    var DefaultAttackRange: CGFloat {
        get {
            return 50;
        }
    }
    
    func unitDidTakeDamage(damage: Int) {
        if let hp = HP {
            HP = hp - damage
            logg("Enemy now has" + String(HP))
        }
        
        if HP <= 0 && isDead == false{
            unitIsNowDying()
            logg("Enemy is now dying.")
            isDead = true
            
        }
    }
    
    func unitIsNowDying() {}
}

enum UnitDefaultProperty {
    case Attack, Movement;
    
    var Range: CGFloat {
        get {
            switch (self) {
            case .Attack:
                return 100
            case .Movement:
                return 25
            }
        }
    }
}

enum UnitFaceAngle {
    case Up, Down, Left, Right;
    
    var facingAngleString: String {
        get {
            switch (self) {
            case .Up:
                return "up"
            case .Down:
                return "down"
            case .Left:
                return "left"
            case .Right:
                return "right"
            default:
                return "fuck off"
            }
        }
    }
    
}