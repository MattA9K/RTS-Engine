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
        
//        var PlayerMovement = NSTimer.scheduledTimerWithTimeInterval(
//            0.55,
//            target: self,
//            selector: Selector("orderPlayerToMove"),
//            userInfo: nil,
//            repeats: true
//        )
//        allTimers.append(PlayerMovement)
        
        
        var AllUnitsAttackTargets = NSTimer.scheduledTimerWithTimeInterval(
            0.4,
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

        spriteControlPanel = UIPlayerControlPanel(gameScene: self, playerUnit: playerSK)
        spriteControlPanel?.joyStick.setGameSceneRef(self)
        spriteControlPanel?.activateFromViewController()
    }
    
    
    func didMoveJoystick(direction: String) {


        if direction == "left" {
//            playerTarget?.position.x -= 50
            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepLEFT({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.UUIDString] = finalDestination
                })
            }
//            spriteControlPanel?.moveByXNegative()
//            anchorPoint.x += 50.0 / self.size.width
        }
        else if direction == "face-left" {
            playerSK.sprite.playFaceLeftAnimation()
            playerSK.angleFacing = UnitFaceAngle.Left
        }
            
        else if direction == "face-right" {
            playerSK.sprite.playFaceRightAnimation()
            playerSK.angleFacing = UnitFaceAngle.Right
        }
        else if direction == "right" {
//            playerTarget?.position.x += 50
            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepRIGHT({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.UUIDString] = finalDestination
                })
            }

//            spriteControlPanel?.moveByXPositive()
//            anchorPoint.x -= 50.0 / self.size.width
        }
            
        else if direction == "face-up" {
            playerSK.sprite.playFaceUpAnimation()
            playerSK.angleFacing = UnitFaceAngle.Up
        }
        else if direction == "up" {
//            playerTarget?.position.y += 50
            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepUP({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.UUIDString] = finalDestination
                })
            }

//            anchorPoint.y -= 50.0 / self.size.height
//            spriteControlPanel?.moveByYPositive()
        }

        else if direction == "face-down" {
            playerSK.sprite.playFaceDownAnimation()
            playerSK.angleFacing = UnitFaceAngle.Down
        }
        else if direction == "down" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepDOWN({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.UUIDString] = finalDestination
                })
            }

//            anchorPoint.y += 50.0 / self.size.height
//            spriteControlPanel?.moveByYNegative()
        }
            
        else if direction == "face-ul" {
            playerSK.sprite.playFaceULAnimation()
            playerSK.angleFacing = UnitFaceAngle.UL
        }
        else if direction == "face-ur" {
            playerSK.sprite.playFaceURAnimation()
            playerSK.angleFacing = UnitFaceAngle.UR
        }
            
        else if direction == "face-dl" {
            playerSK.sprite.playFaceDLAnimation()
            playerSK.angleFacing = UnitFaceAngle.DL
        }
        else if direction == "face-dr" {
            playerSK.sprite.playFaceDRAnimation()
            playerSK.angleFacing = UnitFaceAngle.DR
        }
       
        else if direction == "ul" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                let playerDidMove = (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepUL({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.UUIDString] = finalDestination
                })
            }

//            if playerDidMove == true {
//                anchorPoint.x += 50.0 / self.size.width
//                anchorPoint.y -= 50.0 / self.size.height
//                spriteControlPanel?.moveByXNegative()
//                spriteControlPanel?.moveByYPositive()
//            }

        }
        else if direction == "ur" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                let playerDidMove = (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepUR({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.UUIDString] = finalDestination
                })
            }

//            if playerDidMove == true {
//                anchorPoint.x -= 50.0 / self.size.width
//                anchorPoint.y -= 50.0 / self.size.height
//                spriteControlPanel?.moveByXPositive()
//                spriteControlPanel?.moveByYPositive()
//            }
        }
        else if direction == "dl" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                let playerDidMove = (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepDL({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.UUIDString] = finalDestination
                })
            }

//            if playerDidMove == true {
//                anchorPoint.x += 50.0 / self.size.width
//                anchorPoint.y += 50.0 / self.size.height
//                spriteControlPanel?.moveByXNegative()
//                spriteControlPanel?.moveByYNegative()
//            }

        }
        else if direction == "dr" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                let playerDidMove = (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepDR({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.UUIDString] = finalDestination
                })
            }

