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
        playerTarget!.zPosition = 3000
        playerTarget!.position = playerSK.sprite.position
        addChild(playerTarget!)
    }
    
    
    func resetPlayerTarget() {
        if let target = playerTarget {
            target.position = playerSK.sprite.position
        }
    }
    
    
    
    let socket = WebSocket(url: URL(string: "ws://10.1.10.25:8081/ws/foobar?subscribe-broadcast&publish-broadcast&echo")!)
    
    
    
    func connectGameSceneToWebSocket() {
        if socket.isConnected != true {
            socket.delegate = self
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
            
            
            playerTarget!.position = location
            playerTarget!.position.x = PathFinder().roundToFifties(playerTarget!.position.x)
            playerTarget!.position.y = PathFinder().roundToFifties(playerTarget!.position.y)
            
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
        
        let pos = playerSK.sprite.position
        heroLabel.position = CGPoint(x: pos.x, y: pos.y - 100)
        heroLabel.text = "Location: \(pos) Anchor: \(self.anchorPoint)"
        heroLabel.fontSize = heroLabel.fontSize / 2
    }
    
    var heroLabel = SKLabelNode(text: "Hero label ready")
    func initHeroLabel() {
        self.addChild(heroLabel)
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
        showActionDebugAlert()
    }
    func heroDidCastSpell2() {
//        fireFrozenOrbPlayerHelper()
        
    }
    func heroDidCastSpell3() {
//        fireMissileBombPlayerHelper()
        
    }
    func heroDidCastSpell4() {
//        playerCastBlizzardHelper()
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
    
    
    
    var plainGrassNodes = [SKSpriteNode]()
    var plainDirtNodes = [SKSpriteNode]()
    var plainGrassNodesLayer2 = [SKSpriteNode]()
    var plainDirtNodesLayer2 = [SKSpriteNode]()
    var autoCompleteGrassNodes = [SKSpriteNode]()
    var autoCompletedGrassCornerNodes = [SKNode]()
    var transitionalMapSectionsLeft = 10
    
    var unitsForMultiplayer : [UUID:AbstractUnit] = [:]
    
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
    
    

    var debugAllUnitGUIDs : [UUID] = []
    func generateUnitsAndTilesFromMap(_ mapName: String) {
        hackmapname = mapName
        
//        self.AllUnitsInGameScene = self.map.generateGameSceneBasedFromMap(mapName)
//        self.AllUnitGUIDs = self.map.allUnitGuids
        
        
        
//        self.generateTerrainRandom()
        
        
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
        
        mapDataWasLoadedIntoRAM()
        printDebugInfoAfterInitilization()
        initPlayerTarget()
    }
    
    
    func appendUnitToGameScene(_ unitToAppend : AbstractUnit) {
        let classname = String(describing: Mirror(reflecting: unitToAppend).subjectType)
        
        unitToAppend.spriteSight.UnitReference = unitToAppend
        unitToAppend.sprite.UnitReference = unitToAppend
        unitToAppend.meleeSight.UnitReference = unitToAppend
        unitToAppend.sprite.name = "\(classname)|Plyr:\(unitToAppend.teamNumber)"
        unitToAppend.ReferenceOfGameScene = self
        unitToAppend.initMovementBlocker()
        unitToAppend.positionLogical = unitToAppend.sprite.position
        
        self.addChild(unitToAppend.sprite)
        self.addChild(unitToAppend.spriteMovementBlocker)
        self.addChild(unitToAppend.spriteSight)
        self.addChild(unitToAppend.meleeSight)
        
        PathsBlocked[String(describing: unitToAppend.sprite.position)] = true
        
        self.AllUnitsInGameScene[unitToAppend.uuid] = unitToAppend
        self.AllUnitGUIDs.append(unitToAppend.uuid)
    }
    
    
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
