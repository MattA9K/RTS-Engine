//
//  GameScene.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit
import Starscream
import SwiftyJSON

class GameScene: SKScene, WebSocketDelegate {

    
    var debugLabel = SKLabelNode(fontNamed:"HoeflierText")
    var debugLabelCamera = SKLabelNode(fontNamed:"HoeflierText")
    
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
    var viewControllerRef: UIViewController?
    var playerIsHost = false
    var latestDataFromWebSocket: String! = ""
    var gameHostEventIncrement = 0;
    var totalSocketMessages = 0
    var currentPlayerNumber = 1
    
    var hostSetOfAiUnits : [UUID:AbstractUnit] = [:]
    var computerPlayers = Set<Int>()
    var aiUnitBCCounterk = 0
    
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
    
    
    var virtualAnchorPoint : CGPoint = CGPoint(x: 0, y: 0)
    var spriteControlPanel: UIPlayerControlPanel?




    var nodesForMultiplayerHost = [TileSpriteNode]()
    var nodesCollectedGuest = [SKSpriteNode]()

    var plainGrassNodes = [TileSpriteNode]()
    var plainDirtNodes = [TileSpriteNode]()
    var plainGrassNodesLayer2 = [TileSpriteNode]()
    var plainDirtNodesLayer2 = [TileSpriteNode]()
    var autoCompleteGrassNodes = [TileSpriteNode]()
    
    
    var autoCompletedGrassCornerNodes = [SKNode]()
    var transitionalMapSectionsLeft = 10

    var unitsForMultiplayer : [UUID:AbstractUnit] = [:]


    var playerStartLocation = CGPoint(x:0, y:0)

    
    var dominantTileName = ""
    var subTileName = ""
    
    

    override func didMove(to view: SKView) {
        /* Setup your scene here */
//        initializeSwipeToPanCameraEventHandler()
        initHeroLabel()
        
    }
    
    // ----------------------------------------------------------------------------------------------------------------------------------

    
    func UnitWasSelectedByThePlayer(_ unit: AbstractUnit) {
        self.loadSelectedUnitIntoGUI(unit)
    }
    
    
    func loadSelectedUnitIntoGUI(_ unit: AbstractUnit) {
        self.spriteControlPanel?.labelUnitName.text = unit.nameGUI
    }
    
    
    func orderPlayerToMove() {
        (self.playerSK as! HeroFootmanUnit).issueOrderTargetingPoint(playerTarget!.position, completionHandler: { finalDestination in
        })
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
        playerTarget!.zPosition = 15
        playerTarget!.position = playerSK.sprite.position
        playerStartLocation = playerSK.sprite.position
        addChild(playerTarget!)
        self.playerSK.sprite.name = "OFFLINE"
    }
    
    
    func resetPlayerTarget() {
        if let target = playerTarget {
            target.position = playerSK.sprite.position
        }
    }
    
    var playerNumberInput = ""
    var multiplayerGameSocketId = "foobar" {
        didSet {
            socket = WebSocket(url: URL(string: "ws://10.1.10.25:7002/ws/\(multiplayerGameSocketId)?subscribe-broadcast&publish-broadcast&echo")!)
        }
    }
    
    var socket = WebSocket(url: URL(string: "ws://10.1.10.25:7002/ws/foobar?subscribe-broadcast&publish-broadcast&echo")!)
    func connectGameSceneToWebSocket() {
        if socket.isConnected != true {
            
            socket.connect()
            print("WEBSOCKET CONNECTION HAS BEEN ESTABLISHED!")
        } else {
            print("THIS GAME SCENE IS ALREADY CONNECTED TO THE SOCKET!")
        }
    }
    
    func sendTestDebugPingToSocket() {
        if socket.isConnected == true {
            let strD = "Going to convert this to data."
            socket.write(string: strD)
            print("WEBSOCKET DID WRITE DATA!!!")
        } else {
            print("ERROR - SOCKET OFFLINE")
        }
    }
    
    
    
    //
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        //        playerTarget?.removeFromParent()
        
