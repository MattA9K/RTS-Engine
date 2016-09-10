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
    var sprite: SKAbstractSprite = SKAbstractSprite(imageNamed: "player-test")
    var angleFacing: UnitFaceAngle!
    var ReferenceOfGameScene: GameScene?
    var isDead = false
    var sight: SKUnitSight?
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
    
    func OrderUnitToMoveOneStepUP() -> Bool { fatalError("BaseUnit tried to execute! Not SuperUnit.") }
    func OrderUnitToMoveOneStepDOWN() -> Bool { fatalError("BaseUnit tried to execute! Not SuperUnit.") }
    func OrderUnitToMoveOneStepLEFT() -> Bool { fatalError("BaseUnit tried to execute! Not SuperUnit.") }
    func OrderUnitToMoveOneStepRIGHT() -> Bool { fatalError("BaseUnit tried to execute! Not SuperUnit.") }
    
    // MELEE UNIT
    func OrderUnitToAttackMeleeUP() {}
    func OrderUnitToAttackMeleeUPLEFT() {}
    func OrderUnitToAttackMeleeUPRIGHT() {}
    
    func OrderUnitToAttackMeleeDOWNLEFT() {}
    func OrderUnitToAttackMeleeDOWNRIGHT() {}
    func OrderUnitToAttackMeleeDOWN() {}
    
    func OrderUnitToAttackMeleeLEFT() {}
    func OrderUnitToAttackMeleeRIGHT() {}
    // MELEE UNIT
    
    
    // RANGED UNIT
    func OrderUnitToAttackRangedUP() {}
    func OrderUnitToAttackRangedUPLEFT() {}
    func OrderUnitToAttackRangedUPRIGHT() {}
    
    func OrderUnitToAttackRangedDOWNLEFT() {}
    func OrderUnitToAttackRangedDOWNRIGHT() {}
    func OrderUnitToAttackRangedDOWN() {}
    
    func OrderUnitToAttackRangedLEFT() {}
    func OrderUnitToAttackRangedRIGHT() {}
    // RANGED UNIT
    
    func issueOrderTargetingPoint(target: CGPoint, unitOrder: UnitOrderWithNoTarget) {
        print("sdfsadfsa")
    }
    
    func fireAttackMelee(unit: BaseUnit) {}
    func fireAttackRanged(unit: BaseUnit) {}
    
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
//        generateSightRadius()
        
//        var TargetFinder = (0.45, target: self,
//                selector: Selector("attackAllUnitsInBuffer"), userInfo: nil, repeats: true)
    }
    
//    init(player: Int, ) {
//    }
    
    func addTargetToBuffer(unit: BaseUnit) {
//        print(".")
//        currentAITarget2 = unit
    }
    
    func disposeOfSpritesAfterGameOver() {
        sprite.removeFromParent()
        if let vision = sight {
            vision.removeFromParent()
        }
        if let blocker = spriteMovementBlocker {
            blocker.removeFromParent()
        }
        print123("A unit was removed from RAM.")
    }
    
    func attackAllUnitsInBuffer() {
//        print(String(isPlayer) + " IS NOT PLAYER, SHOULD BE FUCKING MOVING NOW.")
        if isPlayer != true {
            if let targetUnit = currentAITarget2 {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
                    self.issueOrderTargetingUnit(targetUnit)
//                    self.issueOrderTargetingPoint(
//                        targetUnit.sprite.position, unitOrder: UnitOrderWithNoTarget.AttackMove)
                }
                
            }
        }
    }
    
    func initMovementBlocker() {
//        spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "path-blocker")
        spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "SearchRadiusDummy")
        spriteMovementBlocker.xScale = 1.0
        spriteMovementBlocker.yScale = 1.0
        spriteMovementBlocker.position = sprite.position
        spriteMovementBlocker.zPosition = 20
//        spriteMovementBlocker.UnitReference = self
    }
    func updateMovementBlockerPosition() {
        spriteMovementBlocker.position = sprite.position
        
        if let spriteNode = sight {
            spriteNode.position = sprite.position
        }
    }
    func generateSightRadius() {
        sight = SKUnitSight(imageNamed: Sight.Image.Invisible)
        
        if let spriteNode = sight {
            spriteNode.position = sprite.position
            spriteNode.xScale = 11
            spriteNode.yScale = 11
            spriteNode.zPosition = SpritePositionZ.AliveUnit.Z - 1
            spriteNode.UnitReference = self
        }
    }
    
