//
//  EnemySpriteNode.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class BaseUnit: NSObject, UnitProtocol {
    
    var location: CGPoint?
    var sprite: SKAbstractSprite!
    var angleFacing: UnitFaceAngle!
    var ReferenceOfGameScene: GameScene?
    var isDead = false
    var sight: SKUnitSight!
    var target: BaseUnit?
    var teamNumber: Int?
    
    var isPlayer: Bool?
    
    var spriteMovementBlocker: SKBlockMovementSpriteNode!
    
    var HP: Int?
    var attackSpeed: Double = 1.6
    
    
    var targetBuffer = [String: BaseUnit]()
    var currentAITarget: BaseUnit?
    var currentAITarget2: BaseUnit?
    
    var isMoving = false
    
    var targetPoint: CGPoint?
    
    var sightTimer: NSTimer?
    var attackTimer: NSTimer?
    
    func animateUnitToLookDamaged() {}
    func OrderUnitToMoveOneStepUP() -> Bool {return true}
    func OrderUnitToMoveOneStepDOWN() -> Bool {return true}
    func OrderUnitToMoveOneStepLEFT() -> Bool {return true}
    func OrderUnitToMoveOneStepRIGHT() -> Bool {return true}
    func issueOrderTargetingPoint(target: CGPoint, unitOrder: UnitOrderWithNoTarget) {
        print("sdfsadfsa")
    }
    
    func fireAttackMelee(unit: BaseUnit) {}
    func issueOrderTargetingUnit(unit: BaseUnit) {}
    func referenceSpriteToSelf() {}
    
    
    init(player: Int) {
        super.init()
        location = CGPointMake(500, 400)
        sprite = SKAbstractSprite(imageNamed: "player-test")
        
        sprite.xScale = 2.0
        sprite.yScale = 2.0
//        sprite.position = unit.pointCG
//        sprite.name = unit.unitType
        
        teamNumber = player
        initMovementBlocker()
        generateSightRadius()
        
//        var TargetFinder = NSTimer.scheduledTimerWithTimeInterval(0.45, target: self,
//                selector: Selector("attackAllUnitsInBuffer"), userInfo: nil, repeats: true)
    }
    
//    init(player: Int, ) {
//    }
    
    func addTargetToBuffer(unit: BaseUnit) {
        print(".")
        currentAITarget2 = unit
    }
    
    func attackAllUnitsInBuffer() {
//        print(String(isPlayer) + " IS NOT PLAYER, SHOULD BE FUCKING MOVING NOW.")
        if isPlayer != true {
            if let targetUnit = currentAITarget2 {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
                    self.issueOrderTargetingUnit(targetUnit)
                    //self.issueOrderTargetingPoint(targetUnit.sprite.position, unitOrder: UnitOrderWithNoTarget.AttackMove)
                }
                
            }
        }
    }
    
    func initMovementBlocker() {
//        spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "path-blocker")
        spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "SearchRadiusDummyV")
        spriteMovementBlocker.xScale = 1.0
        spriteMovementBlocker.yScale = 1.0
        spriteMovementBlocker.position = sprite.position
        spriteMovementBlocker.zPosition = 20
        spriteMovementBlocker.UnitReference = self
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
    
    func printToConsole2(text: Any) {
        print(text)
        ReferenceOfGameScene?.ControlPanel?.printToConsole(String(text))
    }
    func printToConsole(text: Any) {
        ReferenceOfGameScene?.ControlPanel?.printToConsole(String(text))
    }
    
    func generateSightRadius() {
        sight = SKUnitSight(imageNamed: Sight.Image.Invisible)
        sight.position = sprite.position
        sight.xScale = 10
        sight.yScale = 10
        sight.zPosition = SpritePositionZ.AliveUnit.Z
        sight.UnitReference = self
//        sight.physicsBody?.affectedByGravity = false
//        sight.applyPhysics()
    }
    
    func MoveUnitActorByX(position: CGPoint) {
        print("A UNIT HAS MOVED!!! X")
        
        let xFinal: CGFloat = PathFinder().roundToFifties(position.x)
        let yFinal: CGFloat = PathFinder().roundToFifties(position.y)
        let FinalDestination = CGPointMake(xFinal, yFinal)
        
//        sprite.runAction(SKAction.moveToX(PathFinder().roundToFifties(xFinal), duration: UnitData.MovementSpeed()))
//        spriteMovementBlocker.runAction(SKAction.moveToX(PathFinder().roundToFifties(xFinal), duration: UnitData.MovementSpeed()))
        sight.runAction(SKAction.moveToX(PathFinder().roundToFifties(xFinal), duration: UnitData.MovementSpeed()))

        spriteMovementBlocker.position = position
//        sight.position = position
    }
    
    func MoveUnitActorByY(position: CGPoint) {
        print("A UNIT HAS MOVED!!! Y")
        
        let xFinal: CGFloat = PathFinder().roundToFifties(position.x)
        let yFinal: CGFloat = PathFinder().roundToFifties(position.y)
        let FinalDestination = CGPointMake(xFinal, yFinal)
        
//        sprite.runAction(SKAction.moveToY(PathFinder().roundToFifties(yFinal), duration: UnitData.MovementSpeed()))
//        spriteMovementBlocker.runAction(SKAction.moveToY(PathFinder().roundToFifties(yFinal), duration: UnitData.MovementSpeed()))
        sight.runAction(SKAction.moveToY(PathFinder().roundToFifties(yFinal), duration: UnitData.MovementSpeed()))
        
        spriteMovementBlocker.position = position
//        sight.position = position
    }
    
//    func ReverseTargetUnit() {
//        if self is GruntUnit {
//            (self as! GruntUnit).issueOrderTargetingPoint(target!.sprite.position, unitOrder: .AttackMove)
//        } else if self is SpearThrowerUnit {
//            (self as! SpearThrowerUnit).issueOrderTargetingPoint(target!.sprite.position, unitOrder: .AttackMove)
//        }
//    }
    
    func searchAreaForEnemyTarget() {
        /*
        let selfLocation = self.sprite.position
        var targetToEngage: BaseUnit?
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            var enemyFootmanHACK: FootmanUnit!
            for enemy in (self.ReferenceOfGameScene?.enemies)! {
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
                        //                    ReferenceOfGameScene?.addChild(target)
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
 */
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