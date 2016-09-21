//
//  GameSceneSpellEffects.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 9/20/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


extension GameScene {
    
    func fireMissileBombPlayerHelper() {
        castMissileBombAttack(self.playerSK.positionLogical, target: (self.playerTarget?.position)!, sender: self.playerSK, Dmg: 10, DmgType: .Frost)
    }
    
    // ==========================================================================================
    //               BASIC RANGED ATTACK SPELL
    // ==========================================================================================
    
    enum DamageType {
        case Magic, Frost;
    }
    
    func fireMissileSpellPlayerHelper() {
        castMissileAttack(self.playerSK.positionLogical, target: (self.playerTarget?.position)!, sender: self.playerSK, Dmg: 10, DmgType: .Frost)
    }
    
    func castMissileAttack(origin: CGPoint, target: CGPoint, sender: AbstractUnit, Dmg: Int, DmgType: DamageType) {
        let missileAttackNode = MissileAttackNode(imageNamed: "AttackBullet6")
        missileAttackNode.zPosition = 1000
        missileAttackNode.xScale = 3.0
        missileAttackNode.yScale = 3.0
        missileAttackNode.position = origin
        self.addChild(missileAttackNode)
        missileAttackNode.engageTarget(target)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            var count = 10
            while count > -1 {
                NSThread.sleepForTimeInterval(0.1);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        
                        if DmgType == .Magic {
                            
                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                                var didHitEnemy: Bool
                                didHitEnemy = self.dealDamageToPointInWorldIfTargetIsInLocation(Dmg, location: missileAttackNode.position, senderUnit: sender)
                                if didHitEnemy == true {
                                    count = 0
                                    dispatch_async(dispatch_get_main_queue()) {
                                        missileAttackNode.removeFromParent()
                                    }
                                }
                            }

                        } else if DmgType == .Frost {
                            
                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                                var didHitEnemy: Bool
                                didHitEnemy = self.dealColdFreezeDmgAtPointInWorldIfTargetIsInLocation(Dmg, location: missileAttackNode.position, senderUnit: sender)
                                if didHitEnemy == true {
                                    count = 0
                                    dispatch_async(dispatch_get_main_queue()) {
                                        missileAttackNode.removeFromParent()
                                    }
                                }
                            }
                            

                        }
                    } else if count == 0 {
                        missileAttackNode.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func castMissileBombAttack(origin: CGPoint, target: CGPoint, sender: AbstractUnit, Dmg: Int, DmgType: DamageType) {
        let missileAttackNode = MissileAttackNode(imageNamed: "AttackBullet6")
        missileAttackNode.zPosition = 1000
        missileAttackNode.xScale = 3.0
        missileAttackNode.yScale = 3.0
        missileAttackNode.position = origin
        self.addChild(missileAttackNode)
        missileAttackNode.engageTarget(target)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            var count = 10
            while count > -1 {
                NSThread.sleepForTimeInterval(0.1);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        
                        if DmgType == .Magic {
                            
                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                                var didHitEnemy: Bool
//                                didHitEnemy = self.dealDamageToPointInWorldIfTargetIsInLocation(Dmg, location: missileAttackNode.position, senderUnit: sender)
                                
                                if self.unitCanBeDamagedByUsingThisPoint(missileAttackNode.position, teamNumber: sender.teamNumber) == true {
                                    count = 0
                                    dispatch_async(dispatch_get_main_queue()) {
                                        missileAttackNode.removeFromParent()
                                        self.castBombSpellAtPoint(missileAttackNode.position, timeTillExplode: 5, caster: sender, DMG: 40)
                                    }
                                }
                            }
                            
                        } else if DmgType == .Frost {
                            
                            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                                var didHitEnemy: Bool
//                                didHitEnemy = self.dealColdFreezeDmgAtPointInWorldIfTargetIsInLocation(Dmg, location: missileAttackNode.position, senderUnit: sender)
                                if self.unitCanBeDamagedByUsingThisPoint(missileAttackNode.position, teamNumber: sender.teamNumber) == true {
                                    count = 0
                                    dispatch_async(dispatch_get_main_queue()) {
                                        missileAttackNode.removeFromParent()
                                        self.castBombSpellAtPoint(missileAttackNode.position, timeTillExplode: 5, caster: sender, DMG: 40)
                                    }
                                }
                            }
                            
                            
                        }
                    } else if count == 0 {
                        missileAttackNode.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    
    func unitCanBeDamagedByUsingThisPoint(point: CGPoint, teamNumber: Int) -> Bool {
        for node in self.nodesAtPoint(point) {
            if node is SKBlockMovementSpriteNode {
                if (node as! SKBlockMovementSpriteNode).UnitReference.teamNumber != teamNumber {
                    return true
                }
            }
        }
        return false
    }
    
    func fireFrozenOrbPlayerHelper() {
        castFrozenOrb(self.playerSK.positionLogical, target: (self.playerTarget?.position)!, sender: self.playerSK)
    }
    
    func castFrozenOrb(origin: CGPoint, target: CGPoint, sender: AbstractUnit) {
        let MAN = MissileAttackNode(imageNamed: "AttackBullet6")
        MAN.zPosition = 1000
        MAN.xScale = 3.0
        MAN.yScale = 3.0
        MAN.position = origin
        self.addChild(MAN)
        MAN.engageTargetAndWait(target, duration: 3.0, completion: {
            
        })
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            var count = 10
            while count > -1 {
                NSThread.sleepForTimeInterval(0.3);
                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        let destinationOfFrostBolt1 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 250, movingInDirection: .UP)
                        self.castMissileAttack(MAN.position, target: destinationOfFrostBolt1.FinalDestination, sender: sender, Dmg: 10, DmgType: .Frost)
                        
                        let destinationOfFrostBolt2 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 250, movingInDirection: .DOWN)
                        self.castMissileAttack(MAN.position, target: destinationOfFrostBolt2.FinalDestination, sender: sender, Dmg: 10, DmgType: .Frost)
                        
                        let destinationOfFrostBolt3 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 250, movingInDirection: .LEFT)
                        self.castMissileAttack(MAN.position, target: destinationOfFrostBolt3.FinalDestination, sender: sender, Dmg: 10, DmgType: .Frost)
                        
                        let destinationOfFrostBolt4 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 250, movingInDirection: .RIGHT)
                        self.castMissileAttack(MAN.position, target: destinationOfFrostBolt4.FinalDestination, sender: sender, Dmg: 10, DmgType: .Frost)
                        
                        let destinationOfFrostBolt5 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 250, movingInDirection: .UL)
                        self.castMissileAttack(MAN.position, target: destinationOfFrostBolt5.FinalDestination, sender: sender, Dmg: 10, DmgType: .Frost)
                        
                        let destinationOfFrostBolt6 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 250, movingInDirection: .UR)
                        self.castMissileAttack(MAN.position, target: destinationOfFrostBolt6.FinalDestination, sender: sender, Dmg: 10, DmgType: .Frost)
                        
                        let destinationOfFrostBolt7 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 250, movingInDirection: .DL)
                        self.castMissileAttack(MAN.position, target: destinationOfFrostBolt7.FinalDestination, sender: sender, Dmg: 10, DmgType: .Frost)
                        
                        let destinationOfFrostBolt8 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 250, movingInDirection: .DR)
                        self.castMissileAttack(MAN.position, target: destinationOfFrostBolt8.FinalDestination, sender: sender, Dmg: 10, DmgType: .Frost)
                    } else if count == 0 {
                        MAN.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    // __________________________________________________________________________________________
    
    
    
    // ==========================================================================================
    //               PLAYER COHORT FORMATION
    // ==========================================================================================
    func executeCohortFormationSequence() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            var NUM_STEPS = 30
            var FIRST_STEPS = 15
            
            while NUM_STEPS > -1 {
                NUM_STEPS -= 1
                NSThread.sleepForTimeInterval(0.2);
                if NUM_STEPS > FIRST_STEPS {
                    // FIRST X STEPS
                    dispatch_async(dispatch_get_main_queue()) {
                        self.enterCohortFormationByOneStep_NoDiagnalMoves()
                    }
                } else {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.enterCohortFormationByOneStep()
                    }
                }
            }
        }
    }
    
    func enterCohortFormationByOneStep_NoDiagnalMoves() -> Void {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            var units = [AbstractUnit]()
            for unit in self.AllUnitsInGameScene {
                if unit.teamNumber == 1 && unit.isPlayer != true {
                    units.append(unit)
                }
            }
            if units.count == 0 {
                return
            }
            for unit in units {
                dispatch_async(dispatch_get_main_queue()) { // issueOrderTargetingPoint
                    (unit as! PathfinderUnit).issueOrderTargetingPoint_NoDiagnalMovement((self.playerTarget?.position)!, completionHandler: { finalDestination in
                        return
                    })
                }
            }
        }
    }
    
    func enterCohortFormationByOneStep() -> Void {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            var units = [AbstractUnit]()
            for unit in self.AllUnitsInGameScene {
                if unit.teamNumber == 1 && unit.isPlayer != true {
                    units.append(unit)
                }
            }
            if units.count == 0 {
                return
            }
            for unit in units {
                dispatch_async(dispatch_get_main_queue()) { // issueOrderTargetingPoint
                    (unit as! PathfinderUnit).issueOrderTargetingPoint((self.playerTarget?.position)!, completionHandler: { finalDestination in
                        return
                    })
                }
            }
        }
    }
    // __________________________________________________________________________________________
    
    
    enum MissileDirection {
    case UP, DOWN, LEFT, RIGHT,
        UL, UR, DL, DR;
    }
    
    struct MissleDestinationCalculator {
        var FinalDestination: CGPoint = CGPointMake(0, 0)
        var Distance: CGFloat = 0
        
        
        init(x: CGFloat, y: CGFloat, distance: CGFloat, movingInDirection: MissileDirection) {
            self.Distance = distance
            if movingInDirection == .UP {
                self.FinalDestination.x = x
                self.FinalDestination.y = (y + self.Distance)
            }
            else if movingInDirection == .DOWN {
                self.FinalDestination.x = x
                self.FinalDestination.y = (self.Distance - y) * -1
            }
            else if movingInDirection == .LEFT {
                self.FinalDestination.x = (self.Distance - x) * -1
                self.FinalDestination.y = y
            }
            else if movingInDirection == .RIGHT {
                self.FinalDestination.x = (x + self.Distance)
                self.FinalDestination.y = y
            }
            else if movingInDirection == .UL {
                self.FinalDestination.x = (self.Distance - x) * -1
                self.FinalDestination.y = (y + self.Distance)
            }
            else if movingInDirection == .UR {
                self.FinalDestination.x = (x + self.Distance)
                self.FinalDestination.y = (y + self.Distance)
            }
            else if movingInDirection == .DL {
                self.FinalDestination.x = (self.Distance - x) * -1
                self.FinalDestination.y = (self.Distance - y) * -1
            }
            else if movingInDirection == .DR {
                self.FinalDestination.x = (x + self.Distance)
                self.FinalDestination.y = (self.Distance - y) * -1
            }
        }

    }

    
    // ==========================================================================================
    //               BOMB EXPLODES AFTER SPAWNING
    // ==========================================================================================
    func playerSpellBombHelper() {
        self.castBombSpellAtPoint((playerTarget?.position)!, timeTillExplode: 20, caster: self.playerSK, DMG: 100)
    }
    
    func castBombSpellAtPoint(point: CGPoint, timeTillExplode: Int, caster: AbstractUnit, DMG: Int) {
        let missileAttackNode = MissileAttackNode(imageNamed: "AttackBullet3")
        missileAttackNode.zPosition = 99000
        missileAttackNode.xScale = 3.0
        missileAttackNode.yScale = 3.0
        missileAttackNode.position = point
        self.addChild(missileAttackNode)

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            var count = timeTillExplode
            while count > -1 {
                NSThread.sleepForTimeInterval(0.1);
                dispatch_async(dispatch_get_main_queue()) {
                    if count == 1 {
                        
                        self.dealSplashDamageToPointInWorld(DMG, location: missileAttackNode.position, senderUnit: self.playerSK)
//                        self.dealColdFreezeDmgAtPointInWorldIfTargetIsInLocation(5, location: missileAttackNode.position, senderUnit: self.playerSK)
                        
                    } else if count == 0 {
                        missileAttackNode.removeFromParent()
                    }
                    count = count - 1
                }
            }
        }
    }
    // __________________________________________________________________________________________
    
    
    
    // ==========================================================================================
    //               BLIZZARD SPELL
    // ==========================================================================================
    func playerCastBlizzardHelper() {
        self.castBlizzardAttack((playerTarget?.position)!, fromUnit: playerSK)
    }
    
    func castBlizzardAttack(atPoint: CGPoint, fromUnit: AbstractUnit) {
        let blizzardOriginCloud = SKSpriteNode(imageNamed: "AttackBullet4")
        blizzardOriginCloud.zPosition = 1000
        blizzardOriginCloud.xScale = 5.0
        blizzardOriginCloud.yScale = 5.0
        blizzardOriginCloud.position = atPoint
        self.addChild(blizzardOriginCloud)
        self.blizzardStormDrops(30, origin: blizzardOriginCloud.position, senderUnit: fromUnit)
    }
    
    func blizzardStormDrops(totalDrops: Int, origin: CGPoint, senderUnit: AbstractUnit) {
        
        func randomNumberX() -> CGFloat
        {
            let MAX : UInt32 = 150
            let MIN : UInt32 = 0
            let random_number = CGFloat(arc4random_uniform(MAX) + MIN)
            return random_number
        }
        
        func randomNumberY() -> CGFloat
        {
            let MAX : UInt32 = 250
            let MIN : UInt32 = 150
            let random_number = CGFloat(arc4random_uniform(MAX) + MIN)
            return random_number
        }
        
        var remainingDrops = totalDrops
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            while remainingDrops > -1 {
                NSThread.sleepForTimeInterval(0.15);
                dispatch_async(dispatch_get_main_queue()) {
                    remainingDrops -= 1
                    let blizzardRainDrop = MissileAttackNode(imageNamed: "AttackBullet3")
                    blizzardRainDrop.zPosition = 1000
                    blizzardRainDrop.xScale = 1.0
                    blizzardRainDrop.yScale = 1.0
                    blizzardRainDrop.position = origin
                    blizzardRainDrop.position.x -= 100
                    blizzardRainDrop.position.x += randomNumberX()
                    self.addChild(blizzardRainDrop)
                    var destination = origin
                    destination.x = blizzardRainDrop.position.x
                    destination.y -= randomNumberY()
                    blizzardRainDrop.engageTargetAndWait(destination, duration: 0.5, completion: {
                        let targetWasHit = self.dealDamageToPointInWorldIfTargetIsInLocation(10, location: destination, senderUnit: senderUnit)
                        if targetWasHit == false {
                            blizzardRainDrop.removeFromParent()
                        } else {
                            blizzardRainDrop.removeFromParent()
                        }
                    })
                }
            }
        }
    }
    // __________________________________________________________________________________________
    
    
    
    // ==========================================================================================
    //               Freeze Target
    // ==========================================================================================
    func dealColdFreezeDmgAtPointInWorldIfTargetIsInLocation(DMG: Int, location: CGPoint, senderUnit: AbstractUnit) -> Bool {
        let nodes = self.nodesAtPoint(location)
        for node in nodes {
            if node is SKBlockMovementSpriteNode {
                if (node as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.playerSK.teamNumber {
                (node as! SKBlockMovementSpriteNode).UnitReference.unitWillTakeDamageReturnIfUnitDies(DMG, fromUnit: senderUnit)
                let explosion = SKSpriteNode(imageNamed: "AttackBullet6")
                explosion.zPosition = 1000
                explosion.xScale = 1.0
                explosion.yScale = 1.0
                explosion.position = location
                self.addChildTemporaryExpand(explosion)
                let freezeColor = UIColor(hue: 0.5722, saturation: 1, brightness: 1, alpha: 1.0)
                
                (node as! SKBlockMovementSpriteNode).UnitReference.sprite.runAction(
                        
                    SKAction.colorizeWithColor(freezeColor, colorBlendFactor: 0.90, duration: 0.3),
                    completion: {
                        (node as! SKBlockMovementSpriteNode).UnitReference.isFrozen = 0.5
                        
                        var remainingTime = 20 // FREEZE DURATION
                        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
                            while remainingTime > -1 {
                                NSThread.sleepForTimeInterval(0.2);
                                dispatch_async(dispatch_get_main_queue()) {
                                    if remainingTime == 0 {
                                        (node as! SKBlockMovementSpriteNode).UnitReference.isFrozen = 0.0
                                        (node as! SKBlockMovementSpriteNode).UnitReference.sprite.runAction(
                                            SKAction.colorizeWithColor(UIColor.whiteColor(),
                                                colorBlendFactor: 1.0,
                                                duration: 0.5
                                            )
                                        )
                                    }
                                    remainingTime -= 1
                                }
                            }
                        }
                })
                    return true
                }
            }
        }
        return false
    }
    // __________________________________________________________________________________________
    
    
    
    // ==========================================================================================
    //               DEAL DAMAGE TO POINT IN WORLD
    // ==========================================================================================
    func dealDamageToPointInWorldIfTargetIsInLocation(DMG: Int, location: CGPoint, senderUnit: AbstractUnit) -> Bool {
        let nodes = self.nodesAtPoint(location)
        for node in nodes {
            if node is SKBlockMovementSpriteNode {
                if (node as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.playerSK.teamNumber {
                    (node as! SKBlockMovementSpriteNode).UnitReference.unitWillTakeDamageReturnIfUnitDies(DMG, fromUnit: senderUnit)
                    let explosion = SKSpriteNode(imageNamed: "AttackBullet6")
                    explosion.zPosition = 1000
                    explosion.xScale = 5.0
                    explosion.yScale = 5.0
                    explosion.position = location
                    self.addChildTemporaryExpand(explosion)
                    return true
                }
            }
        }
        return false
    }
    
    func dealSplashDamageToPointInWorld(DMG: Int, location: CGPoint, senderUnit: AbstractUnit) {
        let nodes = self.nodesAtPoint(location)
        for node in nodes {
            if node is SKBlockMovementSpriteNode {
                if (node as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.playerSK.teamNumber {
                    (node as! SKBlockMovementSpriteNode).UnitReference.unitWillTakeDamageReturnIfUnitDies(DMG, fromUnit: senderUnit)
                    let explosion = SKSpriteNode(imageNamed: "AttackBullet2")
                    explosion.zPosition = 99000
                    explosion.xScale = 5.0
                    explosion.yScale = 5.0
                    explosion.position = location
                    self.addChildTemporaryExpand(explosion)
                    (node as! SKBlockMovementSpriteNode).UnitReference.focusedTargetUnit = senderUnit
                }
            }
            else if node is SKSpriteMeleeSightNode {
                if (node as! SKSpriteMeleeSightNode).UnitReference.teamNumber != self.playerSK.teamNumber {
                    let SplashDMG = DMG / 2
                    (node as! SKSpriteMeleeSightNode).UnitReference.unitWillTakeDamageReturnIfUnitDies(SplashDMG, fromUnit: senderUnit)
                    let explosion = SKSpriteNode(imageNamed: "AttackBullet")
                    explosion.zPosition = 99000
                    explosion.xScale = 5.0
                    explosion.yScale = 5.0
                    explosion.position = (node as! SKSpriteMeleeSightNode).position
                    self.addChildTemporaryExpand(explosion)
                    (node as! SKSpriteMeleeSightNode).UnitReference.focusedTargetUnit = senderUnit
                }
            }
        }
    }
    // __________________________________________________________________________________________
    
}