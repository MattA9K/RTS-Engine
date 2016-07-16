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
    var sight: SKUnitSight!
    var target: BaseUnit?
    var teamNumber: Int?
    
    var isPlayer: Bool?
    
    var spriteMovementBlocker: SKBlockMovementSpriteNode!
    
    var HP: Int?
    var attackSpeed: Double = 1.6
    
    func animateUnitToLookDamaged() {}
    func OrderUnitToMoveOneStepUP() -> Bool {return true}
    func OrderUnitToMoveOneStepDOWN() -> Bool {return true}
    func OrderUnitToMoveOneStepLEFT() -> Bool {return true}
    func OrderUnitToMoveOneStepRIGHT() -> Bool {return true}
    func issueOrderTargetingPoint(target: CGPoint, unitOrder: UnitOrderWithNoTarget) {
        print("sdfsadfsa")
    }
    func issueOrderTargetingUnit(unit: BaseUnit, unitOrder: UnitOrderWithNoTarget) {}
    
    
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
        generateSightRadius()
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
        sprite.zPosition = SpritePositionZ.AliveUnit.Z
        initMovementBlocker()
        generateSightRadius()
    }
    
    init(unit: Actor, player: Int) {
        teamNumber = player
        generateSightRadius()
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
        self.spriteMovementBlocker.removeFromParent()
    }
    
    func ReverseTargetUnit() {
        if self is GruntUnit {
            (self as! GruntUnit).issueOrderTargetingPoint(target!.sprite.position, unitOrder: .AttackMove)
        } else if self is SpearThrowerUnit {
            (self as! SpearThrowerUnit).issueOrderTargetingPoint(target!.sprite.position, unitOrder: .AttackMove)
        }
    }
    
    
    func searchAreaForEnemyTarget() {
        let selfLocation = self.sprite.position
        var targetToEngage: BaseUnit?
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            var enemyFootmanHACK: FootmanUnit!
            for enemy in (self.ReferenceOfGameScene🔶?.AllUnitsInRAM?.enemies)! {
//                self.printToConsole(enemy.1.sprite.name)
                let enemyPosition = enemy.sprite.position
                let target = SKSpriteNode(imageNamed: "Enemy")
                target.position = enemyPosition
                target.xScale = 2.0
                target.yScale = 2.0
                
                print("ENEMY TEAM NUMBER!!!!")
                print(enemy.teamNumber)

                if enemy.teamNumber != self.teamNumber {
                    
                    self.printToConsole2("enemy location: ")
                    self.printToConsole2(enemy.location)
                    
                    self.printToConsole2("enemy is a grunt: ")
                    if enemy is GruntUnit {
                        self.printToConsole2("Yes, this is a grunt.")
                    } else if enemy is FootmanUnit {
                        self.printToConsole2("No, Footman.")
                    } else {
                        (self as! GruntUnit).issueOrderTargetingPoint(enemy.sprite.position, unitOrder: .AttackMove)
                        self.printToConsole2("No, not a grunt.")
                    }
                    if enemy is FootmanUnit {
                        self.printToConsole2("Enemy targeted player.")
                        enemyFootmanHACK = (enemy as! FootmanUnit)
                    }
                    
                    
                    let enemyLocation = enemy.sprite.position
                    let dx = selfLocation.x - enemyLocation.x
                    let dy = selfLocation.y - enemyLocation.y
                    let distance = sqrt(dx*dx + dy*dy)
                    if (distance <= ViewDistance.AI.Default) {
                        //                    ReferenceOfGameScene🔶?.addChild(target)
                        if enemy.HP > 0 {
                            targetToEngage = enemy
//                            self.printToConsole("TARGET AQUIRED!")
                        }
                    }
                }
            }
            if let target = targetToEngage {
                if enemyFootmanHACK is FootmanUnit {
                    self.printToConsole2("No, Footman.")
                    (self as! GruntUnit).issueOrderTargetingPoint(target.sprite.position, unitOrder: .AttackMove)
                } else {
                    self.issueOrderTargetingPoint(target.sprite.position, unitOrder: .AttackMove)
                }
            
            }

        }
    }
    
    
    func printToConsole2(text: Any) {
                ReferenceOfGameScene🔶?.ControlPanel?.printToConsole(String(text))
    }
    func printToConsole(text: Any) {
//        ReferenceOfGameScene🔶?.ControlPanel?.printToConsole(String(text))
    }
    
    

    
    func generateSightRadius() {
        sight = SKUnitSight(imageNamed: Sight.Image.name)
        sight.position = sprite.position
        sight.xScale = 10
        sight.yScale = 10
        sight.zPosition = SpritePositionZ.AliveUnit.Z
        sight.UnitReference🔶 = self
        sight.physicsBody?.affectedByGravity = false
        sight.applyPhysics()
    }
    
    func unitDidMove(position: CGPoint) {
        print("A UNIT HAS MOVED!!!")
        spriteMovementBlocker.position = position
        sight.position = position
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