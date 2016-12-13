//
//  GameScene_TimerEventHandlers.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/10/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



extension GameScene {
    
    func didFinishLoadingBlankGameScene() {
        spriteControlPanel = UIPlayerControlPanel(gameScene: self, playerUnit: self.playerSK)
        if let scp = spriteControlPanel {
            scp.joyStick.setGameSceneRef(self)
            scp.activateFromViewController()
            scp.updateLevelValues()
        }
        

        let PlayerMovement = Timer.scheduledTimer(
            timeInterval: UnitData.MovementSpeed(),
            target: self,
            selector: #selector(GameScene.orderPlayerToMove),
            userInfo: nil,
            repeats: true
        )
        allTimers.append(PlayerMovement)

        
        
    }
    
    func activateTimers() {
        
//        if self.playerIsHost == true {
            let attackTimer = Timer.scheduledTimer(
                timeInterval: UnitData.AttackSpeedMelee(),
                target: self,
                selector: #selector(GameScene.attackUnitClosestToSenderMELEE),
                userInfo: "",
                repeats: true
            )
            allTimers.append(attackTimer)
        
        if self.currentPlayerNumber == 1 {
            let AllUnitsAttackTargets = Timer.scheduledTimer(
                timeInterval: UnitData.MovementSpeed(),
                target: self,
                selector: #selector(GameScene.orderAllUnitsToMoveTowardsAttackRangeOfCurrentTargetIfCurrentTargetExists),
                userInfo: nil,
                repeats: true
            )
            allTimers.append(AllUnitsAttackTargets)
            
            let rangedTimer = Timer.scheduledTimer(
                timeInterval: UnitData.AttackSpeedRanged(),
                target: self,
                selector: #selector(GameScene.attackUnitClosestToSenderRANGED),
                userInfo: "",
                repeats: true
            )
            allTimers.append(rangedTimer)
        }
        
        
        /*
         let ScenarioListenerTimer = Timer.scheduledTimer(
         timeInterval: 6.55,
         target: self,
         selector: #selector(GameScene.TickScenarioSceneListener),
         userInfo: nil,
         repeats: true
         );
         allTimers.append(ScenarioListenerTimer)
         */
//        }
        
    }
    
