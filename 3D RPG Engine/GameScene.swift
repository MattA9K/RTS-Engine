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
