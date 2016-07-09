//
//  EnemySpriteNode.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class BaseUnit: UnitProtocol {
    
    var location: CGPoint?
    var sprite: SKAbstractSprite!
    var angleFacing: UnitFaceAngle!
    var ReferenceOfGameScene🔶: GameScene?
    var isDead = false
    var sight: SKRegion!
    var target: BaseUnit?
    var teamNumber: Int?
    
    var spriteMovementBlocker: SKBlockMovementSpriteNode!
    
    var HP: Int?
    
    func animateUnitToLookDamaged() {}
    func OrderUnitToMoveOneStepUP() -> Bool {return true}
    func OrderUnitToMoveOneStepDOWN() -> Bool {return true}
    func OrderUnitToMoveOneStepLEFT() -> Bool {return true}
    func OrderUnitToMoveOneStepRIGHT() -> Bool {return true}
    func issueOrderTargetingPoint(target: CGPoint, unitOrder: UnitOrderWithNoTarget) {}
    func referenceSpriteToSelf() {}
    
    
    init(unit: Actor){
        location = CGPointMake(500, 400)
        sprite = SKAbstractSprite(imageNamed: unit.SpritePNG)
        
        sprite.xScale = 2.0
        sprite.yScale = 2.0
        sprite.position = unit.pointCG
        sprite.name = unit.unitType
        self.angleFacing = UnitFaceAngle.Up
        sprite.zPosition = SpritePositionZ.AliveUnit.Z
        initMovementBlocker()
    }
    
    init(unit: Actor, scene: GameScene){
        location = CGPointMake(500, 400)
        sprite = SKAbstractSprite(imageNamed: unit.SpritePNG)
        
        sprite.xScale = 2.0
        sprite.yScale = 2.0
        sprite.position = unit.pointCG
        sprite.name = unit.unitType
        self.angleFacing = UnitFaceAngle.Up
        ReferenceOfGameScene🔶 = scene
        sight = SKRegion(radius: 415)
        sprite.zPosition = SpritePositionZ.AliveUnit.Z
        initMovementBlocker()
    }
    
    init(unit: Actor, player: Int) {
        teamNumber = player
    }
    
    func initMovementBlocker() {
        spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "path-blocker")
        spriteMovementBlocker.xScale = 1.2
        spriteMovementBlocker.yScale = 1.2
        spriteMovementBlocker.position = sprite.position
        spriteMovementBlocker.zPosition = 20
        spriteMovementBlocker.UnitReference🔶 = self
    }
    func updateMovementBlockerPosition() {
        spriteMovementBlocker.position = sprite.position
    }
    func updateMovementBlockerPosition(position: CGPoint) {
        spriteMovementBlocker.position = position
    }
    
    
    func unitDidTakeDamage(damage: Int) {
        animateUnitToLookDamaged()
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
    
    func unitIsNowDying() {
        sprite.playDeathAnimation()
        sprite.zPosition = SpritePositionZ.DeadUnit.Z
    }
    
    
    func searchAreaForEnemyTarget() {
        let selfLocation = self.sprite.position
        var targetToEngage: BaseUnit?
        
        printToConsole("TARGETS: ")
        printToConsole((ReferenceOfGameScene🔶?.AllUnitsInRAM?.allEnemyIDs)!)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for enemy in (self.ReferenceOfGameScene🔶?.AllUnitsInRAM?.allEnemyIDs)! {
//                self.printToConsole(enemy.1.sprite.name)
                let enemyPosition = enemy.1.sprite.position
                let target = SKSpriteNode(imageNamed: "Enemy")
                target.position = enemyPosition
                target.xScale = 2.0
                target.yScale = 2.0
                if enemy.1.teamNumber != self.teamNumber {
                    let enemyLocation = enemy.1.sprite.position
                    let dx = selfLocation.x - enemyLocation.x
                    let dy = selfLocation.y - enemyLocation.y
                    let distance = sqrt(dx*dx + dy*dy)
                    if (distance <= ViewDistance.AI.Default) {
                        //                    ReferenceOfGameScene🔶?.addChild(target)
                        if enemy.1.HP > 0 {
                            targetToEngage = enemy.1
//                            self.printToConsole("TARGET AQUIRED!")
                        }
                    }
                }
            }
            if let target = targetToEngage {
                self.issueOrderTargetingPoint(target.sprite.position, unitOrder: .AttackMove)
            }

        }
    }
    
    
    
    func printToConsole(text: Any) {
//        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole(String(text))
    }
    
}

enum UnitDefaultProperty {
    case Attack, Movement;
    
    var Range: CGFloat {
        get {
            switch (self) {
            case .Attack:
                return 50
            case .Movement:
                return 50
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


extension BaseUnit {
    func nodesNearPoint(container:SKNode, point:CGPoint, maxDistance:CGFloat) -> [SKNode] {
        var array = [SKNode]()
        logg("about to search for enemy nodes.")
        for node in container.children {
            logg(container.children)
            // Only test sprite nodes (optional)
            if node is SKGruntSprite {
                let dx = point.x - node.position.x
                let dy = point.y - node.position.y
                
                let distance = sqrt(dx*dx + dy*dy)
                if (distance <= maxDistance) {
                    array.append(node)
                }
            }
        }
        return array
    }
}