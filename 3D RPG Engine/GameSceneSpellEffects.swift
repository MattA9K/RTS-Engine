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
    
    
    func playerSpellBombHelper() {
        self.castBombSpellAtPoint((playerTarget?.position)!, timeTillExplode: 20, caster: self.playerSK, DMG: 50)
    }
    
    func playerCastBlizzardHelper() {
        self.castBlizzardAttack((playerTarget?.position)!, fromUnit: playerSK)
    }
    
    func fireMissileBombPlayerHelper() {
        castMissileBombAttack(self.playerSK.positionLogical, target: (self.playerTarget?.position)!, sender: self.playerSK, Dmg: 10, DmgType: .Frost)
    }
    
    func fireMissileSpellPlayerHelper() {
        castMissileAttack(self.playerSK.positionLogical, target: (self.playerTarget?.position)!, sender: self.playerSK, Dmg: 10, DmgType: .Frost)
    }
    
    
    
    // ==========================================================================================
    //               BASIC RANGED ATTACK SPELL
    // ==========================================================================================
    
    enum DamageType {
        case Magic, Frost;
    }
    
    
    func castMissileAttack(origin: CGPoint, target: CGPoint, sender: AbstractUnit, Dmg: Int, DmgType: DamageType) {
        let missileAttackNode = MissileAttackNode(imageNamed: "AttackBullet6")
        missileAttackNode.zPosition = SpritePositionZ.AliveUnit.Z
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
    
    
    func castFrostBoltAttack(origin: CGPoint, target: CGPoint, sender: AbstractUnit, Dmg: Int, DmgType: DamageType, direction: MissileDirection) {
        let missileAttackNode = SKFrostBolt(imageNamed: "AttackBullet6")
        missileAttackNode.zPosition = SpritePositionZ.AliveUnit.Z
        missileAttackNode.xScale = 4.0
        missileAttackNode.yScale = 4.0
        missileAttackNode.position = origin
        self.addChild(missileAttackNode)
        missileAttackNode.animateFrostBolt(direction)
        missileAttackNode.engageTarget(target)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            var count = 10
            while count > -1 {
                NSThread.sleepForTimeInterval(0.1);
//                dispatch_async(dispatch_get_main_queue()) {
                    if count > 0 {
                        
                        if DmgType == .Magic {
                            
                            dispatch_async(dispatch_get_main_queue()) {
                                var didHitEnemy: Bool
                                didHitEnemy = self.dealDamageToPointInWorldIfTargetIsInLocation_USE_LESS_CPU(Dmg, location: missileAttackNode.position, senderUnit: sender)
                                if didHitEnemy == true {
                                    count = 0
//                                    dispatch_async(dispatch_get_main_queue()) {
                                        missileAttackNode.removeFromParent()
//                                    }
                                }
                            }
                        
                        } else if DmgType == .Frost {
                            
                            dispatch_async(dispatch_get_main_queue()) {
                                var didHitEnemy: Bool
                                didHitEnemy = self.dealDamageToPointInWorldIfTargetIsInLocation_USE_LESS_CPU(Dmg, location: missileAttackNode.position, senderUnit: sender)
                                if didHitEnemy == true {
                                    count = 0
//                                    dispatch_async(dispatch_get_main_queue()) {
                                        missileAttackNode.removeFromParent()
//                                    }
                                }
                            }
                        
                            
                        }
                    } else if count == 0 {
                        dispatch_async(dispatch_get_main_queue()) {
                            missileAttackNode.removeFromParent()
                        }
                    }
                    count = count - 1
//                }
            }
        }
    }
    
    
    func castMissileBombAttack(origin: CGPoint, target: CGPoint, sender: AbstractUnit, Dmg: Int, DmgType: DamageType) {
        let missileAttackNode = MissileAttackNode(imageNamed: "AttackBullet6")
        missileAttackNode.zPosition = SpritePositionZ.AliveUnit.Z
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
        MAN.zPosition = SpritePositionZ.AliveUnit.Z
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
                        let destinationOfFrostBolt1 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 300, movingInDirection: .UP)
//                        dispatch_async(dispatch_get_main_queue()) {
                            self.castFrostBoltAttack(MAN.position, target: destinationOfFrostBolt1.FinalDestination, sender: sender, Dmg: self.frozenOrbDamage, DmgType: .Frost, direction: .UP)
//                        }
                        
                        let destinationOfFrostBolt2 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 300, movingInDirection: .DOWN)
