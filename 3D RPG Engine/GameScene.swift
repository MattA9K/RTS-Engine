//
//  GameScene.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    
    var debugLabel = SKLabelNode(fontNamed:"HoeflierText")
    var debugLabelCamera = SKLabelNode(fontNamed:"HoeflierText")
    
    var ControlPanel: UserInputControlsPanel?
    var AllUnitsInRAM: GameSceneUnitsInRAM?
    
    let SightCategory   : UInt32 = 0x1 << 0
    
    let Player_1_Sprite_Category   : UInt32 = 0x1 << 1
    let Player_1_Sight_Category   : UInt32 = 0x1 << 2
    
    let Player_2_Sprite_Category   : UInt32 = 0x1 << 3
    let Player_2_Sight_Category   : UInt32 = 0x1 << 4

    let map = GameMap()
    
    // HEROES
    var playerSK: BaseUnit!
    let playerSpriteID = "sprite_player"
    
    // NON-HEROES
    var enemies = [BaseUnit]()
    //    var allEnemyIDs: [String:BaseUnit] = [:]
    
    var tilesets = [SKGroundTileGeneric]()
    
    
    var playerTarget: SKPlayerTarget?
    
    
}

public func logg(line: Any) {
    print(line)
}