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
    var playerSK: SpellSwordUnit!
    let playerSpriteID = "sprite_player"
    var enemyHeroSK: GruntUnit!
    let enemyHeroSpriteID = "sprite_enemy"
    
    // NON-HEROES
    var enemies = [BaseUnit]()
    var allEnemyIDs: [String:BaseUnit] = [:]
    
    var tilesets = [SKGroundTileGeneric]()
    
    
    init(gameScene: GameScene) {
        GameSceneReference🔶 = gameScene
        generatePlayer()
//        generateEnemyHero()
        
        generateUnitsFromMap()
    }
    
    
    func generateUnitsFromMap() {
        let map = GameMap()
        map.generateGameSceneBasedFromMap()
        map.generateGameTilesetSceneBasedFromMap()
        
        print("UNITS IN MAP: ")
        print(map.UnitsInMap)
        
        for unit in map.UnitsInMap {
            unit.ReferenceOfGameScene🔶 = GameSceneReference🔶
            GameSceneReference🔶.addChild(unit.sprite)
            GameSceneReference🔶.addChild(unit.spriteMovementBlocker)
            unit.updateMovementBlockerPosition()
            enemies.append(unit)
            allEnemyIDs[unit.sprite.name!] = unit
            unit.spriteMovementBlocker.UnitReference🔶 = unit
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
        case enemyHeroSpriteID:
            enemyHeroSK.unitDidTakeDamage(1)
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
    
    
    func generatePlayer() {
        playerSK = SpellSwordUnit(unit: Actor.Player, scene: GameSceneReference🔶)
        GameSceneReference🔶.addChild(playerSK!.sprite)
        GameSceneReference🔶.addChild(playerSK!.spriteMovementBlocker)
        playerSK!.sprite.name = playerSpriteID
        enemies.append(playerSK!)
        allEnemyIDs[playerSpriteID] = playerSK!
    }
    func generateEnemyHero() {
        enemyHeroSK = GruntUnit(unit: Actor.Player, scene: GameSceneReference🔶)
        GameSceneReference🔶.addChild(enemyHeroSK!.sprite)
        enemyHeroSK.sprite.position = CGPoint(x:250, y:300)
        enemyHeroSK.teamNumber = 3
        enemyHeroSK!.sprite.name = enemyHeroSpriteID
    }
    

}