    // ⏱
    func TickScenarioSceneListener() {
        //        var tickIsEnabled = true
        var totalLivingUnits = 0
        var totalDeadUnits = 0
        
        if playerSK.HP < playerSK.HP_MAX {
            playerSK.HP += 1
        }
        
        //        print(AllUnitsInGameScene.count)
        for unitUUID in AllUnitGUIDs {
            //            print(unit.isDead)
            //            print(unit.sprite)
            if self.AllUnitsInGameScene[unitUUID]!.isDead == true && self.AllUnitsInGameScene[unitUUID]!.teamNumber == 2 {
                totalDeadUnits += 1
            }
            else if self.AllUnitsInGameScene[unitUUID]!.isDead == false && self.AllUnitsInGameScene[unitUUID]!.teamNumber == 2 {
                totalLivingUnits += 1
            } else {}
        }
        
        //        print("ENEMIES REMAINING: ")
        //        print(totalLivingUnits)
        TotalPlayer2UnitsInGameScene = totalLivingUnits
        
        //        print("ENEMY DEATH TOLL")
        //        print(totalDeadUnits)
        
        //        if tickIsEnabled != false && hackmapname == "map01" {
        _ScenarioSceneListener.Tick(totalLivingUnits)
        //        }
        
        if totalLivingUnits <= 1 {
            for timer in allTimers {
                print123("!!!!!!!!! TIMER WAS INVALIDATED !!!!!!!!!")
                timer.invalidate()
            }
            for unitUUID in AllUnitGUIDs {
                if let un = self.AllUnitsInGameScene[unitUUID]! as? PathfinderUnit {
                    un.attackTimer?.invalidate()
                    un.sightTimer?.invalidate()
                }
            }
            map = GameMap()
            AllUnitsInGameScene = [UUID:AbstractUnit]()
            self.removeAllActions()
            self.removeAllChildren()
        }
        
    }
    
    
    // ⏱
    func orderAllUnitsToMoveTowardsAttackRangeOfCurrentTargetIfCurrentTargetExists() {
        for unit in self.AllUnitsInGameScene {
            if unit.value is PathfinderUnit {

                let isMoving : Bool = (unit.value as! PathfinderUnit).isMoving
                let isJunkyardDog : Bool = (unit.value as! PathfinderUnit).hasJunkyardDogBehavior
                let isHatchery : Bool = (unit.value as! PathfinderUnit).hasHatcheryBehavior

                if isMoving == false && isJunkyardDog == false {
                    if let target = (unit.value as! PathfinderUnit).focusedTargetUnit {
                        let targetLoc = target.positionLogical

                        print(" \n \n \n orderAllUnitsToMoveTowardsAttackRangeOfCurrentTargetIfCurrentTargetExists");

                        // MOVE TORWARDS TARGET ENEMY IF AN ENEMY EXISTS
                        if (unit.value as! PathfinderUnit).isDead == false && (unit.value as! PathfinderUnit).isMoving == false {
                            (unit.value as! PathfinderUnit).issueMultiplayerAIOrderTargetingPoint(targetLoc, completionHandler: { finalDestination in
                                self.AllUnitsInGameScenePositions[(unit.value as! PathfinderUnit).uuid.uuidString] = finalDestination
                            })
                        }
                    }
                }
                else if isJunkyardDog == true && isMoving == false {
                    if let target = (unit.value as! PathfinderUnit).focusedTargetUnit {
                        guard target.isDead == true else {
                            return
                        }
                        let rollDice10Sides = Int(arc4random_uniform(10))
                        if rollDice10Sides < 5 {
                            print("hasJunkyardDogBehavior")
                            if let dog = unit.value as? JunkyardDogUnit {
                                print("JUNKYARD DOG ORDER WAS JUST ISSUED!")
                                dog.issueJunkYardDogOrder()
                            }
                        }
                    } else {
                        let rollDice10Sides = Int(arc4random_uniform(10))
                        if rollDice10Sides < 5 {
                            print("hasJunkyardDogBehavior")
                            if let dog = unit.value as? JunkyardDogUnit {
                                print("JUNKYARD DOG ORDER WAS JUST ISSUED!")
                                dog.issueJunkYardDogOrder()
                            }
                        }
                    }
                }
            }

            else if unit.value is HatcheryUnit {
                let rollDice10Sides = Int(arc4random_uniform(10))
                if rollDice10Sides == 5 {
                    print("hasHatcheryBehavior")
                    if let hatchery = unit.value as? HatcheryUnit {
                        print("JUNKYARD DOG ORDER WAS JUST ISSUED!")
                        hatchery.issueHatcheryOrder()
                    }
                }
            }
        }
    }
    
    
    // ⏱
    func attackUnitClosestToSenderMELEE(_ sender: Timer) {
        //        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
        for unitUUID in AllUnitGUIDs {
            if self.AllUnitsInGameScene[unitUUID]!.isPlayer != true && self.AllUnitsInGameScene[unitUUID]! is MeleeUnitNEW {
                
                if (self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit?.isDead == false || self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit != nil) &&
                    (self.AllUnitsInGameScene[unitUUID]! as! MeleeUnitNEW).CoolingDown == false && (self.AllUnitsInGameScene[unitUUID]! as! MeleeUnitNEW).isMoving == false
                {
                    if (self.AllUnitsInGameScene[unitUUID]! as? MeleeUnitNEW)!.isAutonomous == true {
                        
                        (self.AllUnitsInGameScene[unitUUID]! as? MeleeUnitNEW)!.fireAttackMelee(self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit!)
                    }
                }
            }
        }
        //        }
    }
    
    
    // ⏱
    func attackUnitClosestToSenderRANGED(_ sender: Timer) {
        //        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
        for unitUUID in AllUnitGUIDs {
            if self.AllUnitsInGameScene[unitUUID]!.isPlayer != true && self.AllUnitsInGameScene[unitUUID]! is RangedUnitNEW {
                
                if (self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit?.isDead == false || self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit != nil) &&
                    (self.AllUnitsInGameScene[unitUUID]! as! RangedUnitNEW).CoolingDown == false && (self.AllUnitsInGameScene[unitUUID]! as! RangedUnitNEW).isMoving == false
                {
                    (self.AllUnitsInGameScene[unitUUID]! as? RangedUnitNEW)!.fireAttackRanged(self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit!)
                }
            }
            //            }
        }
    }
    
}
