//
//  GameScene_BroadcastSocketHost.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/22/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import SpriteKit


extension GameScene {
    
    func broadcastPlayerHeroMovementToGameScene(_ direction: UnitFaceAngle) {
        socket.write(string: "broadcastPlayerHeroMovementToGameScene")
        let broadcastMessage : JSON = [
            "id":self.totalSocketMessages,
            "type":"SOCKET_MULTIPLAYER_EVENT_HERO",
            "uuid":self.playerSK.uuid.uuidString,
            "player":self.playerSK.teamNumber,
            "sent_by_host":(self.currentPlayerNumber == 1),
            "direction":self.playerSK.angleFacing.facingAngleString,
            "unit_action":"walk"
        ]
        
        socket.write(string: broadcastMessage.rawString()!)
    }
    
    func broadcastPlayerHeroAttackToGameScene(_ direction: UnitFaceAngle) {
        socket.write(string: "broadcastPlayerHeroAttackToGameScene")
        let broadcastMessage : JSON = [
            "id":self.totalSocketMessages,
            "type":"SOCKET_MULTIPLAYER_EVENT_HERO",
            "uuid":self.playerSK.uuid.uuidString,
            "player":self.playerSK.teamNumber,
            "sent_by_host":(self.currentPlayerNumber == 1),
            "direction":self.playerSK.angleFacing.facingAngleString,
            "unit_action":"attack"
        ]
        socket.write(string: broadcastMessage.rawString()!)
    }
    
    func broadcastPlayerToGameScene() {
        socket.write(string: "broadcastPlayerToGameScene")
        let broadcastMessage : JSON = [
            "id":self.totalSocketMessages,
            "type":"BROADCAST_UNIT",
            "uuid":self.playerSK.uuid.uuidString,
            "sent_by_host":(self.currentPlayerNumber == 1),
            "position": "{\(self.playerSK.sprite.position.x), \(self.playerSK.sprite.position.y)}",
            "class":"\(Mirror(reflecting: self.playerSK).subjectType)",
            "player":self.playerSK.teamNumber
        ]
        socket.write(string: broadcastMessage.rawString()!)
    }
    
    func broadcastAIUnitsToGameScene() {
        socket.write(string: "broadcastAIUnitsToGameScene")
        var arrayOfUnits = [JSON]()
        for unit in AllUnitsInGameScene {
            if unit.value is HeroFootmanUnit {
            } else {
                let broadcastMessage : JSON = [
                    "id":self.totalSocketMessages,
                    "type":"BROADCAST_UNIT",
                    "uuid":unit.value.uuid.uuidString,
                    "sent_by_host":(self.currentPlayerNumber == 1),
                    "position": "{\(unit.value.sprite.position.x), \(unit.value.sprite.position.y)}",
                    "class":"\(Mirror(reflecting: unit.value).subjectType)",
                    "player":unit.value.teamNumber
                ]
                arrayOfUnits.append(broadcastMessage)
                AllUnitsInGameScene[unit.key]?.killUnitWithAnimation()
            }
        }
        let finalDict = [
            "type":"BROADCAST_AI_UNITS",
            "units":JSON(arrayOfUnits)
        ]
        let finalJSON = JSON(finalDict).rawString()!
        socket.write(string: finalJSON)
    }
    
    func broadcastUnitAIMovementToGameScene(_ unit: AbstractUnit, _ direction: UnitFaceAngle) {
        socket.write(string: "broadcastUnitAIMovementToGameScene")
        print("[HOST TELLING UNIT TO ATTACK...]: \(Mirror(reflecting: unit).subjectType)")
        if unit is HeroFootmanUnit {
            
        } else {
            let broadcastMessage : JSON = [
                "id":self.totalSocketMessages,
                "type":"SOCKET_MULTIPLAYER_EVENT",
                "uuid":unit.uuid.uuidString,
                "player":unit.teamNumber,
                "sent_by_host":(self.currentPlayerNumber == 1),
                "direction":direction.facingAngleString,
                "unit_action":"walk",
                "class":"\(Mirror(reflecting: unit).subjectType)",
                "current_position":"{\(unit.sprite.position.x), \(unit.sprite.position.y)}",
            ]
            socket.write(string: broadcastMessage.rawString()!)
            
            print("[SOCKET SENT]: \n \(broadcastMessage.rawString(.utf8, options: .prettyPrinted))")
        }
    }
    