        for touch in touches {
            let location = touch.location(in: self)
            let selectedNodes = self.nodes(at: location)
            
            if let target = playerTarget {
                target.position = location
                target.position.x = PathFinder().roundToFifties(target.position.x)
                target.position.y = PathFinder().roundToFifties(target.position.y)
            }
            
            if socket.isConnected == true {
//                (self.playerSK as! MeleeUnitNEW).issueOrderTargetingPoint(location, completionHandler: { finalDestination in
//                })

//                self.broadcastPlayerHeroMovementToGameScene(<#T##direction: UnitFaceAngle##_D_RPG_Engine.UnitFaceAngle#>)
            }
            
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
    
    
    
    
    func updateResourceBars() {
        let health = CGFloat(playerSK.HP) / CGFloat(playerSK.HP_MAX)
        self.spriteControlPanel?.updateResourceBar(health, resourceType: .hp)
        
        let mana = CGFloat(playerSK.MANA) / CGFloat(playerSK.MANA_MAX)
        self.spriteControlPanel?.updateResourceBar(mana, resourceType: .mana)
        
        let experience = CGFloat((spriteControlPanel?.heroStat!.XP)!) / CGFloat((spriteControlPanel?.heroStat?.XP_MAX)!)
        self.spriteControlPanel?.updateResourceBar(experience, resourceType: .exp)
    }
    
    var guiPlacementDifference = CGPoint(x:0,y:0)
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        
        if playerSK != nil {
            let pos = playerSK.sprite.position
            
            heroLabel.position = CGPoint(x: pos.x, y: pos.y + 150)

            let sX : CGFloat = self.playerStartLocation.x
            let sY : CGFloat = self.playerStartLocation.y
            let cX : CGFloat = playerSK.sprite.position.x * -1
            let cY : CGFloat = playerSK.sprite.position.y * -1

            heroLabel.text = "Start: \(self.playerStartLocation) | \(CGPoint(x:((sX+cX) * -1),y:((sY+cY) * -1)))"
            heroLabel.fontColor = .black
            
            heroLabelSubtitle.position = CGPoint(x: pos.x, y: pos.y + 100)
//            heroLabelSubtitle.text = "Current: \(playerSK.sprite.position.x * -1) \(playerSK.sprite.position.y * -1)"
            heroLabelSubtitle.text = "Current: \(playerSK.sprite.position.x * -1) \(playerSK.sprite.position.y * -1)"
            heroLabelSubtitle.fontColor = .red

            self.guiPlacementDifference = CGPoint(x:((sX+cX)),y:((sY+cY)))

            anchorPoint.x = ((playerSK.sprite.position.x * -1) / size.width) + 0.50
            anchorPoint.y = ((playerSK.sprite.position.y * -1) / size.height) + 0.50

            if (playerSK as! PathfinderUnit).isMoving == true {
                print("")
                print("playerSK.sprite.position.x \(playerSK.sprite.position.x)")
                print("playerSK.sprite.position.y \(playerSK.sprite.position.y) \n\n")
                print("")
                print("")

                spriteControlPanel!.moveToFollowPlayerHero(guiPlacementDifference)
            }
        }
    }
    
    var heroLabel = SKLabelNode(text: "Hero label ready")
    var heroLabelSubtitle = SKLabelNode(text: "Hero label ready")
    
    var currentGridSizeX: CGFloat = 0
    var currentGridSizeY: CGFloat = 0
    
    func initHeroLabel() {
        self.addChild(heroLabel)
        self.addChild(heroLabelSubtitle)
    }
    
    func updateDebugLabel(_ text: String) {
        debugLabel.text = text
        debugLabel.zPosition = 100
        debugLabel.fontSize = 19
        debugLabel.position = CGPoint(x:280, y:600)

    }
    
    
    func heroDidCastSpell1() {
//        executeCohortFormationSequence()
//        connectGameSceneToWebSocket()
//        showActionDebugAlert()
        generateUnitDebug()
    }
    func heroDidCastSpell2() {
//        fireFrozenOrbPlayerHelper()
        debugNewMultiplayer()
        
    }
    func heroDidCastSpell3() {
//        fireMissileBombPlayerHelper()

    }
    func heroDidCastSpell4() {
//        playerCastBlizzardHelper()
    }
    
