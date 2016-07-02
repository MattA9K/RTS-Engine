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
    
    var playerSK: FootmanUnit!
    let playerSpriteID = "sprite_player"
    
    var enemySK = GruntSprite(unit: Actor.EnemyFootman)
    let enemySpriteID = "sprite_enemy"
    
    var enemies = [GruntSprite]()
    var allEnemyIDs = [String]()
    
    init(gameScene: GameScene) {
        GameSceneReference🔶 = gameScene
        generatePlayer()
        generateEnemies()
    }
    
    func generatePlayer() {
        playerSK = FootmanUnit(unit: Actor.Player, scene: GameSceneReference🔶)
        GameSceneReference🔶.addChild(playerSK!.sprite)
        playerSK!.sprite.name = playerSpriteID
    }
    func generateEnemies() {
        GameSceneReference🔶.addChild(enemySK.sprite)
        enemySK.sprite.name = enemySpriteID
    }
    
    func ThisUnitInTheSceneTookDamage(unitID: String) {
        switch unitID {
        case enemySpriteID:
            enemySK.unitDidTakeDamage(1)
        default:
            print("no one damaged by the attack.")
        }
    }
}
