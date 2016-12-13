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
        let broadcastMessage : JSON = [
            "id":self.totalSocketMessages,
            "type":"SOCKET_MULTIPLAYER_EVENT_HERO",
            "uuid":self.playerSK.uuid.uuidString,
            "player":self.playerSK.teamNumber,
            "sent_by_host":(self.currentPlayerNumber == 1),
            "direction":self.playerSK.angleFacing.facingAngleString,
            "destination": "{\(self.playerSK.sprite.position.x), \(self.playerSK.sprite.position.y)}",
            "unit_action":"walk"
        ]
//        socket.write(string: broadcastMessage.rawString()!)

        if (self.playerSK as! PathfinderUnit).isMoving == false {
            self.appendMessageToQueue(broadcastMessage.rawString()!)
        }
    }
    
    func broadcastPlayerHeroAttackToGameScene(_ direction: UnitFaceAngle) {
        let broadcastMessage : JSON = [
            "id":self.totalSocketMessages,
            "type":"SOCKET_MULTIPLAYER_EVENT_HERO",
            "uuid":self.playerSK.uuid.uuidString,
            "player":self.playerSK.teamNumber,
            "sent_by_host":(self.currentPlayerNumber == 1),
            "direction":self.playerSK.angleFacing.facingAngleString,
            "unit_action":"attack"
        ]
//        socket.write(string: broadcastMessage.rawString()!)
        self.appendMessageToQueue(broadcastMessage.rawString()!)
    }
    
    func broadcastPlayerToGameScene() {
        let broadcastMessage : JSON = [
            "id":self.totalSocketMessages,
            "type":"BROADCAST_UNIT",
            "uuid":self.playerSK.uuid.uuidString,
            "sent_by_host":(self.currentPlayerNumber == 1),
            "position": "{\(self.playerSK.sprite.position.x), \(self.playerSK.sprite.position.y)}",
            "class":"\(Mirror(reflecting: self.playerSK).subjectType)",
            "player":self.playerSK.teamNumber
        ]
//        socket.write(string: broadcastMessage.rawString()!)
        self.appendMessageToQueue(broadcastMessage.rawString()!)
    }
    
    //DEPRICATED
    func broadcastAIUnitsToGameScene(_ didTransmitSuccessfully: @escaping (Bool?) -> ()) -> () {
        guard self.playerSK != nil else {
            return
        }
        guard self.playerSK.teamNumber == 1 else {
            return
        }
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
                AllUnitsInGameScene[unit.key]?.killWithAnimation()
            }
        }
        let finalDict = [
            "type":"BROADCAST_AI_UNITS",
            "units":JSON(arrayOfUnits)
        ]
        let finalJSON = JSON(finalDict).rawString()!
        self.appendMessageToQueue(finalJSON)
        //socket.write(string: finalJSON, completion: { _ in
        //    didTransmitSuccessfully(true)
        //})
    }
    
    func broadcastAIUnitToGameScene() {
        guard self.playerSK != nil else {
            return
        }
        guard self.playerSK.teamNumber == 1 else {
            return
        }
        var arrayOfStrings = [String]()
        for unit in AllUnitsInGameScene {
            if unit.value is HeroFootmanUnit {
            } else {
                let broadcastMessage : JSON = [
                    "id":self.totalSocketMessages,
                    "type":"BROADCAST_AI_UNIT",
                    "uuid":unit.value.uuid.uuidString,
                    "sent_by_host":(self.currentPlayerNumber == 1),
                    "position": "{\(unit.value.sprite.position.x), \(unit.value.sprite.position.y)}",
                    "class":"\(Mirror(reflecting: unit.value).subjectType)",
                    "player":unit.value.teamNumber
                ]
//                arrayOfStrings.append(broadcastMessage.rawString()!)
                AllUnitsInGameScene[unit.key]?.killWithAnimation()
                self.appendMessageToQueue(broadcastMessage.rawString()!)
            }
        }
//        let finalDict = [
//            "type":"BROADCAST_AI_UNITS",
//            "units":JSON(arrayOfUnits)
//        ]
//        let finalJSON = JSON(finalDict).rawString()!

//        aiUnitBCCounterk = arrayOfStrings.count - 1
//        writeOutMessagesInOrder(arrayOfStrings)
    }

    func broadcastAIUnitToGameScene(unit: AbstractUnit) {
        guard self.playerSK != nil else {
            return
        }
        guard self.playerSK.teamNumber == 1 else {
            return
        }
        let broadcastMessage : JSON = [
                "id":self.totalSocketMessages,
                "type":"BROADCAST_AI_UNIT",
                "uuid":unit.uuid.uuidString,
                "sent_by_host":(self.currentPlayerNumber == 1),
                "position": "{\(unit.sprite.position.x), \(unit.sprite.position.y)}",
                "class":"\(Mirror(reflecting: unit).subjectType)",
                "player":unit.teamNumber
        ]
        AllUnitsInGameScene[unit.uuid]?.killWithAnimation()
        self.appendMessageToQueue(broadcastMessage.rawString()!)
    }
    
    func writeOutMessagesInOrder(_ arrayOfStrings: [String]) {
        if aiUnitBCCounterk >= 0 {
            if socket.isConnected {
                socket.write(string: arrayOfStrings[aiUnitBCCounterk], completion: {
                    self.writeOutMessagesInOrder(arrayOfStrings)
                })
            }
            aiUnitBCCounterk -= 1
        }
    }
    
    
    
    func broadcastUnitAIMovementToGameScene(_ unit: AbstractUnit, _ direction: UnitFaceAngle) {
//        guard self.playerSK != nil else {
//            return
//        }
//        guard self.playerSK.teamNumber == 1 else {
//            return
//        }
//        guard unit is HeroFootmanUnit else {
//            return
//        }
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
            self.appendMessageToQueue(broadcastMessage.rawString()!)
//            socket.write(string: broadcastMessage.rawString()!)
    }
    
    func broadcastUnitAIAttackToGameScene(_ unit: AbstractUnit, _ direction: UnitFaceAngle) {
        guard self.playerSK != nil else {
            return
        }
        guard self.playerSK.teamNumber == 1 else {
            return
        }
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
//            socket.write(string: broadcastMessage.rawString()!)
            self.appendMessageToQueue(broadcastMessage.rawString()!)
        }
    }


    func broadcastAIDidArriveAtDestination(_ unit: AbstractUnit, destination: CGPoint) {
        guard self.playerSK != nil else {
            return
        }
        guard self.playerSK.teamNumber == 1 else {
            return
        }
        let broadcastMessage : JSON = [
                "id":self.totalSocketMessages,
                "type":"SOCKET_MULTIPLAYER_EVENT",
                "uuid":unit.uuid.uuidString,
                "player":unit.teamNumber,
                "sent_by_host":(self.currentPlayerNumber == 1),
                "direction":unit.angleFacing.facingAngleString,
                "unit_action":"walk_stopped",
                "class":"\(Mirror(reflecting: unit).subjectType)",
                "destination":"{\(unit.sprite.position.x), \(unit.sprite.position.y)}",
        ]
//        socket.write(string: broadcastMessage.rawString()!)
        self.appendMessageToQueue(broadcastMessage.rawString()!)
    }


    func broadcast(unit: AbstractUnit, didTakeDamage: Int, from: AbstractUnit) {
        guard self.playerSK != nil else {
            return
        }
        guard self.playerSK.teamNumber == 1 else {
            return
        }
        let broadcastMessage : JSON = [
                "id":self.totalSocketMessages,
                "type":"SOCKET_MULTIPLAYER_EVENT",
                "victim_uuid":unit.uuid.uuidString,
                "victim_player":unit.teamNumber,
                "attacker_uuid":from.uuid.uuidString,
                "attacker_player":from.teamNumber,
                "sent_by_host":(self.currentPlayerNumber == 1),
                "victim_class":"\(Mirror(reflecting: unit).subjectType)",
                "attacker_class":"\(Mirror(reflecting: from).subjectType)",
                "amount":didTakeDamage,
                "unit_action":"damaged",
        ]
//        socket.write(string: broadcastMessage.rawString()!)
        self.appendMessageToQueue(broadcastMessage.rawString()!)
    }


    func broadcastDeathOf(unit: AbstractUnit) {
        guard self.playerSK != nil else {
            return
        }
        guard self.playerSK.teamNumber == 1 else {
            return
        }
        let broadcastMessage : JSON = [
                "id":self.totalSocketMessages,
                "type":"SOCKET_MULTIPLAYER_EVENT",
                "uuid":unit.uuid.uuidString,
                "player":unit.teamNumber,
                "class":"\(Mirror(reflecting: unit).subjectType)",
                "sent_by_host":(self.currentPlayerNumber == 1),
                "unit_action":"death",
        ]
//        socket.write(string: broadcastMessage.rawString()!)
        self.appendMessageToQueue(broadcastMessage.rawString()!)
    }

    

    
    func broadcastTileMapToClients() {


        var id = 0
        var listOfMessages = [JSON]()
        var k = 0
        
//        var listOfTilesToBroadcast = [JSON]()
        

        for tileSprite in self.children {
            id += 1
            if tileSprite is TileSpriteNode {
//                if let sname = tileSprite.name {
//                    if sname.contains("AG-") {
                
                var name : String?
                
                if tileSprite.name!.contains("-n_tilexx") {
                    name = tileSprite.name!.replacingOccurrences(of: "-n_tilexx", with: "")
                } else {
                    name = tileSprite.name!.replacingOccurrences(of: "-n_tile", with: "")
                }
                        let broadcastMessage : JSON = [
                            "id":id,
                            "type":"SOCKET_MULTIPLAYER_HOST_MAP",
                            "texture_name":name,
                            "position":"{\(tileSprite.position.x), \(tileSprite.position.y)}",
                        ]
                        
                        
//                        listOfTilesToBroadcast.append(broadcastMessage)
//                        let messagePayload = JSON(listOfTilesToBroadcast)
                        
                        listOfMessages.append(broadcastMessage)
//                    }
//                }

//                self.socket.write(string: messagePayload.rawString(.utf8, options: .prettyPrinted)!, completion: {
                    // finished hosting map.
//                })
            }
        }




        func writeOutMessagesInOrder() {
            
            if k >= 0 {
//                print("[k]: \(k)")
                if socket.isConnected {
                    socket.write(string: listOfMessages[k].rawString(.ascii, options: .prettyPrinted)!, completion: {
                        writeOutMessagesInOrder()
                    })
                }
                k -= 1
            }
        }


        k = listOfMessages.count - 1
//        print("[listOfMessages.count]: \(listOfMessages.count)")
        
        writeOutMessagesInOrder()


        
//        for item in self.nodesForMultiplayerHost {
//            let broadcastMessage : JSON = [
//                "id":id,
//                "type":"SOCKET_MULTIPLAYER_HOST_MAP",
//                "texture_name":convertNameToTexturePNG(item.name!),
//                "position":"{\(item.position.x), \(item.position.y)}",
//            ]
//
//            id += 1
//            listOfTilesToBroadcast.append(broadcastMessage)
//
//            let messagePayload = JSON(listOfTilesToBroadcast)
//            self.socket.write(string: messagePayload.rawString(.utf8, options: .prettyPrinted)!, completion: {
//                // finished hosting map.
//            })
//        }

    }
    
    func broadcastDebugMessage_PrintAllUnitsInGameScene() {
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
