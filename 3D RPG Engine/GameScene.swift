//
//  GameScene.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    
    var debugLabel = SKLabelNode(fontNamed:"HoeflierText")
    var debugLabelCamera = SKLabelNode(fontNamed:"HoeflierText")
    
    var ControlPanel: UserInputControlsPanel?
    
    var allTimers = [Timer]()
    
    // HEROES
    var playerSK: AbstractUnit!
    let playerSpriteID = "sprite_player"
    
    // NON-HEROES
    var enemies = [AbstractUnit]()
    //    var allEnemyIDs: [String:BaseUnit] = [:]
    
    var tilesets = [SKGroundTileGeneric]()
    
    
    var playerTarget: SKPlayerTarget?
    var playerTarget2: SKSpriteNode?
    
    var map = GameMap()
    
    var AllUnitsInGameScene = [UUID:AbstractUnit]()
    var AllUnitGUIDs = [UUID]()
    
    var AllUnitsInGameScenePositions = [String:CGPoint]()
    var PathsBlocked = [String:Bool]()
    
    var TotalPlayer2UnitsInGameScene = 0
    
    let _ScenarioSceneListener = ScenarioSceneListener(ScenarioKind_: ScenarioKind.deathmatch)
    
    var temporaryNodes = [SKSpriteNode]()
    
    var hackmapname = ""
    
    let DEBUG_AI_SIGHT = false
    
    
    let frozenOrbDamage = 15
    
    var swipeActivated: Int = 0 {
        didSet {
            if oldValue == 0 {
                DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.low).async {
                    Thread.sleep(forTimeInterval: 3.0)
                    DispatchQueue.main.async {
                        self.swipeActivated = 0
                    }
                }
            }
        }
    }
    
    
    
    var spriteControlPanel: UIPlayerControlPanel?
    
    
    override func didMove(to view: SKView) {
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
        func waitForCompletion(_ exitFunction: (Bool) -> ()) {
            self.anchorPoint.y += 50.0 / self.size.height
            self.spriteControlPanel?.moveByYNegative()
            exitFunction(true)
        }
        
        
        
        waitForCompletion({ _ in
            Thread.sleep(forTimeInterval: 0.1)
            waitForCompletion({ _ in
                Thread.sleep(forTimeInterval: 0.1)
                waitForCompletion({ _ in
                    
                })
            })
        })
        
    }
    func moveUIDown() {
        func waitForCompletion(_ exitFunction: (Bool) -> ()) {
            self.anchorPoint.y -= 50.0 / self.size.height
            self.spriteControlPanel?.moveByYPositive()
            exitFunction(true)
        }
        
        waitForCompletion({ _ in
            Thread.sleep(forTimeInterval: 0.1)
            waitForCompletion({ _ in
                Thread.sleep(forTimeInterval: 0.1)
                waitForCompletion({ _ in
                    
                })
            })
        })
        
    }
    func moveUILeft() {
        func waitForCompletion(_ exitFunction: (Bool) -> ()) {
            self.spriteControlPanel?.moveByXPositive()
            self.anchorPoint.x -= 50.0 / self.size.width
            exitFunction(true)
        }
        
        waitForCompletion({ _ in
            Thread.sleep(forTimeInterval: 0.1)
            waitForCompletion({ _ in
                Thread.sleep(forTimeInterval: 0.1)
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
        func waitForCompletion(_ exitFunction: (Bool) -> ()) {
            self.spriteControlPanel?.moveByXNegative()
            self.anchorPoint.x += 50.0 / self.size.width
            exitFunction(true)
        }
        
        waitForCompletion({ _ in
            Thread.sleep(forTimeInterval: 0.1)
            waitForCompletion({ _ in
                Thread.sleep(forTimeInterval: 0.1)
                waitForCompletion({ _ in
                    
                })
            })
        })
        var totalSlides = 5
        while totalSlides > -1 {
            totalSlides -= 1
            
        }
    }
    
    func swipedRight(_ sender:UISwipeGestureRecognizer) {
        swipeActivated += 1
        if self.swipeActivated > 6 {
            moveUIRight()
        }
    }
    func swipedLeft(_ sender:UISwipeGestureRecognizer) {
        swipeActivated += 1
        if self.swipeActivated > 6 {
            moveUILeft()
        }
        
    }
    func swipedUp(_ sender:UISwipeGestureRecognizer) {
        swipeActivated += 1
        if self.swipeActivated > 6 {
            moveUIUp()
        }
        
    }
    func swipedDown(_ sender:UISwipeGestureRecognizer) {
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
        
        var attackTimer = Timer.scheduledTimer(
            timeInterval: UnitData.AttackSpeedMelee(),
            target: self,
            selector: #selector(GameScene.attackUnitClosestToSenderMELEE),
            userInfo: "",
            repeats: true
        )
        allTimers.append(attackTimer)
        
        var AllUnitsAttackTargets = Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(GameScene.orderAllUnitsToAttackTheirTargets),
            userInfo: nil,
            repeats: true
        )
        allTimers.append(AllUnitsAttackTargets)
        
        var ScenarioListenerTimer = Timer.scheduledTimer(
            timeInterval: 6.55,
            target: self,
            selector: #selector(GameScene.TickScenarioSceneListener),
            userInfo: nil,
            repeats: true
        );
        allTimers.append(ScenarioListenerTimer)
        
        var rangedTimer = Timer.scheduledTimer(
            timeInterval: UnitData.AttackSpeedRanged(),
            target: self,
            selector: #selector(GameScene.attackUnitClosestToSenderRANGED),
            userInfo: "",
            repeats: true
        )
        allTimers.append(rangedTimer)
        
        spriteControlPanel = UIPlayerControlPanel(gameScene: self, playerUnit: self.playerSK)
        if let scp = spriteControlPanel {
            scp.joyStick.setGameSceneRef(self)
            scp.activateFromViewController()
            scp.updateLevelValues()
        }
    }
    
    
    func UnitWasSelectedByThePlayer(_ unit: AbstractUnit) {
        self.loadSelectedUnitIntoGUI(unit)
    }
    
    
    func loadSelectedUnitIntoGUI(_ unit: AbstractUnit) {
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
            AllUnitsInGameScene = [UUID:AbstractUnit]()
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
        playerTarget!.xScale = GameSettings.spriteScale.Default
        playerTarget!.yScale = GameSettings.spriteScale.Default
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        //        playerTarget?.removeFromParent()
        
        for touch in touches {
            let location = touch.location(in: self)
            let selectedNodes = self.nodes(at: location)
            
            playerTarget!.position = location
            
            playerAddedGrassPlainNode(at: location)
            
            //            (self.playerSK as! MeleeUnitNEW).issueOrderTargetingPoint(location, completionHandler: { finalDestination in
            //            })
            
            for node in selectedNodes {
                if node is SKAbstractSprite {
                } else if node is SKBlockMovementSpriteNode {
                    playerTarget2 = node as! SKBlockMovementSpriteNode
                    
                    self.spriteControlPanel?.labelArmor.text = "Armor: \((node as! SKBlockMovementSpriteNode).UnitReference.Armor)"
                    self.spriteControlPanel?.labelSpeed.text = "HP: \(((node as! SKBlockMovementSpriteNode).UnitReference as AbstractUnit).HP) "
                    self.spriteControlPanel?.labelDamage.text = "Damage: \(((node as! SKBlockMovementSpriteNode).UnitReference as AbstractUnit).DMG) "
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
                                        self.AllUnitsInGameScenePositions[subUnit.uuid.uuidString] = finalDestination
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
    
    func attackUnitClosestToSenderMELEE(_ sender: Timer) {
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
    
    
    func updateResourceBars() {
        let health = CGFloat(playerSK.HP) / CGFloat(playerSK.HP_MAX)
        self.spriteControlPanel?.updateResourceBar(health, resourceType: .hp)
        
        let mana = CGFloat(playerSK.MANA) / CGFloat(playerSK.MANA_MAX)
        self.spriteControlPanel?.updateResourceBar(mana, resourceType: .mana)
        
        let experience = CGFloat((spriteControlPanel?.heroStat!.XP)!) / CGFloat((spriteControlPanel?.heroStat?.XP_MAX)!)
        self.spriteControlPanel?.updateResourceBar(experience, resourceType: .exp)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
    
    
    func updateDebugLabel(_ text: String) {
        debugLabel.text = text
        debugLabel.zPosition = 100
        debugLabel.fontSize = 19
        debugLabel.position = CGPoint(x:280, y:600)
    }
    
    
    func heroDied() {
        if playerSK.HP <= 0 && self.playerSK.isDead == true {
            for timer in allTimers {
                timer.invalidate()
            }
            for unitUUID in AllUnitGUIDs {
                if self.AllUnitsInGameScene[unitUUID]! is AbstractUnit {
                    self.AllUnitsInGameScene[unitUUID]!.isDead = true
                    self.AllUnitsInGameScene[unitUUID]!.sprite.removeFromParent()
                }
            }
            let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(0.1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
                let notificationName = "NSNExitGameControllerDefeat"
                let notification = Notification(name: Notification.Name(rawValue: notificationName), object: self, userInfo: ["toastInfo":"doge!"])
                NotificationCenter.default.post(notification)
            })
        }
    }
    
    
    
    var plainGrassNodes = [SKSpriteNode]()
    var plainDirtNodes = [SKSpriteNode]()
    
    var plainGrassNodesLayer2 = [SKSpriteNode]()
    var plainDirtNodesLayer2 = [SKSpriteNode]()
    
    var autoCompleteGrassNodes = [SKSpriteNode]()
    var autoCompletedGrassCornerNodes = [SKNode]()
    
    var transitionalMapSectionsLeft = 10
    
    func resetMapEditor() {
        for node in plainGrassNodes {
            node.removeFromParent()
        }
        for node in autoCompleteGrassNodes {
            node.removeFromParent()
        }
        
        plainGrassNodes = [SKSpriteNode]()
        autoCompleteGrassNodes = [SKSpriteNode]()
    }
    var DIRT_BRUSH_ENABLED = false
    // 🔵
    
    
    func generateRandomUnits(owner: Int) -> [UUID:AbstractUnit] {
        var returnValue : [UUID:AbstractUnit] = [:]
        let spawnLocation = CGPoint(x:600,y:150)
        let uuid = UUID.init()
        returnValue[uuid] = GruntLvl3Unit(player: owner, spawnLocation: spawnLocation)
        return returnValue
    }
    
    func generateUnitsAndTilesFromMap(_ mapName: String) {
        hackmapname = mapName
        
        self.generateTerrainRandom()
//        self.autoCompletePlainGrassNodes()
        
        
        
        self.AllUnitsInGameScene = self.map.generateGameSceneBasedFromMap(mapName)
        self.AllUnitGUIDs = self.map.allUnitGuids
        
        
        
        var unitI = 0
        print(AllUnitsInGameScene.count)
        for unitUUID in AllUnitGUIDs {
            if self.AllUnitsInGameScene[unitUUID]! is AbstractUnit {
                
                let mirror = Mirror(reflecting: unitUUID)
                let classname = String(describing: mirror.subjectType)
                //                self.AllUnitsInGameScene[unitUUID]
                self.AllUnitsInGameScene[unitUUID]!.sprite.UnitReference = self.AllUnitsInGameScene[unitUUID]
                self.AllUnitsInGameScene[unitUUID]!.sprite.name = classname + "|" + "Plyr:" + String(self.AllUnitsInGameScene[unitUUID]!.teamNumber) + "|" + String(unitI)
                self.AllUnitsInGameScene[unitUUID]!.ReferenceOfGameScene = self
                self.addChild(self.AllUnitsInGameScene[unitUUID]!.sprite)
                self.addChild(self.AllUnitsInGameScene[unitUUID]!.spriteMovementBlocker)
                self.addChild(self.AllUnitsInGameScene[unitUUID]!.spriteSight)
                self.addChild(self.AllUnitsInGameScene[unitUUID]!.meleeSight)
                
                PathsBlocked[String(describing: self.AllUnitsInGameScene[unitUUID]!.sprite.position)] = true
                
                
                if self.AllUnitsInGameScene[unitUUID]!.teamNumber == 2 {
                    TotalPlayer2UnitsInGameScene += 1
                    _ScenarioSceneListener._AllEnemyUnits += 1
                }
                
                
                if (self.AllUnitsInGameScene[unitUUID]! ).isPlayer == true {
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
            if tile.name == "block doodad" {
                var upper = tile.position
                upper.y += 50
                var lower = tile.position
                lower.y -= 50
                
                self.PathsBlocked[String(describing: tile.position)] = true
                self.PathsBlocked[String(describing: lower)] = true
                self.PathsBlocked[String(describing: upper)] = true
            }
            self.addChild(tile)
        }
        
        //        generateTerrainRandom()
        
        
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
    func ThisUnitTookDamage(_ sprite: SKBlockMovementSpriteNode, fromUnit: AbstractUnit) {
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
    
    
    func addChildTemporary(_ node: SKSpriteNode) {
        temporaryNodes.append(node)
        self.addChild(node)
        node.run(SKAction.fadeOut(withDuration: 2.0))
    }
    
    
    func addChildTemporaryExpand(_ node: SKSpriteNode) {
        temporaryNodes.append(node)
        self.addChild(node)
        var oldSizeX = node.xScale
        var oldSizeY = node.yScale
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.low).async {
            Thread.sleep(forTimeInterval: 0.02);
            DispatchQueue.main.async {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
            }
            Thread.sleep(forTimeInterval: 0.02);
            DispatchQueue.main.async {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
            }
            Thread.sleep(forTimeInterval: 0.02);
            DispatchQueue.main.async {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
            }
            Thread.sleep(forTimeInterval: 0.02);
            DispatchQueue.main.async {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
                node.run(SKAction.fadeOut(withDuration: 2.0))
            }
        }
    }
    
    
    func clearStaleSKNodes(_ node: SKSpriteNode) {
        //        for node in temporaryNodes {
        //            node.removeFromParent()
        //        }
    }

}

public func logg(_ line: Any) {
    //print(line)
}

public func print123(_ line: Any) {
//    print("[GENERAL]: ", terminator:"")
//    print(line)
}

public func printsp(_ line: Any) {
//    print("[SPEARTHROWER]: ", terminator:"")
//    print(line)
}

public func printgs(_ line: Any) {
//    print("[GAMESCENE]: ", terminator:"")
//    print(line)
}

public func printn(_ line: Any) {
//        print("[NEW]: ", terminator:"")
//        print(line)
}

public func printRAM(_ line: Any) {
//    print("[RAM]: ", terminator:"")
//    print(line)
}

public func printPlayer(_ line: Any) {
//    print("[PLAYER UNIT]: ", terminator:"")
//    print(line)
}

public func printUnitLog(_ line: Any) {
//    print("[UNIT LOG]: \(line)")
}