//                        dispatch_async(dispatch_get_main_queue()) {
                            self.castFrostBoltAttack(MAN.position, target: destinationOfFrostBolt2.FinalDestination, sender: sender, Dmg: self.frozenOrbDamage, DmgType: .Frost, direction: .DOWN)
//                        }
                        
                        let destinationOfFrostBolt3 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 300, movingInDirection: .LEFT)
//                        dispatch_async(dispatch_get_main_queue()) {
                            self.castFrostBoltAttack(MAN.position, target: destinationOfFrostBolt3.FinalDestination, sender: sender, Dmg: self.frozenOrbDamage, DmgType: .Frost, direction: .LEFT)
//                        }

                        let destinationOfFrostBolt4 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 300, movingInDirection: .RIGHT)
//                        dispatch_async(dispatch_get_main_queue()) {
                            self.castFrostBoltAttack(MAN.position, target: destinationOfFrostBolt4.FinalDestination, sender: sender, Dmg: self.frozenOrbDamage, DmgType: .Frost, direction: .RIGHT)
//                        }

                        let destinationOfFrostBolt5 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 300, movingInDirection: .UL)
//                        dispatch_async(dispatch_get_main_queue()) {
                            self.castFrostBoltAttack(MAN.position, target: destinationOfFrostBolt5.FinalDestination, sender: sender, Dmg: self.frozenOrbDamage, DmgType: .Frost, direction: .UL)
//                        }

                        let destinationOfFrostBolt6 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 300, movingInDirection: .UR)
//                        dispatch_async(dispatch_get_main_queue()) {
                            self.castFrostBoltAttack(MAN.position, target: destinationOfFrostBolt6.FinalDestination, sender: sender, Dmg: self.frozenOrbDamage, DmgType: .Frost, direction: .UR)
//                        }

                        let destinationOfFrostBolt7 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 300, movingInDirection: .DL)
//                        dispatch_async(dispatch_get_main_queue()) {
                            self.castFrostBoltAttack(MAN.position, target: destinationOfFrostBolt7.FinalDestination, sender: sender, Dmg: self.frozenOrbDamage, DmgType: .Frost, direction: .DL)
//                        }

                        let destinationOfFrostBolt8 = MissleDestinationCalculator(x: MAN.position.x, y: MAN.position.y, distance: 300, movingInDirection: .DR)
//                        dispatch_async(dispatch_get_main_queue()) {
                            self.castFrostBoltAttack(MAN.position, target: destinationOfFrostBolt8.FinalDestination, sender: sender, Dmg: self.frozenOrbDamage, DmgType: .Frost, direction: .DR)
