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
        
        generateUnitsFromMap()
    }
    
    
    func generateUnitsFromMap() {
        let map = GameMap()
        map.generateGameSceneBasedFromMap()
        map.generateGameTilesetSceneBasedFromMap()
        
        print("UNITS IN MAP: ")
        print(map.UnitsInMap)
        
        for unit in map.UnitsInMap {
            if unit is BaseUnit {
                (unit as! BaseUnit).ReferenceOfGameScene🔶 = GameSceneReference🔶
                GameSceneReference🔶.addChild((unit as! BaseUnit).sprite)
                GameSceneReference🔶.addChild((unit as! BaseUnit).spriteMovementBlocker)
                (unit as! BaseUnit).updateMovementBlockerPosition()
                enemies.append((unit as! BaseUnit))
                allEnemyIDs[(unit as! BaseUnit).sprite.name!] = (unit as! BaseUnit)
                (unit as! BaseUnit).spriteMovementBlocker.UnitReference🔶 = (unit as! BaseUnit)
                
                if (unit as! BaseUnit).isPlayer == true {
                    playerSK = (unit as! BaseUnit)
                }
            } else if unit is BaseStructure {
                GameSceneReference🔶.addChild((unit as! BaseStructure).sprite)
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
    func ThisUnitInTheSceneTookDamage(unitID: String) {
        switch unitID {
        case "nn":
            print("remove this switch thing")
        default:
            NonHeroUnitTookDamage(unitID)
        }
    }
    
    // TODO: replace Array with Set collection type.
    func NonHeroUnitTookDamage(unitID: String) {
        for unit in enemies {
            print("|       UNITS  IN  RAM       |")
            print("[NAME]: " + unit.sprite.name!)
            if unit.sprite.name == unitID {
                unit.unitDidTakeDamage(1)
                
                if unit.isDead == true {
                    
//                    kills += 1
//                    GameSceneReference🔶.updateDebugLabel("Kills: " + String(kills))
//                    allEnemyIDs.removeValueForKey(unitID)
                }
//                if allEnemyIDs.count == 0 {
//                    for unit in enemies {
//                        unit.sprite.removeFromParent()
//                    }
//                    enemies = [BaseUnit]()
//                    generateEnemies()
//                }
            }
        }
    }
    
    



}