    func broadcastUnitAIAttackToGameScene(_ unit: AbstractUnit, _ direction: UnitFaceAngle) {
        socket.write(string: "broadcastUnitAIAttackToGameScene")
        print("[HOST TELLING \(Mirror(reflecting: unit).subjectType) TO ATTACK  \(Mirror(reflecting: unit.focusedTargetUnit).subjectType)")
        if unit is HeroFootmanUnit {
            
        } else {
            let broadcastMessage : JSON = [
                "id":self.totalSocketMessages,
                "type":"SOCKET_MULTIPLAYER_EVENT",
                "uuid":unit.uuid.uuidString,
                "player":unit.teamNumber,
                "sent_by_host":(self.currentPlayerNumber == 1),
                "direction":direction.facingAngleString,
                "unit_action":"attack",
                "class":"\(Mirror(reflecting: unit).subjectType)",
                "current_position":"{\(unit.sprite.position.x), \(unit.sprite.position.y)}",
            ]
            socket.write(string: broadcastMessage.rawString()!)
        }
    }
    
    
    func broadcastTileMapToClients() {
        
        func convertNameToTexturePNG(_ name: String) -> String {
            let strxxx = "AG-Dirt-Grass-plain-n"
            var lastTwoChars = ""
            var temp = ""
            var stringWeWant = ""
            for char in strxxx.characters.reversed() {
                if lastTwoChars.characters.count < 2 {
                    lastTwoChars.append(char)
                } else {
                    temp.append(char)
                    var str = ""
                    str.append(char)
                    stringWeWant.append(str)
                }
            }
            
            var finalStringNameOfTexturePNG = ""
            for str in stringWeWant.characters.reversed() {
                finalStringNameOfTexturePNG.append(str)
            }
            
            lastTwoChars.characters.reversed()
            print("Found character: \(lastTwoChars)")
            print("We'll use: \(finalStringNameOfTexturePNG)")
            
            return finalStringNameOfTexturePNG
        }
        
        var listOfTilesToBroadcast = [JSON]()
        for item in self.nodesForMultiplayerHost {
            let broadcastMessage : JSON = [
                "type":"SOCKET_MULTIPLAYER_HOST_MAP",
                "texture_name":convertNameToTexturePNG(item.name!),
                "position":"{\(item.position.x), \(item.position.y)}",
            ]
            listOfTilesToBroadcast.append(broadcastMessage)
        }
        let messagePayload = JSON(listOfTilesToBroadcast)
        self.socket.write(string: messagePayload.rawString(.utf8, options: .prettyPrinted)!, completion: {
            // finished hosting map.
        })
    }
    
    func broadcastDebugMessage_PrintAllUnitsInGameScene() {
        socket.write(string: "broadcastDebugMessage_PrintAllUnitsInGameScene")
        if self.AllUnitsInGameScene.count > 0 {
            var listToPrint = [JSON]()
            for unit in self.AllUnitsInGameScene {
                var element : JSON = [
                    "uuid":unit.value.uuid.uuidString,
                    "sent_by_player":self.playerSK.teamNumber,
                    "player":unit.value.teamNumber,
                    "class":"\(Mirror(reflecting: unit.value).subjectType)",
                    "current_position":"{\(unit.value.sprite.position.x), \(unit.value.sprite.position.y)}",
                    "sent_by_host":(self.currentPlayerNumber == 1),
                    "isPlayer":"\(unit.value.isPlayer)",
                    "1":"# # # # # #"
                ]
                listToPrint.append(element)
            }
            let json = JSON(listToPrint)
            print("[DEBUG UNITS IN LOCAL CLIENT]: \(json)")
            DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.alert("Debug Message", "Dump of all units on the local client: \n \n \(json.rawString(.utf8, options: .prettyPrinted)!)")
                    self.socket.write(string: json.rawString(.utf8, options: .prettyPrinted)!)
                }
            }
        }
    }
    
}
