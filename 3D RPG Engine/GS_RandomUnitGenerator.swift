//
//  GS_RandomUnitGenerator.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



extension GameScene {
    
    func getUnitsTest(owner: Int) -> [UUID:AbstractUnit] {
        var returnValue : [UUID:AbstractUnit] = [:]
        
        let spawnLocation1 = CGPoint(x:600, y:550)
        let spawnLocation2 = CGPoint(x:600, y:500)
        let spawnLocation3 = CGPoint(x:550, y:500)
        
        let u1 = GruntLvl3Unit(player: owner)
        u1.sprite.position = spawnLocation1
        debugAllUnitGUIDs.append(u1.uuid)
        
        let u2 = GruntLvl3Unit(player: owner)
        u2.sprite.position = spawnLocation2
        debugAllUnitGUIDs.append(u2.uuid)
        
        let u3 = GruntLvl3Unit(player: owner)
        u3.sprite.position = spawnLocation3
        debugAllUnitGUIDs.append(u3.uuid)

        returnValue[u1.uuid] = u1
        returnValue[u2.uuid] = u2
        returnValue[u3.uuid] = u3
        
        self.unitsForMultiplayer = returnValue
        
        return returnValue
    }
    
    
    func getPlayerUnit() -> AbstractUnit {
        let player1 = HeroFootmanUnit(player: 0)
        let player2 = BalrogUnit(player: 0)
        player1.sprite.position = CGPoint(x:600,y:350)
        player1.isPlayer = true
        player1.teamNumber = 1
        player2.sprite.position = CGPoint(x:600,y:350)
        player2.isPlayer = true
        player2.teamNumber = 1
        let deviceWidth = UIScreen.main.nativeBounds.height
        
        if deviceWidth == 1080.0 {
            return player1
        } else {
            return player2
        }
        
    }
    
    
    func generateRandomUnits(owner: Int) -> [UUID:AbstractUnit] {
        var returnValue : [UUID:AbstractUnit] = [:]
        let spawnLocation = CGPoint(x:600,y:150)
        let uuid = UUID.init()
        returnValue[uuid] = GruntLvl3Unit(player: owner, spawnLocation: spawnLocation)
        return returnValue
    }
    
}
