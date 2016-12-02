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
//        debugAllUnitGUIDs.append(u1.uuid)
        
        let u2 = GruntLvl3Unit(player: owner)
        u2.sprite.position = spawnLocation2
//        debugAllUnitGUIDs.append(u2.uuid)
        
        let u3 = GruntLvl3Unit(player: owner)
        u3.sprite.position = spawnLocation3
//        debugAllUnitGUIDs.append(u3.uuid)

        returnValue[u1.uuid] = u1
        returnValue[u2.uuid] = u2
        returnValue[u3.uuid] = u3
        
        self.unitsForMultiplayer = returnValue
        
        return returnValue
    }
    
    
    func getPlayerUnit() -> AbstractUnit {
        let player1 = HeroFootmanUnit(player: 1, gameScene: self, loadSpriteImmediately: false)
//        let player2 = HeroFootmanUnit(player: 0)

        player1.sprite.position = CGPoint(x:600,y:350)
        player1.isPlayer = true
        player1.teamNumber = 1

//        player2.sprite.position = CGPoint(x:600,y:350)
//        player2.isPlayer = true
//        player2.teamNumber = 1

//        let deviceWidth = UIScreen.main.nativeBounds.height
        
//        if deviceWidth == 1080.0 {
        return player1
//        } else {
//            return player2
//        }
    }
    
    
    func generateRandomUnits(owner: Int) -> [UUID:AbstractUnit] {
        var returnValue : [UUID:AbstractUnit] = [:]
        let spawnLocation = CGPoint(x:600,y:150)
        let uuid = UUID.init()
        returnValue[uuid] = GruntLvl3Unit(player: owner, spawnLocation: spawnLocation)
        return returnValue
    }

    func appendUnitToGameScene(_ unitToAppend : AbstractUnit) {
        print("[isAutonomous]: \(unitToAppend.isAutonomous)")

        let classname = String(describing: Mirror(reflecting: unitToAppend).subjectType)


        unitToAppend.isPlayer = unitToAppend.isAutonomous
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

        let startP : CGPoint = unitToAppend.sprite.position
        let x : CGFloat = startP.x
        let y : CGFloat = startP.y
        let blockedStartLocation = GamePathMatrixPoint(location: startP, spaceTime: classname)
        PathsBlocked["{\(x),\(y)}"] = blockedStartLocation

        self.AllUnitsInGameScene[unitToAppend.uuid] = unitToAppend
        self.AllUnitGUIDs.append(unitToAppend.uuid)
    }

    func appendAIUnitToGameScene(unit : AbstractUnit) {
        print("GOT UNIT SPAWN EVENT!!!")
        //        alert("⚠️", "GOT UNIT SPAWN EVENT")
        print("[isAutonomous]: \(unit.isAutonomous)")

        let classname = String(describing: Mirror(reflecting: unit).subjectType)


        if self.currentPlayerNumber2 == 1 {
            unit.isAutonomous = true
        } else {
            unit.isAutonomous = false
        }

//        unit.teamNumber = 86
        unit.isPlayer = false
        unit.spriteSight.UnitReference = unit
        unit.sprite.UnitReference = unit
        unit.meleeSight.UnitReference = unit
        unit.sprite.name = "\(classname)|Plyr:\(unit.teamNumber)"
        unit.ReferenceOfGameScene = self
        unit.initMovementBlocker()
        unit.positionLogical = unit.sprite.position

        self.addChild(unit.sprite)
        self.addChild(unit.spriteMovementBlocker)
        self.addChild(unit.spriteSight)
        self.addChild(unit.meleeSight)

        let startP : CGPoint = unit.sprite.position
        let x : CGFloat = startP.x
        let y : CGFloat = startP.y
        let blockedStartLocation = GamePathMatrixPoint(location: startP, spaceTime: classname)
        PathsBlocked["{\(x),\(y)}"] = blockedStartLocation

        if unit.teamNumber == 1 {
            unit.sprite.run(SKAction.colorize(with: .red, colorBlendFactor: 0.9, duration: 1))
        }

        self.AllUnitsInGameScene[unit.uuid] = unit
        self.AllUnitGUIDs.append(unit.uuid)
    }
    
}