    func willPresentStartupSettingsAlertController() {
        let alertController = UIAlertController(
            title: "Generate New Map",
            message: "...",
            preferredStyle: UIAlertControllerStyle.alert
        )

        let DestructiveAction = UIAlertAction(title: "Host Game Without Terrain", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            self.isReadyToLoadAfterGeneratingRandomMap()
        }
        
        let DestructiveAction2 = UIAlertAction(title: "Generate Terrain Random", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            print("Destructive")
            self.generateTerrainRandom()
            self.isReadyToLoadAfterGeneratingRandomMap()
        }
        
        let GuestAction = UIAlertAction(title: "Play As Guest", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            print("Destructive")
            self.generateUnitsAndTilesFromMap("")
        }
        
        alertController.addAction(DestructiveAction)
        alertController.addAction(DestructiveAction2)
        alertController.addAction(GuestAction)
        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    
    func isReadyToLoadAfterGeneratingRandomMap() {
        
        let alertController = UIAlertController(
            title: "Map Generation Finished",
            message: "...",
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        let moveActio = UIAlertAction(title: "Move Anchor Point", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            
            self.anchorPoint.y -= 0.2
            self.anchorPoint.x -= 0.2
        }
        
        let doNothing = UIAlertAction(title: "Finished", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
        }
        
        let GuestAction = UIAlertAction(title: "Easy", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            
//            self.broadcastTileMapToClients()
            
            
            
            DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.generateUnitsAndTilesFromMap("")
                }
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.socket.connect()
                }
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.socket.write(string: "Creating new LAN game, single player with AI.", completion: {
                        Thread.sleep(forTimeInterval: 1.0)
                        DispatchQueue.main.async {
                            self.socket.write(string: "Creating new LAN game, single player with AI.")
                            self.socket.delegate = self
                        }
                        Thread.sleep(forTimeInterval: 1.0)
                        DispatchQueue.main.async {
                            self.generateManyRandomUnits(.easy)
                            self.activateTimers()
                        }
                        Thread.sleep(forTimeInterval: 1.0)
                        DispatchQueue.main.async {
                            self.broadcastAIUnitsToGameScene()
                        }
                    })
                }

            }
        }
        
        let GuestAction2 = UIAlertAction(title: "Medium", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            
            //            self.broadcastTileMapToClients()
            
            
            
            DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.generateUnitsAndTilesFromMap("")
                }
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.socket.connect()
                }
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.socket.write(string: "Creating new LAN game, single player with AI.", completion: {
                        Thread.sleep(forTimeInterval: 1.0)
                        DispatchQueue.main.async {
                            self.socket.write(string: "Creating new LAN game, single player with AI.")
                            self.socket.delegate = self
                        }
                        Thread.sleep(forTimeInterval: 1.0)
                        DispatchQueue.main.async {
                            self.generateManyRandomUnits(.medium)
                            self.activateTimers()
                        }
                        Thread.sleep(forTimeInterval: 1.0)
                        DispatchQueue.main.async {
                            self.broadcastAIUnitsToGameScene()
                        }
                    })
                }
                
            }
        }
        
        let GuestAction3 = UIAlertAction(title: "Hard", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            
            //            self.broadcastTileMapToClients()
            
            
            
            DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.generateUnitsAndTilesFromMap("")
                }
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.socket.connect()
                }
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.socket.write(string: "Creating new LAN game, single player with AI.", completion: {
                        Thread.sleep(forTimeInterval: 1.0)
                        DispatchQueue.main.async {
                            self.socket.write(string: "Creating new LAN game, single player with AI.")
                            self.socket.delegate = self
                        }
                        Thread.sleep(forTimeInterval: 1.0)
                        DispatchQueue.main.async {
                            self.generateManyRandomUnits(.hard)
                            self.activateTimers()
                        }
                        Thread.sleep(forTimeInterval: 1.0)
                        DispatchQueue.main.async {
                            self.broadcastAIUnitsToGameScene()
                        }
                    })
                }
                
            }
        }
        

        