//                        }
                        
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
            for unitUUID in self.AllUnitGUIDs {
                if self.AllUnitsInGameScene[unitUUID]!.teamNumber == 1 && self.AllUnitsInGameScene[unitUUID]!.isPlayer != true {
                    if self.AllUnitsInGameScene[unitUUID]!.isDead == false && self.AllUnitsInGameScene[unitUUID]! is FootmanMercUnit {
                        units.append(self.AllUnitsInGameScene[unitUUID]!)
                    }
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
            for unitUUID in self.AllUnitGUIDs {
                if self.AllUnitsInGameScene[unitUUID]!.teamNumber == 1 && self.AllUnitsInGameScene[unitUUID]!.isPlayer != true {
                    if self.AllUnitsInGameScene[unitUUID]!.isDead == false && self.AllUnitsInGameScene[unitUUID]! is FootmanMercUnit {
                        units.append(self.AllUnitsInGameScene[unitUUID]!)
                    }
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
    
    


    
    // ==========================================================================================
    //               BOMB EXPLODES AFTER SPAWNING
    // ==========================================================================================
    
    func castBombSpellAtPoint(point: CGPoint, timeTillExplode: Int, caster: AbstractUnit, DMG: Int) {
        let missileAttackNode = SKIceTimedBomb(imageNamed: "bomb-blue-4")
        missileAttackNode.zPosition = SpritePositionZ.AliveUnit.Z
        missileAttackNode.xScale = 1.0
        missileAttackNode.yScale = 1.0
        missileAttackNode.position = point
        self.addChild(missileAttackNode)
        missileAttackNode.animateLoop()

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            var count = timeTillExplode
            while count > -1 {
                NSThread.sleepForTimeInterval(0.1);
                dispatch_async(dispatch_get_main_queue()) {
                    if count == 1 {
                        
                        
                        self.dealSplashDamageToPointInWorld_FROST_EXPLOSION(DMG, location: missileAttackNode.position, senderUnit: caster)
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

    
    func castBlizzardAttack(atPoint: CGPoint, fromUnit: AbstractUnit) {
        let blizzardOriginCloud = SKSpriteNode(imageNamed: "AttackBullet4")
        blizzardOriginCloud.zPosition = SpritePositionZ.AliveUnit.Z
        blizzardOriginCloud.xScale = 5.0
        blizzardOriginCloud.yScale = 5.0
        var newPoint = atPoint
        newPoint.y += 200
        blizzardOriginCloud.position = newPoint
        self.addChild(blizzardOriginCloud)
        self.blizzardStormDrops(50, origin: blizzardOriginCloud.position, cloud: blizzardOriginCloud, senderUnit: fromUnit)
    }
    
    func blizzardStormDrops(totalDrops: Int, origin: CGPoint, cloud: SKSpriteNode, senderUnit: AbstractUnit) {
        
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
                    let blizzardRainDrop = SKIcicleExplosion(imageNamed: "iceicle-blue-falling")
                    blizzardRainDrop.zPosition = SpritePositionZ.AliveUnit.Z
                    blizzardRainDrop.xScale = 0.25
                    blizzardRainDrop.yScale = 0.25
                    blizzardRainDrop.position = origin
                    blizzardRainDrop.position.x -= 100
                    blizzardRainDrop.position.x += randomNumberX()
                    self.addChild(blizzardRainDrop)
                    var destination = origin
                    destination.x = blizzardRainDrop.position.x
                    destination.y -= randomNumberY()
                    blizzardRainDrop.engageTargetAndWait(destination, duration: 0.5, completion: {
                        let targetWasHit = self.dealDamageToPointInWorldIfTargetIsInLocation(10, location: destination, senderUnit: senderUnit)
                        blizzardRainDrop.animateOnce()
//                        if targetWasHit == false {
//                            blizzardRainDrop.removeFromParent()
//                        } else {
//                            blizzardRainDrop.removeFromParent()
//                        }
                    })
                }
                if remainingDrops < 2 {
                    cloud.removeFromParent()
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
                explosion.zPosition = SpritePositionZ.AliveUnit.Z
                explosion.xScale = 1.0
                explosion.yScale = 1.0
                explosion.position = location
                self.addChildTemporaryExpand(explosion)
                let freezeColor = UIColor(hue: 0.5722, saturation: 1, brightness: 1, alpha: 1.0)
                    
                    if (node as! SKAbstractSprite).UnitReference?.focusedTargetUnit?.isDead != false {
                        (node as! SKAbstractSprite).UnitReference?.focusedTargetUnit = senderUnit
                    }
                
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
                    explosion.zPosition = SpritePositionZ.AliveUnit.Z
                    explosion.xScale = 5.0
                    explosion.yScale = 5.0
                    explosion.position = location
                    self.addChildTemporaryExpand(explosion)
                    
                    (node as! SKBlockMovementSpriteNode).UnitReference.focusedTargetUnit = self.playerSK
                    if let unitDamaged = (node as! SKBlockMovementSpriteNode).UnitReference {
                        if var focusedTargetUnit = unitDamaged.focusedTargetUnit {
                            focusedTargetUnit = senderUnit
                        }
                    }
                    return true
                }
            }
        }
        return false
    }
    func dealDamageToPointInWorldIfTargetIsInLocation_USE_LESS_CPU(DMG: Int, location: CGPoint, senderUnit: AbstractUnit) -> Bool {
        let node = self.nodeAtPoint(location)
        if node is SKBlockMovementSpriteNode {
            if (node as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.playerSK.teamNumber {
                (node as! SKBlockMovementSpriteNode).UnitReference.unitWillTakeDamageReturnIfUnitDies(DMG, fromUnit: senderUnit)
                let explosion = SKIcicleExplosion(imageNamed: "AttackBullet6")
                explosion.zPosition = SpritePositionZ.AliveUnit.Z
                explosion.xScale = 4.5
                explosion.yScale = 4.5
                explosion.position = location
                self.addChild(explosion)
                explosion.runAction(SKAction.colorizeWithColor(UIColor.cyanColor(), colorBlendFactor: 0.75, duration: 0.01), completion: {
                    explosion.animateOnce()
                })
                
                
//                let freezeColor = UIColor(hue: 0.5722, saturation: 1, brightness: 1, alpha: 1.0)
//                (node as! SKBlockMovementSpriteNode).UnitReference.sprite.runAction(
//                    SKAction.colorizeWithColor(freezeColor, colorBlendFactor: 0.90, duration: 0.3),
//                    completion: {
//                        (node as! SKBlockMovementSpriteNode).UnitReference.isFrozen = 0.5
//                        
//                        var remainingTime = 20 // FREEZE DURATION
//                        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_, 0)) {
//                            while remainingTime > -1 {
//                                NSThread.sleepForTimeInterval(0.2);
//                                dispatch_async(dispatch_get_main_queue()) {
//                                    if remainingTime == 0 {
//                                        (node as! SKBlockMovementSpriteNode).UnitReference.isFrozen = 0.0
//                                        (node as! SKBlockMovementSpriteNode).UnitReference.sprite.runAction(
//                                            SKAction.colorizeWithColor(UIColor.whiteColor(),
//                                                colorBlendFactor: 1.0,
//                                                duration: 0.5
//                                            )
//                                        )
//                                    }
//                                    remainingTime -= 1
//                                }
//                            }
//                        }
//                })
                
                
                (node as! SKBlockMovementSpriteNode).UnitReference.focusedTargetUnit = self.playerSK
                if let unitDamaged = (node as! SKBlockMovementSpriteNode).UnitReference {
                    if var focusedTargetUnit = unitDamaged.focusedTargetUnit {
                        focusedTargetUnit = senderUnit
                    }
                }
                return true
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
                    explosion.zPosition = SpritePositionZ.AliveUnit.Z
                    explosion.xScale = 5.0
                    explosion.yScale = 5.0
                    explosion.position = location
                    self.addChildTemporaryExpand(explosion)
                    if let unitDamaged = (node as! SKBlockMovementSpriteNode).UnitReference {
                        if var focusedTargetUnit = unitDamaged.focusedTargetUnit {
                            focusedTargetUnit = senderUnit
                        }
                    }
                }
            }
            else if node is SKSpriteMeleeSightNode {
                if (node as! SKSpriteMeleeSightNode).UnitReference.teamNumber != self.playerSK.teamNumber {
                    let SplashDMG = DMG / 2
                    (node as! SKSpriteMeleeSightNode).UnitReference.unitWillTakeDamageReturnIfUnitDies(SplashDMG, fromUnit: senderUnit)
                    let explosion = SKSpriteNode(imageNamed: "AttackBullet")
                    explosion.zPosition = SpritePositionZ.AliveUnit.Z
                    explosion.xScale = 5.0
                    explosion.yScale = 5.0
                    explosion.position = (node as! SKSpriteMeleeSightNode).position
                    self.addChildTemporaryExpand(explosion)
                    if let unitDamaged = (node as! SKBlockMovementSpriteNode).UnitReference {
                        if var focusedTargetUnit = unitDamaged.focusedTargetUnit {
                            focusedTargetUnit = senderUnit
                        }
                    }
                }
            }
        }
    }
    
    func dealSplashDamageToPointInWorld_FROST_EXPLOSION(DMG: Int, location: CGPoint, senderUnit: AbstractUnit) {
        
        let explosion = SKFrostExplosion(imageNamed: "explosion-blue-1")
        explosion.zPosition = SpritePositionZ.AliveUnit.Z
        explosion.xScale = 1.0
        explosion.yScale = 1.0
        explosion.position = location
        self.addChild(explosion)
        explosion.animateOnce()
        
        let nodes = self.nodesAtPoint(location)
        for node in nodes {
            if node is SKBlockMovementSpriteNode {
                if (node as! SKBlockMovementSpriteNode).UnitReference.teamNumber != self.playerSK.teamNumber {
                    (node as! SKBlockMovementSpriteNode).UnitReference.unitWillTakeDamageReturnIfUnitDies(DMG, fromUnit: senderUnit)
                    

                    
                    (node as! SKBlockMovementSpriteNode).UnitReference.focusedTargetUnit = senderUnit
                }
            }
            else if node is SKSpriteMeleeSightNode {
                if (node as! SKSpriteMeleeSightNode).UnitReference.teamNumber != self.playerSK.teamNumber {
                    let SplashDMG = DMG / 2
                    (node as! SKSpriteMeleeSightNode).UnitReference.unitWillTakeDamageReturnIfUnitDies(SplashDMG, fromUnit: senderUnit)
                    
//                    let explosion = SKFrostExplosion(imageNamed: "explosion-blue-1")
//                    explosion.zPosition = SpritePositionZ.AliveUnit.Z
//                    explosion.xScale = 1.0
//                    explosion.yScale = 1.0
//                    explosion.position = (node as! SKSpriteMeleeSightNode).position
//                    self.addChild(explosion)
//                    explosion.animateOnce()
                    
                    (node as! SKSpriteMeleeSightNode).UnitReference.focusedTargetUnit = senderUnit
                }
            }
        }
    }
    // __________________________________________________________________________________________
    
}