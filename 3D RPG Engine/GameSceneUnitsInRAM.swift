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
    var playerSK: FootmanUnit!
    let playerSpriteID = "sprite_player"
    var enemyHeroSK = GruntSprite(unit: Actor.EnemyFootman)
    let enemyHeroSpriteID = "sprite_enemy"
    
    // NON-HEROES
    var enemies = [GruntSprite]()
    var allEnemyIDs: [String:GruntSprite] = [:]
    
    init(gameScene: GameScene) {
        GameSceneReference🔶 = gameScene
        generatePlayer()
        generateEnemyHero()
        generateEnemies()
    }
    
    func generatePlayer() {
        playerSK = FootmanUnit(unit: Actor.Player, scene: GameSceneReference🔶)
        GameSceneReference🔶.addChild(playerSK!.sprite)
        playerSK!.sprite.name = playerSpriteID
    }
    func generateEnemyHero() {
        GameSceneReference🔶.addChild(enemyHeroSK.sprite)
        enemyHeroSK.sprite.name = enemyHeroSpriteID
    }
    
    var kills = 0
    var lastID = 0
    func generateEnemies() {
        
        for var i = 0; i < 5; i++ {
            
            let lower1 : UInt32 = 100
            let upper1 : UInt32 = 900
            let x = CGFloat(arc4random_uniform(upper1 - lower1) + lower1)
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {

                dispatch_async(dispatch_get_main_queue()) {
                    let grunt = GruntSprite(unit: .EnemyFootman)
                    
                    let lower2 : UInt32 = 100
                    let upper2 : UInt32 = 900
                    let y = CGFloat(arc4random_uniform(upper2 - lower2) + lower2)
                    //                NSThread.sleepForTimeInterval(0.3);
                    grunt.sprite.name = "grunt_" + String(self.lastID)
                    grunt.sprite.position = CGPointMake(x, y)
                    self.GameSceneReference🔶.addChild(grunt.sprite)
                    self.allEnemyIDs["grunt_" + String(self.lastID)] = grunt
                    self.enemies.append(grunt)
                    self.lastID++
                }
            }
            

        }
        print("ENEMIES")
        print(enemies)
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
        GameSceneReference🔶.updateDebugLabel(unitID + " was damaged.")
        for unit in enemies {
            print("|       UNITS  IN  RAM       |")
            print("[NAME]: " + unit.sprite.name!)
            if unit.sprite.name == unitID {
                unit.unitDidTakeDamage(1)
                
                if unit.isDead == true {
                    GameSceneReference🔶.updateDebugLabel("Kills: " + String(kills))
                    allEnemyIDs.removeValueForKey(unitID)
                    kills += 1
                }
                if allEnemyIDs.count == 0 {
                    for unit in enemies {
                        unit.sprite.removeFromParent()
                    }
                    enemies = [GruntSprite]()
                    generateEnemies()
                }
            }
        }
    }
}