// DEPRICATED !!
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
    
    // returns true if unit dies
    func unitWillTakeDamageReturnIfUnitDies(damage: Int) -> Bool {
        animateUnitToLookDamaged()
        
        let randomNumber = arc4random()
        var selectedNumber = 1
        if randomNumber > 3000492058 {
            selectedNumber = 1
        }
        else if randomNumber > 1000492058 {
            selectedNumber = 2
        } else {
            selectedNumber = 3
        }
        
        ReferenceOfGameScene!.runAction(SKAction.playSoundFileNamed("Sword\(selectedNumber).wav", waitForCompletion: true))
        
        if let hp = HP {
            HP = hp - damage
            logg("Enemy now has" + String(HP))
        }
        
        
        if HP <= 0 && isDead == false {
            unitIsNowDying()
            logg("Enemy is now dying.")
            isDead = true
        }
        return isDead
    }
    
    func alertTheReceivingUnitItIsBeingAttacked(spriteReceivingAttack: SKAbstractSprite) {
        let attackerSpriteName = Reflection().getClassNameBasic(spriteReceivingAttack) //spriteReceivingAttack.UnitReference.sprite
//        spriteReceivingAttack.UnitReference?.currentAITarget = self
//        let NewTargetName = Reflection().getClassNameBasic(spriteReceivingAttack.UnitReference?.currentAITarget)
        
//        print123(
//            "\n \n \n \n Under attack from: \(attackerSpriteName)" +
//                "\n \n \n \n Under attack from: \(NewTargetName)" +
//            " \n \n \n \n ")
//        print123("")
    }
    
    func unitIsNowDying() {
        sprite.playDeathAnimation()
        sprite.zPosition = SpritePositionZ.DeadUnit.Z
        self.spriteMovementBlocker.removeFromParent()
        sightTimer?.invalidate()
        attackTimer?.invalidate()
    }
    


    

    
    func MoveUnitActorByX(position: CGPoint) {
        
        let xFinal: CGFloat = PathFinder().roundToFifties(position.x)
        let yFinal: CGFloat = PathFinder().roundToFifties(position.y)
        let FinalDestination = CGPointMake(xFinal, yFinal)
        
//        sprite.runAction(
//            SKAction.moveToX(
//                PathFinder().roundToFifties(xFinal), duration: UnitData.MovementSpeed()))
//        spriteMovementBlocker.runAction(
//            SKAction.moveToX(
//                PathFinder().roundToFifties(xFinal), duration: UnitData.MovementSpeed()))
//        sight.runAction(
//            SKAction.moveToX(
//                PathFinder().roundToFifties(xFinal), duration: UnitData.MovementSpeed()))

        spriteMovementBlocker.position = position
        
        if let spriteNode = sight {
            spriteNode.position = position
        }
        
    }
    
    func MoveUnitActorByY(position: CGPoint) {
        
        let xFinal: CGFloat = PathFinder().roundToFifties(position.x)
        let yFinal: CGFloat = PathFinder().roundToFifties(position.y)
        let FinalDestination = CGPointMake(xFinal, yFinal)
        
//        sprite.runAction(
//            SKAction.moveToY(
//                PathFinder().roundToFifties(yFinal), duration: UnitData.MovementSpeed()))
//        spriteMovementBlocker.runAction(
//            SKAction.moveToY(
//                PathFinder().roundToFifties(yFinal), duration: UnitData.MovementSpeed()))
//        sight.runAction(
//            SKAction.moveToY(
//                PathFinder().roundToFifties(yFinal), duration: UnitData.MovementSpeed()))
        
        spriteMovementBlocker.position = position
        
        if let spriteNode = sight {
            spriteNode.position = position
        }
        
    }
    
    func ReverseTargetUnit() {
//        if self is GruntUnit {
//            (self as! GruntUnit).issueOrderTargetingPoint(
//                target!.sprite.position, unitOrder: .AttackMove)
//        } else if self is SpearThrowerUnit {
//            (self as! SpearThrowerUnit).issueOrderTargetingPoint(
//                target!.sprite.position, unitOrder: .AttackMove)
//        }
    }
    
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
                        (self as! GruntUnit).issueOrderTargetingPoint(
                            enemy.sprite.position, unitOrder: .AttackMove)
                        
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