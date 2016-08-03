//
//  GameScene_M.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/19/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene {
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        }
    
    
    func mapDataWasLoadedIntoRAM() {
        var PlayerMovement = NSTimer.scheduledTimerWithTimeInterval(
            0.55,
            target: self,
            selector: Selector("orderPlayerToMove"),
            userInfo: nil,
            repeats: true
        )
        allTimers.append(PlayerMovement)
        
        var AllUnitsAttackTargets = NSTimer.scheduledTimerWithTimeInterval(
            UnitData.MovementSpeed(),
            target: self,
            selector: Selector("orderAllUnitsToAttackTheirTargets"),
            userInfo: nil,
            repeats: true
        )
        allTimers.append(AllUnitsAttackTargets)
        
        var ScenarioListenerTimer = NSTimer.scheduledTimerWithTimeInterval(
            6.55,
            target: self,
            selector: Selector("TickScenarioSceneListener"),
            userInfo: nil,
            repeats: true
        );
        allTimers.append(ScenarioListenerTimer)
        
    }
    

    func TickScenarioSceneListener() {
        
        var tickIsEnabled = true
        var totalLivingUnits = 0
        var totalDeadUnits = 0
        
        print(AllUnitsInGameScene.count)
        for unit in AllUnitsInGameScene {
            print(unit.isDead)
            print(unit.sprite)
            if unit.isDead == true && unit.teamNumber == 2 {
                totalDeadUnits += 1
            }
            else if unit.isDead == false && unit.teamNumber == 2 {
                totalLivingUnits += 1
            } else {}
        }
        
        print("ENEMIES REMAINING: ")
        print(totalLivingUnits)
        TotalPlayer2UnitsInGameScene = totalLivingUnits
        
        print("ENEMY DEATH TOLL")
        print(totalDeadUnits)
        
//        if tickIsEnabled != false && hackmapname == "map01" {
            _ScenarioSceneListener.Tick(totalLivingUnits)
//        }
        
        if totalLivingUnits <= 1 {
            for timer in allTimers {
                print123("!!!!!!!!! TIMER WAS INVALIDATED !!!!!!!!!")
                timer.invalidate()
            }
            for unit in AllUnitsInGameScene {
                if let un = unit as? PathfinderUnit {
                    un.attackTimer?.invalidate()
                    un.sightTimer?.invalidate()
                }
            }
            map = GameMap()
            AllUnitsInGameScene = [AbstractUnit]()
            self.removeAllActions()
            self.removeAllChildren()
        }
        
    }
    
    func orderPlayerToMove() {
        (self.playerSK as! HeroFootmanUnit).issueOrderTargetingPoint(playerTarget!.position)
        debugLabel.position = playerSK.sprite.position
        debugLabel.text = String(playerSK.sprite.position)
        debugLabel.zPosition = 100
        debugLabel.fontSize = 19
    }
    
    
    func initPlayerTarget() {
        playerTarget = SKPlayerTarget(imageNamed: "player-test")
        playerTarget!.xScale = GameSettings.SpriteScale.Default
        playerTarget!.yScale = GameSettings.SpriteScale.Default
        playerTarget!.zPosition = SpritePositionZ.AliveUnit.Z
        
        print(playerTarget!.position)
        print(playerTarget!)
        print(playerSK.sprite.position)
        
        playerTarget!.position = playerSK.sprite.position
        addChild(playerTarget!)
        
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        playerTarget?.removeFromParent()

        for touch in touches {
            let location = touch.locationInNode(self)
            let selectedNode = self.nodeAtPoint(location)
            playerTarget?.position = location
            addChild(playerTarget!)
            if selectedNode is SKAbstractSprite {
                (self.playerSK as! HeroFootmanUnit).issueOrderTargetingUnit((selectedNode as! SKAbstractSprite).UnitReference!)
            } else {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
                    NSThread.sleepForTimeInterval(0.4);
                    dispatch_async(dispatch_get_main_queue()) {
                        (self.playerSK as! HeroFootmanUnit).issueOrderTargetingPoint(location)
                    }
                }
            }
        }
    }
    
    
    func debugFindUnitToMoveTowards(sender: NSTimer) {
            var targetFound = false
            unitTargetFound: for unit in self.AllUnitsInGameScene {
                let unitSelf = sender.userInfo! as! String
                
                if unit.isPlayer != true && targetFound == false && unit.sprite.name! == unitSelf {
                    let target = scanRangeLongAndGetUnit(unit)
                    unit.focusedTargetUnit = target
                    targetFound = true
                }
                
                if targetFound == true {
                    break unitTargetFound
                }
            }
    }
    
    
    func orderAllUnitsToAttackTheirTargets() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            for unit in self.AllUnitsInGameScene {
                if let target = unit.focusedTargetUnit {
                    if target.isDead == false {
                        dispatch_async(dispatch_get_main_queue()) {
                            if let subUnit = unit as? PathfinderUnit {
                                subUnit.issueOrderTargetingPoint(target.sprite.position)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    func attackUnitClosestToSender(sender: NSTimer) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
        let unitSelf = sender.userInfo! as! String
            for unit in self.AllUnitsInGameScene {
                
                
                if unit.isPlayer != true && unit.sprite.name! == unitSelf && unit is MeleeUnitNEW {
                    self.scanMeleeAndGetUnit(unit, completionHandler: { (target) in
                        
                        if let targetWasAquired = target {
                            if let subUnit = unit as? MeleeUnitNEW {
                                subUnit.fireAttackMelee(targetWasAquired)
                            }
                        }
                        
                    })
                }
                else if unit.isPlayer != true && unit.sprite.name! == unitSelf && unit is RangedUnitNEW {
                    self.scanRangedAndGetUnit(unit, completionHandler: { (target) in
                        
                        if let targetWasAquired = target {
                            if let subUnit = unit as? RangedUnitNEW {
                                subUnit.fireAttackRanged(targetWasAquired)
                            }
                        }
                    })
                }
            }
//        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func updateDebugLabel(text: String) {
        debugLabel.text = text
        debugLabel.zPosition = 100
        debugLabel.fontSize = 19
        debugLabel.position = CGPoint(x:280, y:600)
    }
    
    
    
    
    
    func generateUnitsAndTilesFromMap(mapName: String) {
        hackmapname = mapName

        AllUnitsInGameScene = map.generateGameSceneBasedFromMap(mapName)
        map.generateGameTilesetForMap(mapName)

        
        var unitI = 0
        print(AllUnitsInGameScene.count)
        for unit in AllUnitsInGameScene {
            if unit is AbstractUnit {
                
                let mirror = Mirror(reflecting: unit)
                let classname = String(mirror.subjectType)
                unit.sprite.UnitReference = unit
                unit.sprite.name = classname + "|" + "Plyr:" + String(unit.teamNumber) + "|" + String(unitI)
                unit.ReferenceOfGameScene = self
                self.addChild(unit.sprite)
                self.addChild(unit.spriteMovementBlocker)
                
//
//                if let sight = unit.sight {
//                    sight.position = unit.sprite.position
//                    self.addChild(sight)
//                }
//                unit.updateMovementBlockerPosition()
                enemies.append(unit)
//                unit.spriteMovementBlocker.UnitReference = unit
                
                
                if unit.teamNumber == 2 {
                    TotalPlayer2UnitsInGameScene += 1
                    _ScenarioSceneListener._AllEnemyUnits += 1
                }
                
                
                if (unit as! AbstractUnit).isPlayer == true {
                    playerSK = unit
                }
                else {
                    NSThread.sleepForTimeInterval(0.01);
                    
                    if case let unit_ as MeleeUnitNEW = unit {
                        
                        unit_.sightTimer = NSTimer.scheduledTimerWithTimeInterval(
                            UnitData.ScanForEnemySpeed(),
                            target: self,
                            selector: #selector(GameScene.debugFindUnitToMoveTowards),
                            userInfo: String(unit.sprite.name!), repeats: true
                        )
                        
                        unit_.attackTimer = NSTimer.scheduledTimerWithTimeInterval(
                            UnitData.AttackSpeedMelee(),
                            target: self,
                            selector: #selector(GameScene.attackUnitClosestToSender),
                            userInfo: String(unit.sprite.name!),
                            repeats: true
                        )
                        
                    } else if case let unit_ as RangedUnitNEW = unit {
                        
                        unit_.sightTimer = NSTimer.scheduledTimerWithTimeInterval(
                            UnitData.ScanForEnemySpeed(),
                            target: self,
                            selector: #selector(GameScene.debugFindUnitToMoveTowards),
                            userInfo: String(unit.sprite.name!),
                            repeats: true
                        )
                        
                        unit_.attackTimer = NSTimer.scheduledTimerWithTimeInterval(
                            UnitData.AttackSpeedRanged(),
                            target: self,
                            selector: #selector(GameScene.attackUnitClosestToSender),
                            userInfo: String(unit.sprite.name!),
                            repeats: true
                        )
                        
                    }

                }
                unitI += 1
            } else if unit is BaseStructure {
                self.addChild(unit.sprite)
            }
        }
        
        for tile in map.TilesInMap {
            print(tile)
            self.addChild(tile)
        }
        
        initPlayerTarget()
        self.addChild(debugLabel)
        
        mapDataWasLoadedIntoRAM()
    }
    
    
    
    func ThisUnitTookDamage(sprite: SKBlockMovementSpriteNode) {
        let teamNumberOfUnitTakingDamage = sprite.UnitReference.teamNumber
        let UpdateScenarioListener = sprite.UnitReference.unitWillTakeDamageReturnIfUnitDies(1)
        if UpdateScenarioListener == true {
            TotalPlayer2UnitsInGameScene -= 1;
            _ScenarioSceneListener._AllEnemyUnits -= 1;
        }
    }
    
    
    
    
    
    // going to use this one:
    func scanMeleeAndGetUnit(unit: AbstractUnit, completionHandler: (AbstractUnit?) -> ()) -> () {
        let positionOfSearchingUnit = unit.sprite.position
        for pos in self.searchArea_s1 {
            
            var posFinal = pos
            posFinal.x = pos.x + positionOfSearchingUnit.x
            posFinal.y = pos.y + positionOfSearchingUnit.y
            
            let spritesAtPoint = self.nodesAtPoint(posFinal)
            
            spritesInNodeLoop: for sprite in spritesAtPoint {
//                if sprite is SKBlockMovementSpriteNode {
//                    if (sprite as! SKBlockMovementSpriteNode).UnitReference.teamNumber != unit.teamNumber{
//                        completionHandler((sprite as! SKBlockMovementSpriteNode).UnitReference)
//                    }
//                }
                if sprite is SKAbstractSprite {
                    if (sprite as! SKAbstractSprite).UnitReference!.teamNumber != unit.teamNumber{
                        completionHandler((sprite as! SKAbstractSprite).UnitReference)
                    }
                }
            }
        }
        completionHandler(nil)
    }
    
    
    func scanRangedAndGetUnit(unit: AbstractUnit, completionHandler: (AbstractUnit?) -> ()) -> () {
        let positionOfSearchingUnit = unit.sprite.position
        for pos in self.searchArea_s5 {
            
            var posFinal = pos
            posFinal.x = pos.x + positionOfSearchingUnit.x
            posFinal.y = pos.y + positionOfSearchingUnit.y
            
            let spritesAtPoint = self.nodesAtPoint(posFinal)

            
            spritesInNodeLoop: for sprite in spritesAtPoint {

//                if sprite is SKBlockMovementSpriteNode {
//                    if (sprite as! SKBlockMovementSpriteNode).UnitReference.teamNumber != unit.teamNumber {
//                        completionHandler((sprite as! SKBlockMovementSpriteNode).UnitReference)
//                    }
//                }
                if sprite is SKAbstractSprite {
                    if (sprite as! SKAbstractSprite).UnitReference!.teamNumber != unit.teamNumber {
                        completionHandler((sprite as! SKAbstractSprite).UnitReference)
                    }
                }
                
            }
        }
        completionHandler(nil)
        //        completionHandler(unitsReturned)
    }
    
    
    
    func scanRangeLongAndGetUnit_Closure(unit: AbstractUnit, completionHandler: (AbstractUnit?) -> ()) -> () {
        
        //        var unitsReturned = [BaseUnit]()
        let positionOfSearchingUnit = unit.sprite.position
        for pos in self.searchArea_s4 {
            
            var posFinal = pos
            posFinal.x = pos.x + positionOfSearchingUnit.x
            posFinal.y = pos.y + positionOfSearchingUnit.y
            
            let spritesAtPoint = self.nodesAtPoint(posFinal)
            
            

           
            
            spritesInNodeLoop: for sprite in spritesAtPoint {
                if spritesAtPoint.count > 1 {
                    //                        print("FOUND LOTS OF SPRITES!")
                    //                        print(spritesAtPoint)
                }
                
                
                //                    print("nodes total: " + String(spritesAtPoint.count))
//                if sprite is SKBlockMovementSpriteNode {
//                    if (sprite as! SKBlockMovementSpriteNode).UnitReference.teamNumber! != unit.teamNumber {
//                        completionHandler((sprite as! SKBlockMovementSpriteNode).UnitReference)
//                    }
//                }
                if sprite is SKAbstractSprite {
                    if (sprite as! SKAbstractSprite).UnitReference!.teamNumber != unit.teamNumber {
                        completionHandler((sprite as! SKAbstractSprite).UnitReference)
                    }
                }
            }
        }
        completionHandler(nil)
        //        completionHandler(unitsReturned)
    }
    
    
    
    func scanRangeLongAndGetUnit(unit: AbstractUnit) -> AbstractUnit {
        
        var arrayOfTargetsSpotted = [AbstractUnit]()
        
        //        var unitsReturned = [BaseUnit]()
        let positionOfSearchingUnit = unit.sprite.position
        for pos in self.searchArea_s4 {
            
            var posFinal = pos
            posFinal.x = pos.x + positionOfSearchingUnit.x
            posFinal.y = pos.y + positionOfSearchingUnit.y
            
            let spritesAtPoint = self.nodesAtPoint(posFinal)
            
            
            
            
            spritesInNodeLoop: for sprite in spritesAtPoint {
                if spritesAtPoint.count > 1 {
                    //                        print("FOUND LOTS OF SPRITES!")
                    //                        print(spritesAtPoint)
                }
                
                
                //                    print("nodes total: " + String(spritesAtPoint.count))
//                if sprite is SKBlockMovementSpriteNode {
//                    if (sprite as! SKBlockMovementSpriteNode).UnitReference.teamNumber! != unit.teamNumber! {
//                        arrayOfTargetsSpotted.append((sprite as! SKBlockMovementSpriteNode).UnitReference)
//                    }
//                }
                if sprite is SKAbstractSprite {
                    if (sprite as! SKAbstractSprite).UnitReference!.teamNumber != unit.teamNumber {
                        arrayOfTargetsSpotted.append((sprite as! SKAbstractSprite).UnitReference!)
                    }
                }
                
            }
        }
        
        var nearestLocation: CGFloat?
        var unitWithNearestLocation: AbstractUnit?
        
        for unit in arrayOfTargetsSpotted {
            let enemyLocation = unit.sprite.position
            let dx = positionOfSearchingUnit.x - enemyLocation.x
            let dy = positionOfSearchingUnit.y - enemyLocation.y
            let distance = sqrt(dx*dx + dy*dy)
            
            if let nearest = nearestLocation {
                if distance < nearest {
                    nearestLocation = distance
                    unitWithNearestLocation = unit
                }
            } else {
                nearestLocation = distance
                unitWithNearestLocation = unit
            }
        }
        
        if let returnValue = unitWithNearestLocation {
            return returnValue
        } else {
            return unit
        }
        
        //        completionHandler(unitsReturned)
    }
    
    
    
    func addChildTemporary(node: SKSpriteNode) {
        temporaryNodes.append(node)
        self.addChild(node)
    }
    func clearStaleSKNodes(node: SKSpriteNode) {
        for node in temporaryNodes {
            node.removeFromParent()
        }
    }
    
    
    func makeUnitScanCurrentPosition(unit: AbstractUnit) {
        let positionOfSearchingUnit = unit.sprite.position
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for pos in self.searchArea_s1 {
                NSThread.sleepForTimeInterval(0.09);
                
                var posFinal = pos
                posFinal.x = pos.x + positionOfSearchingUnit.x
                posFinal.y = pos.y + positionOfSearchingUnit.y
                
                let spritesAtPoint = self.nodesAtPoint(posFinal)
                
                var targetAquired = false
                
                spritesInNodeLoop: for sprite in spritesAtPoint {
                    if spritesAtPoint.count > 1 {

                    }
                    

                    if sprite is SKBlockMovementSpriteNode {
                        targetAquired = true
                        break spritesInNodeLoop
                    }
                }
                
                var markerName = "player-test"
                if targetAquired == true {
                    markerName = "Enemy"
                }
                
                let targetNode = SKSpriteNode(imageNamed: markerName)
                
                dispatch_async(dispatch_get_main_queue()) {
                    targetNode.xScale = GameSettings.SpriteScale.Default
                    targetNode.yScale = GameSettings.SpriteScale.Default
                    targetNode.zPosition = SpritePositionZ.AliveUnit.Z + 50
                    
                    targetNode.position = posFinal
                    self.addChild(targetNode)
                }
                NSThread.sleepForTimeInterval(0.09);
                dispatch_async(dispatch_get_main_queue()) {
                    targetNode.removeFromParent()
                }
            }
        }
    }
    
    
    
}