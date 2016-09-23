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
//        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedRight:"))
//        swipeRight.direction = .Right
//        view.addGestureRecognizer(swipeRight)
//        
//        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedLeft:"))
//        swipeLeft.direction = .Left
//        view.addGestureRecognizer(swipeLeft)
//        
//        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedUp:"))
//        swipeUp.direction = .Up
//        view.addGestureRecognizer(swipeUp)
//        
//        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedDown:"))
//        swipeDown.direction = .Down
//        view.addGestureRecognizer(swipeDown)
    }
    
    func moveUIUp() {
        func waitForCompletion(exitFunction: (Bool) -> ()) {
            self.anchorPoint.y += 50.0 / self.size.height
            self.spriteControlPanel?.moveByYNegative()
            exitFunction(true)
        }
        

        
        waitForCompletion({ _ in
            NSThread.sleepForTimeInterval(0.1)
            waitForCompletion({ _ in
                NSThread.sleepForTimeInterval(0.1)
                waitForCompletion({ _ in
                    
                })
            })
        })

    }
    func moveUIDown() {
        func waitForCompletion(exitFunction: (Bool) -> ()) {
            self.anchorPoint.y -= 50.0 / self.size.height
            self.spriteControlPanel?.moveByYPositive()
            exitFunction(true)
        }
        
        waitForCompletion({ _ in
            NSThread.sleepForTimeInterval(0.1)
            waitForCompletion({ _ in
                NSThread.sleepForTimeInterval(0.1)
                waitForCompletion({ _ in
                    
                })
            })
        })

    }
    func moveUILeft() {
        func waitForCompletion(exitFunction: (Bool) -> ()) {
            self.spriteControlPanel?.moveByXPositive()
            self.anchorPoint.x -= 50.0 / self.size.width
            exitFunction(true)
        }
        
        waitForCompletion({ _ in
            NSThread.sleepForTimeInterval(0.1)
            waitForCompletion({ _ in
                NSThread.sleepForTimeInterval(0.1)
                waitForCompletion({ _ in
                    
                })
            })
        })
        
        var totalSlides = 5
        while totalSlides > -1 {
            totalSlides -= 1

        }

    }
    func moveUIRight() {
        func waitForCompletion(exitFunction: (Bool) -> ()) {
                    self.spriteControlPanel?.moveByXNegative()
                    self.anchorPoint.x += 50.0 / self.size.width
                    exitFunction(true)
        }
        
        waitForCompletion({ _ in
            NSThread.sleepForTimeInterval(0.1)
            waitForCompletion({ _ in
                NSThread.sleepForTimeInterval(0.1)
                waitForCompletion({ _ in
                    
                })
            })
        })
        var totalSlides = 5
        while totalSlides > -1 {
            totalSlides -= 1

        }
    }
    
    func swipedRight(sender:UISwipeGestureRecognizer) {
        swipeActivated += 1
        if self.swipeActivated > 6 {
            moveUIRight()
        }
    }
    func swipedLeft(sender:UISwipeGestureRecognizer) {
        swipeActivated += 1
        if self.swipeActivated > 6 {
            moveUILeft()
        }
        
    }
    func swipedUp(sender:UISwipeGestureRecognizer) {
        swipeActivated += 1
        if self.swipeActivated > 6 {
            moveUIUp()
        }
        
    }
    func swipedDown(sender:UISwipeGestureRecognizer) {
        swipeActivated += 1
        if self.swipeActivated > 6 {
            moveUIDown()
        }
        
    }
    // ----------------------------------------------------------------------------------------------------------------------------------
    
    
    
    
    
    func mapDataWasLoadedIntoRAM() {
        
//        var PlayerMovement = NSTimer.scheduledTimerWithTimeInterval(
//            0.55,
//            target: self,
//            selector: Selector("orderPlayerToMove"),
//            userInfo: nil,
//            repeats: true
//        )
//        allTimers.append(PlayerMovement)
        
        var attackTimer = NSTimer.scheduledTimerWithTimeInterval(
            UnitData.AttackSpeedMelee(),
            target: self,
            selector: #selector(GameScene.attackUnitClosestToSenderMELEE),
            userInfo: "",
            repeats: true
        )
        allTimers.append(attackTimer)
        
        var AllUnitsAttackTargets = NSTimer.scheduledTimerWithTimeInterval(
            0.2,
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
        
        var rangedTimer = NSTimer.scheduledTimerWithTimeInterval(
            UnitData.AttackSpeedRanged(),
            target: self,
            selector: #selector(GameScene.attackUnitClosestToSenderRANGED),
            userInfo: "",
            repeats: true
        )
        allTimers.append(rangedTimer)
        
        spriteControlPanel = UIPlayerControlPanel(gameScene: self, playerUnit: self.playerSK)
        spriteControlPanel?.joyStick.setGameSceneRef(self)
        spriteControlPanel?.activateFromViewController()
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
            AllUnitsInGameScene = [NSUUID:AbstractUnit]()
            self.removeAllActions()
            self.removeAllChildren()
        }
        
    }
    
    func orderPlayerToMove() {
//        (self.playerSK as! HeroFootmanUnit).issueOrderTargetingPoint(playerTarget!.position)
    }
    
    
    func updateDebugLabel() {
//        debugLabel.position = playerSK.sprite.position
//        debugLabel.text = String(playerSK.sprite.position)
//        debugLabel.zPosition = 100
//        debugLabel.fontSize = 19
    }
    
    
    func initPlayerTarget() {
        playerTarget = SKPlayerTarget(imageNamed: "player-test")
        playerTarget!.xScale = GameSettings.SpriteScale.Default
        playerTarget!.yScale = GameSettings.SpriteScale.Default
        playerTarget!.zPosition = 3000
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
//        playerTarget?.removeFromParent()

        for touch in touches {
            let location = touch.locationInNode(self)
            let selectedNodes = self.nodesAtPoint(location)
            
            playerTarget!.position = location
//            (self.playerSK as! MeleeUnitNEW).issueOrderTargetingPoint(location, completionHandler: { finalDestination in
//            })
            
            for node in selectedNodes {
                if node is SKAbstractSprite {
                } else if node is SKBlockMovementSpriteNode {
                    playerTarget2 = node as! SKBlockMovementSpriteNode
                    
                    self.spriteControlPanel?.labelArmor.text = "Armor: \((node as! SKBlockMovementSpriteNode).UnitReference.Armor)"
                    self.spriteControlPanel?.labelSpeed.text = "HP: \(((node as! SKBlockMovementSpriteNode).UnitReference as! AbstractUnit).HP) "
                    self.spriteControlPanel?.labelDamage.text = "Damage: \(((node as! SKBlockMovementSpriteNode).UnitReference as! AbstractUnit).DMG) "
                    self.spriteControlPanel?.labelUnitName.text = (node as! SKBlockMovementSpriteNode).UnitReference.nameGUI
                }
            }
            
        }
    }
 
    
    // 🔵
    func orderAllUnitsToAttackTheirTargets() {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            for unitUUID in AllUnitGUIDs {
                if self.AllUnitsInGameScene[unitUUID]! is PathfinderUnit {
                    if (self.AllUnitsInGameScene[unitUUID]! as! PathfinderUnit).isMoving == false {
                        if let target = self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit {
                            if target.isDead == false {
//                                NSThread.sleepForTimeInterval(0.01)
//                                dispatch_async(dispatch_get_main_queue()) {
                                    if let subUnit = self.AllUnitsInGameScene[unitUUID]! as? PathfinderUnit {
                                        let positionOfTargetUsingRAM = target.positionLogical//self.AllUnitsInGameScenePositions[target.uuid.UUIDString]
                                        if subUnit.isDead == false {
//                                            if let potur = positionOfTargetUsingRAM {
                                                subUnit.issueOrderTargetingPoint(positionOfTargetUsingRAM, completionHandler: { finalDestination in
                                                    self.AllUnitsInGameScenePositions[subUnit.uuid.UUIDString] = finalDestination
                                                })
//                                            }
                                        }
                                    }
//                                }
                            }
                        }
                    }
                }
            }
//        }
    }
    
    func attackUnitClosestToSenderMELEE(sender: NSTimer) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            for unitUUID in AllUnitGUIDs {
                if self.AllUnitsInGameScene[unitUUID]!.isPlayer != true && self.AllUnitsInGameScene[unitUUID]! is MeleeUnitNEW {
                    
                    if (self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit?.isDead == false || self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit != nil) &&
                        (self.AllUnitsInGameScene[unitUUID]! as! MeleeUnitNEW).CoolingDown == false && (self.AllUnitsInGameScene[unitUUID]! as! MeleeUnitNEW).isMoving == false
                    {
                        (self.AllUnitsInGameScene[unitUUID]! as? MeleeUnitNEW)!.fireAttackMelee(self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit!)
                    }
                }
            }
