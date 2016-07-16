//
//  GameSceneUnitsInRAM.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/1/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


class GameSceneUnitsInRAM {
    
    var GameSceneReference🔶: GameScene!
    
    
    // HEROES
    var playerSK: BaseUnit!
    let playerSpriteID = "sprite_player"
    
    // NON-HEROES
    var enemies = [BaseUnit]()
    var allEnemyIDs: [String:BaseUnit] = [:]
    
    var tilesets = [SKGroundTileGeneric]()
    
    
    init(gameScene: GameScene) {
        GameSceneReference🔶 = gameScene
        
        
    }
    
    
    func generateUnitsFromMap() {
        let map = GameMap()
        map.generateGameSceneBasedFromMap()
        map.generateGameTilesetSceneBasedFromMap()
        
        print("UNITS IN MAP: ")
        print(map.UnitsInMap)
        
        var unitI = 0
        for unit in map.UnitsInMap {
            if unit is BaseUnit {
                
                let mirror = Mirror(reflecting: unit)
                let classname:String = mirror.description
                unit.sprite.UnitReference🔶 = unit
                unit.sprite.name = classname + " " + "Plyr:" + String(unit.teamNumber) + "_" + String(unitI)
                unit.ReferenceOfGameScene🔶 = GameSceneReference🔶
                GameSceneReference🔶.addChild(unit.sprite)
                GameSceneReference🔶.addChild(unit.spriteMovementBlocker)
                if let sight = unit.sight {
                    sight.position = unit.sprite.position
                    GameSceneReference🔶.addChild(sight)
                }
                unit.updateMovementBlockerPosition()
                enemies.append(unit)
                allEnemyIDs[unit.sprite.name!] = unit
                unit.spriteMovementBlocker.UnitReference🔶 = unit
                
                if (unit as! BaseUnit).isPlayer == true {
                    playerSK = unit
                }
                unitI += 1
            } else if unit is BaseStructure {
                GameSceneReference🔶.addChild(unit.sprite)
            }

        }
        
        for tile in map.TilesInMap {
            GameSceneReference🔶.addChild(tile)
//            tilesets.append(unit)
//            allEnemyIDs[unit.sprite.name!] = unit
        }
        
    }

    
    
    func ThisUnitTookDamage(unit: SKBlockMovementSpriteNode) {
        unit.UnitReference🔶.unitDidTakeDamage(1)
    }

    
    



}
