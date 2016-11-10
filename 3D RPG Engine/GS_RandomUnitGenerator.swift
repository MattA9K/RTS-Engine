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
        
        let spawnLocation1 = CGPoint(x:600, y:950)
        let spawnLocation2 = CGPoint(x:600, y:900)
        let spawnLocation3 = CGPoint(x:550, y:900)
        
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
        let player = HeroFootmanUnit(player: 1)
        player.sprite.position = CGPoint(x:600,y:350)
        player.isPlayer = true
        player.teamNumber = 1
        return player
    }
    
    
    func generateRandomUnits(owner: Int) -> [UUID:AbstractUnit] {
        var returnValue : [UUID:AbstractUnit] = [:]
        let spawnLocation = CGPoint(x:600,y:150)
        let uuid = UUID.init()
        returnValue[uuid] = GruntLvl3Unit(player: owner, spawnLocation: spawnLocation)
        return returnValue
    }
    
}