//        }
    }
    // 🔵
    func attackUnitClosestToSenderRANGED(sender: NSTimer) {
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

        self.AllUnitsInGameScene = self.map.generateGameSceneBasedFromMap(mapName)
        self.AllUnitGUIDs = self.map.allUnitGuids
        self.map.generateGameTilesetForMap(mapName)

        
        var unitI = 0
        print(AllUnitsInGameScene.count)
        for unitUUID in AllUnitGUIDs {
            if self.AllUnitsInGameScene[unitUUID]! is AbstractUnit {
                
                let mirror = Mirror(reflecting: unitUUID)
                let classname = String(mirror.subjectType)
//                self.AllUnitsInGameScene[unitUUID]
                self.AllUnitsInGameScene[unitUUID]!.sprite.UnitReference = self.AllUnitsInGameScene[unitUUID]
                self.AllUnitsInGameScene[unitUUID]!.sprite.name = classname + "|" + "Plyr:" + String(self.AllUnitsInGameScene[unitUUID]!.teamNumber) + "|" + String(unitI)
                self.AllUnitsInGameScene[unitUUID]!.ReferenceOfGameScene = self
                self.addChild(self.AllUnitsInGameScene[unitUUID]!.sprite)
                self.addChild(self.AllUnitsInGameScene[unitUUID]!.spriteMovementBlocker)
                self.addChild(self.AllUnitsInGameScene[unitUUID]!.spriteSight)
                self.addChild(self.AllUnitsInGameScene[unitUUID]!.meleeSight)

                PathsBlocked[String(self.AllUnitsInGameScene[unitUUID]!.sprite.position)] = true

                
                if self.AllUnitsInGameScene[unitUUID]!.teamNumber == 2 {
                    TotalPlayer2UnitsInGameScene += 1
                    _ScenarioSceneListener._AllEnemyUnits += 1
                }
                
                
                if (self.AllUnitsInGameScene[unitUUID]! as! AbstractUnit).isPlayer == true {
                    playerSK = nil
                    playerSK = self.AllUnitsInGameScene[unitUUID]
                }
                else {
//                    NSThread.sleepForTimeInterval(0.18);
                    
//                    if case let unit_ as MeleeUnitNEW = unit {
//                        unit_.sightTimer = NSTimer.scheduledTimerWithTimeInterval(
//                            UnitData.ScanForEnemySpeed(),
//                            target: self,
//                            selector: #selector(GameScene.debugFindUnitToMoveTowards),
//                            userInfo: String(unit.sprite.name!), repeats: true
//                        )
//                        unit_.attackTimer = NSTimer.scheduledTimerWithTimeInterval(
//                            UnitData.AttackSpeedMelee(),
//                            target: self,
//                            selector: #selector(GameScene.attackUnitClosestToSenderMELEE),
//                            userInfo: String(unit.sprite.name!),
//                            repeats: true
//                        )
//                    } else if case let unit_ as RangedUnitNEW = unit {
//                        unit_.sightTimer = NSTimer.scheduledTimerWithTimeInterval(
//                            UnitData.ScanForEnemySpeed(),
//                            target: self,
//                            selector: #selector(GameScene.debugFindUnitToMoveTowards),
//                            userInfo: String(unit.sprite.name!),
//                            repeats: true
//                        )
//                        unit_.attackTimer = NSTimer.scheduledTimerWithTimeInterval(
//                            UnitData.AttackSpeedRanged(),
//                            target: self,
//                            selector: #selector(GameScene.attackUnitClosestToSenderRANGED),
//                            userInfo: String(unit.sprite.name!),
//                            repeats: true
//                        )
//                    }

                }
                unitI += 1
            } else if self.AllUnitsInGameScene[unitUUID]! is BaseStructure {
                self.addChild(self.AllUnitsInGameScene[unitUUID]!.sprite)
            }
        }
        
        for tile in map.TilesInMap {
            print(tile)
            self.addChild(tile)
        }
        
       
        self.addChild(debugLabel)
        
        mapDataWasLoadedIntoRAM()
        printDebugInfoAfterInitilization()
        initPlayerTarget()
    }
    
    // 🔵
    func printDebugInfoAfterInitilization() {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
//            NSThread.sleepForTimeInterval(3.0)
//            dispatch_async(dispatch_get_main_queue()) {
//                print("DEBUG INFO: ")
//                print("ALL UNITS IN GAME SCENE: \(self.AllUnitsInGameScene)")
//                for unit in self.AllUnitsInGameScene {
//                    print("UNIT GUID: \(self.AllUnitsInGameScene[unitUUID]!.uuid.UUIDString)")
//                    print("___________________________________________")
//                }
//                print("done.")
//            }
//        }
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
    
    
    func addChildTemporary(node: SKSpriteNode) {
        temporaryNodes.append(node)
        self.addChild(node)
        node.runAction(SKAction.fadeOutWithDuration(2.0))
    }
    
    
    func addChildTemporaryExpand(node: SKSpriteNode) {
        temporaryNodes.append(node)
        self.addChild(node)
        var oldSizeX = node.xScale
        var oldSizeY = node.yScale
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            NSThread.sleepForTimeInterval(0.02);
            dispatch_async(dispatch_get_main_queue()) {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
            }
            NSThread.sleepForTimeInterval(0.02);
            dispatch_async(dispatch_get_main_queue()) {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
            }
            NSThread.sleepForTimeInterval(0.02);
            dispatch_async(dispatch_get_main_queue()) {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
            }
            NSThread.sleepForTimeInterval(0.02);
            dispatch_async(dispatch_get_main_queue()) {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
                node.runAction(SKAction.fadeOutWithDuration(2.0))
            }
        }
    }
    
    
    func clearStaleSKNodes(node: SKSpriteNode) {
//        for node in temporaryNodes {
//            node.removeFromParent()
//        }
    }
}




/*
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
 */