//            if playerDidMove == true {
//                anchorPoint.x -= 50.0 / self.size.width
//                anchorPoint.y += 50.0 / self.size.height
//                spriteControlPanel?.moveByXPositive()
//                spriteControlPanel?.moveByYNegative()
//            }
        }
    }
    
    
    func UnitWasSelectedByThePlayer(unit: AbstractUnit) {
        self.loadSelectedUnitIntoGUI(unit)
    }
    
    
    func loadSelectedUnitIntoGUI(unit: AbstractUnit) {
        self.spriteControlPanel?.labelUnitName.text = unit.nameGUI
    }
    

    func TickScenarioSceneListener() {
        var tickIsEnabled = true
        var totalLivingUnits = 0
        var totalDeadUnits = 0
        
        if playerSK.HP < playerSK.HP_MAX {
            playerSK.HP += 1
        }
        
//        print(AllUnitsInGameScene.count)
        for unit in AllUnitsInGameScene {
//            print(unit.isDead)
//            print(unit.sprite)
            if unit.isDead == true && unit.teamNumber == 2 {
                totalDeadUnits += 1
            }
            else if unit.isDead == false && unit.teamNumber == 2 {
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
//        (self.playerSK as! HeroFootmanUnit).issueOrderTargetingPoint(playerTarget!.position)
    }
    
    
    func updateDebugLabel() {
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
        playerTarget!.position = playerSK.sprite.position
        addChild(playerTarget!)
        
        
    }
    
    
    func resetPlayerTarget() {
        if let target = playerTarget {
            target.position = playerSK.sprite.position
        }
    }
    
    // 🔵
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        playerTarget?.removeFromParent()

        for touch in touches {
            let location = touch.locationInNode(self)
            let selectedNodes = self.nodesAtPoint(location)
//            playerTarget?.position = location
//            addChild(playerTarget!)
            
            for node in selectedNodes {
                if node is SKAbstractSprite {
                    
//                    self.spriteControlPanel?.labelUnitName.text = ((node as! SKAbstractSprite).UnitReference as! AbstractUnit)!.nameGUI
//                    self.spriteControlPanel?.labelArmor.text = "Armor: \(((node as! SKAbstractSprite).UnitReference as! AbstractUnit)!.Armor)"
//                    self.spriteControlPanel?.labelSpeed.text = "HP: \(((node as! SKAbstractSprite).UnitReference as! AbstractUnit).HP) "
//                    self.spriteControlPanel?.labelDamage.text = "Damage: \(((node as! SKAbstractSprite).UnitReference as! AbstractUnit).DMG) "
                } else if node is SKBlockMovementSpriteNode {
                    
                    (node as! SKBlockMovementSpriteNode).UnitReference.focusedTargetUnit = playerSK
                    
                    self.spriteControlPanel?.labelArmor.text = "Armor: \((node as! SKBlockMovementSpriteNode).UnitReference.Armor)"
                    self.spriteControlPanel?.labelSpeed.text = "HP: \(((node as! SKBlockMovementSpriteNode).UnitReference as! AbstractUnit).HP) "
                    self.spriteControlPanel?.labelDamage.text = "Damage: \(((node as! SKBlockMovementSpriteNode).UnitReference as! AbstractUnit).DMG) "
                    self.spriteControlPanel?.labelUnitName.text = (node as! SKBlockMovementSpriteNode).UnitReference.nameGUI
                }
            }
            
        }
    }
 
    
    // 🔵
    func debugFindUnitToMoveTowards(sender: NSTimer) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            var targetFound = false
            unitTargetFound: for unit in self.AllUnitsInGameScene {
                let unitSelf = sender.userInfo! as! String
                
                if unit.isPlayer != true && targetFound == false && unit.sprite.name! == unitSelf {
                    // PERFORMANCE BOOST?
                    if unit.focusedTargetUnit == nil {
                        let target = self.scanRangeLongAndGetUnit(unit)
                        unit.focusedTargetUnit = target
                        targetFound = true
                    }
                }
            }
//        }
    }
    
    // 🔵
    func orderAllUnitsToAttackTheirTargets() {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            for unit in self.AllUnitsInGameScene {
                if unit is PathfinderUnit {
                    if (unit as! PathfinderUnit).isMoving == false {
                        if let target = unit.focusedTargetUnit {
                            if target.isDead == false {
//                                dispatch_async(dispatch_get_main_queue()) {
                                    if let subUnit = unit as? PathfinderUnit {
                                        
                                        let positionOfTargetUsingRAM = self.AllUnitsInGameScenePositions[target.uuid.UUIDString]
//                                        if  != target.sprite.position {
                                
                                        
                                            subUnit.issueOrderTargetingPoint(positionOfTargetUsingRAM!, completionHandler: { finalDestination in
                                                // GUID = DESTINATION
                                                print("FINAL DESTINATION: \(finalDestination)")
                                                self.AllUnitsInGameScenePositions[subUnit.uuid.UUIDString] = finalDestination
                                                
                                            })
//                                        }

                                    }
//                                }
                            }
                        }
                    }
                }
            }
//        }
    }
    
    

    // 🔵
    func attackUnitClosestToSenderMELEE(sender: NSTimer) {
        let unitSelf = sender.userInfo! as! String
        
        for unit in self.AllUnitsInGameScene {
            if unit.isPlayer != true && unit.sprite.name! == unitSelf && unit is MeleeUnitNEW {
                
                if unit.focusedTargetUnit?.isDead == false {
                    (unit as? MeleeUnitNEW)!.fireAttackMelee(unit.focusedTargetUnit!)
                }
                
                
//                self.scanMeleeAndGetUnit(unit, completionHandler: { (target) in
//                    
//                    if let targetWasAquired = target {
//                        if let subUnit = unit as? MeleeUnitNEW {
//                            if subUnit.CoolingDown == false {
//                                subUnit.fireAttackMelee(targetWasAquired)
//                            }
//                        }
//                    }
//                    
//                })
            }
        }
    }
    
    // 🔵
    func attackUnitClosestToSenderRANGED(sender: NSTimer) {
        let unitSelf = sender.userInfo! as! String
        
        var debugTotalAttacks = 0
        var debugTotalRangedUnits = 0
        printgs("attackUnitClosestToSenderRANGED() was called.")
        
        for unit in self.AllUnitsInGameScene {
            if unit.isPlayer != true && unit.sprite.name! == unitSelf {
                debugTotalRangedUnits += 1
                self.scanRangedAndGetUnit(unit, completionHandler: { (target) in
                    
                    if let targetWasAquired = target {
                        if let subUnit = unit as? RangedUnitNEW {
                            if subUnit.CoolingDown == false {
                                debugTotalAttacks += 1
                                subUnit.fireAttackRanged(targetWasAquired)
                            }
                        }
                    }
                })
            }
        }
        
        printgs("fireAttackRanged() was called \(debugTotalAttacks) times.")
        printgs("there are \(self.AllUnitsInGameScene.count) total units in the map.")
        printgs("there are \(debugTotalRangedUnits) total ranged units.")
    }
    
    
    func updateResourceBars() {
        let health = CGFloat(playerSK.HP) / CGFloat(playerSK.HP_MAX)
        self.spriteControlPanel?.updateResourceBar(health, resourceType: .HP)
        
        let mana = CGFloat(playerSK.MANA) / CGFloat(playerSK.MANA_MAX)
        self.spriteControlPanel?.updateResourceBar(mana, resourceType: .Mana)
        
        let experience = CGFloat((spriteControlPanel?.heroStat!.XP)!) / CGFloat((spriteControlPanel?.heroStat?.XP_MAX)!)
        self.spriteControlPanel?.updateResourceBar(experience, resourceType: .EXP)
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
    
    
    
    // 🔵
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
                self.addChild(unit.spriteSight)
                enemies.append(unit)
                
                if unit.teamNumber == 2 {
                    TotalPlayer2UnitsInGameScene += 1
                    _ScenarioSceneListener._AllEnemyUnits += 1
                }
                
                
                if (unit as! AbstractUnit).isPlayer == true {
                    playerSK = unit
                }
                else {
//                    NSThread.sleepForTimeInterval(0.18);
                    
                    if case let unit_ as MeleeUnitNEW = unit {
                        
//                        unit_.sightTimer = NSTimer.scheduledTimerWithTimeInterval(
//                            UnitData.ScanForEnemySpeed(),
//                            target: self,
//                            selector: #selector(GameScene.debugFindUnitToMoveTowards),
//                            userInfo: String(unit.sprite.name!), repeats: true
//                        )
                        unit_.attackTimer = NSTimer.scheduledTimerWithTimeInterval(
                            UnitData.AttackSpeedMelee(),
                            target: self,
                            selector: #selector(GameScene.attackUnitClosestToSenderMELEE),
                            userInfo: String(unit.sprite.name!),
                            repeats: true
                        )
                        
                    } else if case let unit_ as RangedUnitNEW = unit {
                        
//                        unit_.sightTimer = NSTimer.scheduledTimerWithTimeInterval(
//                            UnitData.ScanForEnemySpeed(),
//                            target: self,
//                            selector: #selector(GameScene.debugFindUnitToMoveTowards),
//                            userInfo: String(unit.sprite.name!),
//                            repeats: true
//                        )
                        unit_.attackTimer = NSTimer.scheduledTimerWithTimeInterval(
                            UnitData.AttackSpeedRanged(),
                            target: self,
                            selector: #selector(GameScene.attackUnitClosestToSenderRANGED),
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
        
        //initPlayerTarget()
        self.addChild(debugLabel)
        
        mapDataWasLoadedIntoRAM()
        printDebugInfoAfterInitilization()
    }
    
    // 🔵
    func printDebugInfoAfterInitilization() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            NSThread.sleepForTimeInterval(3.0)
            dispatch_async(dispatch_get_main_queue()) {
                print("DEBUG INFO: ")
                print("ALL UNITS IN GAME SCENE: \(self.AllUnitsInGameScene)")
                for unit in self.AllUnitsInGameScene {
                    print("UNIT GUID: \(unit.uuid.UUIDString)")
                    print("___________________________________________")
                }
                print("done.")
            }
        }
    }
    
    // 🔵
    func ThisUnitTookDamage(sprite: SKBlockMovementSpriteNode, fromUnit: AbstractUnit) {
        let teamNumberOfUnitTakingDamage = sprite.UnitReference.teamNumber
        let DMG = fromUnit.DMG
        let UpdateScenarioListener = sprite.UnitReference.unitWillTakeDamageReturnIfUnitDies(DMG, fromUnit: sprite.UnitReference)
        
        updateResourceBars()
        
        if UpdateScenarioListener == true {
            
            if fromUnit.sprite.name == playerSK.sprite.name {
//                self.spriteControlPanel?.heroStat?.addExperience(sprite.UnitReference)
                self.spriteControlPanel!.updateXP(sprite.UnitReference)
            }
            
            TotalPlayer2UnitsInGameScene -= 1;
            _ScenarioSceneListener._AllEnemyUnits -= 1;
        }
    }
    
    
    
    // 🔵
    // MELEE BULLET FIRERER
    // going to use this one:
    func scanMeleeAndGetUnit(unit: AbstractUnit, completionHandler: (AbstractUnit?) -> ()) -> () {
        let positionOfSearchingUnit = unit.sprite.position
        for pos in self.searchArea_s1 {
            
            var posFinal = pos
            posFinal.x = pos.x + positionOfSearchingUnit.x
            posFinal.y = pos.y + positionOfSearchingUnit.y
            
            let spritesAtPoint = self.nodesAtPoint(posFinal)
            
            // SIGHT DEBUG
            if self.DEBUG_AI_SIGHT == true {
                let nodeDebug = SKSpriteNode(imageNamed: "SearchRadiusDummyV")
                nodeDebug.xScale = 0.3
                nodeDebug.yScale = 0.3
                nodeDebug.zPosition = 1200
                nodeDebug.position = posFinal
                self.addChild(nodeDebug)
                nodeDebug.runAction(SKAction.fadeOutWithDuration(0.6))
            }

            
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
    
    
    // 🔵
    // RANGED BULLET FIRERER
    func scanRangedAndGetUnit(unit: AbstractUnit, completionHandler: (AbstractUnit?) -> ()) -> () {
        let positionOfSearchingUnit = unit.sprite.position
        for pos in self.searchArea_s5 {
            
            var posFinal = pos
            posFinal.x = pos.x + positionOfSearchingUnit.x
            posFinal.y = pos.y + positionOfSearchingUnit.y
            
            let spritesAtPoint = self.nodesAtPoint(posFinal)



            
            spritesInNodeLoop: for sprite in spritesAtPoint {

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
    

    // 🔵
    func scanRangeLongAndGetUnit(unit: AbstractUnit) -> AbstractUnit {
        var arrayOfTargetsSpotted = [AbstractUnit]()
        
        let positionOfSearchingUnit = unit.sprite.position
        for pos in self.searchArea_s4 {
            
            var posFinal = pos
            posFinal.x = pos.x + positionOfSearchingUnit.x
            posFinal.y = pos.y + positionOfSearchingUnit.y
            

            let spritesAtPoint = self.nodesAtPoint(posFinal)
            
            // SIGHT DEBUG
            if self.DEBUG_AI_SIGHT == true {
                let node = DummyNode().getDummyNodeToAppend(3, position: posFinal)
                node.position.x += 10
                self.addChild(node)
                node.runAction(SKAction.fadeOutWithDuration(2.6))
            }
            
            spritesInNodeLoop: for sprite in spritesAtPoint {
                
                if sprite is SKAbstractSprite {
                    
                    // SIGHT DEBUG
                    if self.DEBUG_AI_SIGHT == true {
                        let node2 = DummyNode().getDummyNodeToAppend(2, position: posFinal)
                        self.addChild(node2)
                        node2.runAction(SKAction.fadeOutWithDuration(2.6))
                    }

                    
                    if (sprite as! SKAbstractSprite).UnitReference!.teamNumber != unit.teamNumber &&
                        (sprite as! SKAbstractSprite).name != unit.sprite.name &&
                        (sprite as! SKAbstractSprite).UnitReference?.isDead != true {
                        
                        print123("[TRASH]: \((sprite as! SKAbstractSprite).name) \(unit.sprite.name) \((sprite as! SKAbstractSprite).UnitReference?.isDead)")
                        
                        // SIGHT DEBUG
                        if self.DEBUG_AI_SIGHT == true {
                            let node = DummyNode().getDummyNodeToAppend(6, position: posFinal)
                            node.position.x -= 15
                            node.xScale = 2.0; node.yScale = 2.0;
                            self.addChild(node)
                            node.runAction(SKAction.fadeOutWithDuration(2.6))
                        }

                        
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
            // SIGHT DEBUG
            if self.DEBUG_AI_SIGHT == true {
                let node = DummyNode().getDummyNodeToAppend(6, position: returnValue.positionLogical)
                node.position.x -= 10
                self.addChild(node)
                node.runAction(SKAction.fadeOutWithDuration(2.6))
            }

            return returnValue
        } else {
            return unit
        }
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
    
    
    
    /*
     func scanRangeLongAndGetUnit_Closure(unit: AbstractUnit, completionHandler: (AbstractUnit?) -> ()) -> () {
     
     //        var unitsReturned = [BaseUnit]()
     let positionOfSearchingUnit = unit.sprite.position
     for pos in self.searchArea_s4 {
     
     var posFinal = pos
     posFinal.x = pos.x + positionOfSearchingUnit.x
     posFinal.y = pos.y + positionOfSearchingUnit.y
     
     let spritesAtPoint = self.nodesAtPoint(posFinal)
     
     let node = DummyNode().getDummyNodeToAppend(4, position: posFinal)
     node.position.x += 10
     self.addChild(node)
     node.runAction(SKAction.fadeOutWithDuration(2.6))
     
     
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
     
     let node2 = DummyNode().getDummyNodeToAppend(3, position: posFinal)
     self.addChild(node2)
     node2.runAction(SKAction.fadeOutWithDuration(2.6))
     
     if (sprite as! SKAbstractSprite).UnitReference!.teamNumber != unit.teamNumber &&
     (sprite as! SKAbstractSprite).name != unit.sprite.name &&
     (sprite as! SKAbstractSprite).UnitReference?.isDead != true
     {
     print("[TRASH]: \((sprite as! SKAbstractSprite).name) \(unit.sprite.name) \((sprite as! SKAbstractSprite).UnitReference?.isDead)")
     completionHandler((sprite as! SKAbstractSprite).UnitReference)
     }
     }
     }
     }
     completionHandler(nil)
     //        completionHandler(unitsReturned)
     }
     
     */
    
    
    /*
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
                
//                let targetNode = SKSpriteNode(imageNamed: markerName)
//                
//                 {
//                    targetNode.xScale = GameSettings.SpriteScale.Default
//                    targetNode.yScale = GameSettings.SpriteScale.Default
//                    targetNode.zPosition = SpritePositionZ.AliveUnit.Z + 50
//                    
//                    targetNode.position = posFinal
//                    self.addChild(targetNode)
//                }
//                NSThread.sleepForTimeInterval(0.09);
//                dispatch_async(dispatch_get_main_queue()) {
//                    targetNode.removeFromParent()
//                }
            }
        }
    }
    */
    
    
}