//        alertController.addAction(BroadcastAction)
        alertController.addAction(GuestAction)
        alertController.addAction(GuestAction2)
        alertController.addAction(GuestAction3)
        alertController.addAction(moveActio)
        alertController.addAction(doNothing)
        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
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
                let notification = Notification(
                    name: Notification.Name(rawValue: notificationName),
                    object: self,
                    userInfo: ["toastInfo":"doge!"])
                NotificationCenter.default.post(notification)
            })
        }
    }
    

    
    func resetMapEditor() {
        for node in plainGrassNodes {
            node.removeFromParent()
        }
        for node in autoCompleteGrassNodes {
            node.removeFromParent()
        }
        
        plainGrassNodes = [TileSpriteNode]()
        autoCompleteGrassNodes = [TileSpriteNode]()
    }
    var DIRT_BRUSH_ENABLED = false
    // 🔵
    
    

    var debugAllUnitGUIDs : [UUID] = []
    func generateUnitsAndTilesFromMap(_ mapName: String) {
        hackmapname = mapName
//        generateTerrainRandom()
//        self.AllUnitsInGameScene = self.map.generateGameSceneBasedFromMap(mapName)
//        self.AllUnitGUIDs = self.map.allUnitGuids
        
        
        var newUnits = [UUID:AbstractUnit]()
//        var newUnits = self.getUnitsTest(owner: 2)
        let playerNew = self.getPlayerUnit()
        self.unitsForMultiplayer = newUnits
        newUnits[playerNew.uuid] = playerNew
        
        self.AllUnitsInGameScene = newUnits
        for guid in newUnits {
            self.AllUnitGUIDs.append(guid.key)
        }
        
        
        var unitI = 0
        print(AllUnitsInGameScene.count)
        for unitUUID in AllUnitGUIDs {
            if self.AllUnitsInGameScene[unitUUID]! is AbstractUnit {
                
                let classname = String(describing: Mirror(reflecting: self.AllUnitsInGameScene[unitUUID]!).subjectType)
                //                self.AllUnitsInGameScene[unitUUID]
                self.AllUnitsInGameScene[unitUUID]!.spriteSight.UnitReference = self.AllUnitsInGameScene[unitUUID]
                self.AllUnitsInGameScene[unitUUID]!.sprite.UnitReference = self.AllUnitsInGameScene[unitUUID]
                //
                self.AllUnitsInGameScene[unitUUID]!.meleeSight.UnitReference = self.AllUnitsInGameScene[unitUUID]
                self.AllUnitsInGameScene[unitUUID]!.sprite.name = classname + "|" + "Plyr:" +
                    String(self.AllUnitsInGameScene[unitUUID]!.teamNumber) + "|" + String(unitI)
                self.AllUnitsInGameScene[unitUUID]!.ReferenceOfGameScene = self
                self.AllUnitsInGameScene[unitUUID]!.initMovementBlocker()
                self.AllUnitsInGameScene[unitUUID]!.positionLogical = self.AllUnitsInGameScene[unitUUID]!.sprite.position
                
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
                
                unitI += 1
            } else if self.AllUnitsInGameScene[unitUUID]! is BaseStructure {
                self.addChild(self.AllUnitsInGameScene[unitUUID]!.sprite)
            }
        }
        
//        generateTerrainRandom()
        
        
        self.addChild(debugLabel)
        
        didFinishLoadingBlankGameScene()
        printDebugInfoAfterInitilization()
        initPlayerTarget()
    }
    

    /*


labelUnitName.position = CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.94))
labelArmor.position = CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.86))
labelDamage.position = CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.81))
 labelSight.position = CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.76))
 labelSpeed.position = CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.71))
 self.panelView.position = CGPoint(x: (gameScene.size.width * 0.91), y: (gameScene.size.height * 0.70))
 self.attackButton.position = CGPoint(x: (gameScene.size.width * 0.95), y: 90)
 self.spell1Button.position = CGPoint(x: (gameScene.size.width * 0.59), y: 90)
 self.spell2Button.position = CGPoint(x: (gameScene.size.width * 0.68), y: 90)
 self.spell3Button.position = CGPoint(x: (gameScene.size.width * 0.77), y: 90)
 self.spell4Button.position = CGPoint(x: (gameScene.size.width * 0.86), y: 90)
 self.ralleyButton.position = CGPoint(x: (gameScene.size.width * 0.5), y: 200)
 lblStatsStrength.position = CGPoint(x: (gameScene.size.width * 0.3), y: (gameScene.size.height * 0.25))
 lblStatsDexterity.position = CGPoint(x: (gameScene.size.width * 0.3), y: (gameScene.size.height * 0.4))
    */


    
    
    
    func appendUnitsFromMultiplayerServer() {
        
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
    
    // FOR HOST ONLY:
    func ThisUnitTookDamage(_ sprite: SKBlockMovementSpriteNode, fromUnit: AbstractUnit) {
        guard self.playerSK.teamNumber == 1 else {
            return
        }
        let teamNumberOfUnitTakingDamage = sprite.UnitReference.teamNumber
        let DMG = fromUnit.DMG

        broadcast(unit: sprite.UnitReference, didTakeDamage: DMG, from: fromUnit)
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

    // FOR GUESTS ONLY:
    func applyDamage(_ victimUnit: AbstractUnit, amount: Int, fromUnit: AbstractUnit) {
        let UpdateScenarioListener = victimUnit.unitWillTakeDamageReturnIfUnitDies(amount, fromUnit: fromUnit)
    }
    
    
    func addChildTemporary(_ node: SKNode) {
//        temporaryNodes.append(node)
        self.addChild(node)
        node.run(SKAction.fadeOut(withDuration: 1.0))
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
