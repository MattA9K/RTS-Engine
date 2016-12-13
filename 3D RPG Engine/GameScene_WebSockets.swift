//
//  GameScene_WebSockets.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/14/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import Starscream
import SwiftyJSON
import SpriteKit



extension GameScene {
    func websocketDidConnect(socket: WebSocket) {
        print("websocket is connected")
    }

    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("websocket is disconnected: \(error?.localizedDescription)")
        self.alert("WARNING", "The game socket has been disconnected!")
    }

    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        
        if text != "--heartbeat--" {
//            print("GUEST DID GET SOCKET MESSAGE: \n \(text)")
            
            latestDataFromWebSocket = text
            socketTerminal(text)

            
//            passWSTextThroughTerminal(wsStr: text)
        }
        
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: Data) {
        print("got some data: \(data.count)")
    }
    
    
    func socketTerminal(_ rawJson: String) {
        if let dataFromString = rawJson.data(using: .utf8, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            if let type = json["type"].string {

                self.socketMessagesReceivedLog.append("\(json.rawString()!) \n\n")
                self.totalSocketMessages += 1
                switch type {
                case "SOCKET_MULTIPLAYER_EVENT_HERO":
                    appendActionToGameScene(action: json)
                case "SOCKET_MULTIPLAYER_EVENT":
                    appendActionToGameScene(action: json)
                case "SPAWN_UNIT":
                    convertJsonIntoAbstractUnitAndAddToGameScene(action: json)
                case "BROADCAST_UNIT":
                    convertJsonIntoAbstractUnitAndAddToGameScene(action: json)
                case "BROADCAST_AI_UNITS":
                    appendManyUnitsAIToGameScene(action: json)
                    joinGame()
                case "BROADCAST_AI_UNIT":
                    appendSingleAIUnit(action: json)
                case "SOCKET_MULTIPLAYER_HOST_MAP":
                    appendMapRecievedFromHost(data: json)
                default:
                    print("WARNING - Method not yet implemented.")
                }
            }

        }
    }


    func appendMapRecievedFromHost(data: JSON) {

//        let dataLength = data.arrayValue.count
 
        
        if self.playerSK.teamNumber != 1 {
//            for var i in 0...(dataLength - 1) {
                let textureName : String = data["texture_name"].string!
                let position : CGPoint = CGPointFromString(data["position"].string!)
                
                let skAG = SKAmazingGrassTile(imageNamed:textureName)
                skAG.sprite.position = position
                self.nodesCollectedGuest.append(skAG.sprite)
                self.addChild(skAG.sprite)
//                skAG.sprite.run(SKAction.colorize(withColorBlendFactor: 0.75, duration: 3))
//            }
            self.didFinishLoadingMapAsGuest()
        }
    }

    func didFinishLoadingMapAsGuest() {

    }
    
    
    func appendSingleAIUnit(action: JSON) {
//        alert("⚠️", "GOT ARTIFICIAL INTELLIGENCE UNIT SPAWN EVENT")
//        if self.playerSK.teamNumber == 1 {
//            self.playerSK.sprite.name = "HUMAN_PLAYER"
//        } else {
//            self.playerSK.sprite.name = ""
//        }
        
//        for i in 0...(action["units"].arrayValue.count - 1) {
            let startLocation = CGPointFromString(action["position"].string!)
            let uuid : UUID! = UUID.init(uuidString: action["uuid"].string!)
            let intPlayer = action["player"].int!
            let unitClass = action["class"].string!
            
            if self.currentPlayerNumber == 1 {
                
                if let localUnitToBeRemovedForMultiplayer = self.AllUnitsInGameScene[uuid] {
                    localUnitToBeRemovedForMultiplayer.sprite.removeFromParent()
                }
                let newUnit = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
                
                newUnit.isAutonomous = true
                newUnit.uuid = uuid
                newUnit.sprite.position = startLocation
                newUnit.positionLogical = startLocation
                newUnit.isPlayer = false
                self.hostSetOfAiUnits[newUnit.uuid] = newUnit
                
                self.appendAIUnitToGameScene(unit: newUnit)
            } else {
                let newUnit = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
                
                newUnit.isAutonomous = true
                newUnit.uuid = uuid
                newUnit.sprite.position = startLocation
                newUnit.positionLogical = startLocation
                newUnit.isPlayer = false
                
                self.hostSetOfAiUnits[newUnit.uuid] = newUnit
                
                self.appendAIUnitToGameScene(unit: newUnit)
            }
//        }
    }
    
    
    //DEPRECATED
    func appendManyUnitsAIToGameScene(action: JSON) {
        alert("⚠️", "GOT ARTIFICIAL INTELLIGENCE UNIT SPAWN EVENT")
        
        for i in 0...(action["units"].arrayValue.count - 1) {
            let startLocation = CGPointFromString(action["units"][i]["position"].string!)
            let uuid : UUID! = UUID.init(uuidString: action["units"][i]["uuid"].string!)
            let intPlayer = action["units"][i]["player"].int!
            let unitClass = action["units"][i]["class"].string!
            
            if self.currentPlayerNumber == 1 {

                if let localUnitToBeRemovedForMultiplayer = self.AllUnitsInGameScene[uuid] {
                    localUnitToBeRemovedForMultiplayer.sprite.removeFromParent()
                }
                let newUnit = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
                
                newUnit.isAutonomous = true
                newUnit.uuid = uuid
                newUnit.sprite.position = startLocation
                newUnit.positionLogical = startLocation
                newUnit.isPlayer = false
                self.hostSetOfAiUnits[newUnit.uuid] = newUnit
                
                self.appendAIUnitToGameScene(unit: newUnit)
            } else {
                let newUnit = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
                
                newUnit.isAutonomous = true
                newUnit.uuid = uuid
                newUnit.sprite.position = startLocation
                newUnit.positionLogical = startLocation
                newUnit.isPlayer = false
                
                self.hostSetOfAiUnits[newUnit.uuid] = newUnit
                
                self.appendAIUnitToGameScene(unit: newUnit)
            }
        }
    }
    
    
    
    func appendActionToGameScene(action : JSON) {
        if let unitAction = action["unit_action"].string {
            switch unitAction {
            case "walk":
                executeGameSceneEvent_WALK(action)
            case "attack":
                executeGameSceneEvent_ATTACK(action)
            case "walk_stopped":
                executeGameSceneEvent_WALK_STOP(action)
            case "damaged":
                executeGameSceneEvent_DID_TAKE_DAMAGE(action)
            case "death":
                executeGameSceneEvent_UNIT_DIED(action)
            default:
                print("oh shit...")
            }
        }
        //        alert("⚠️", "GOT WALK EVENT")
    }
    
    
    
    func convertJsonIntoAbstractUnitAndAddToGameScene(action : JSON) {
        print("GOT UNIT SPAWN EVENT!!!")
        //        alert("⚠️", "GOT UNIT SPAWN EVENT")
        
        let startLocation = CGPointFromString(action["position"].string!)
        let uuid : UUID! = UUID.init(uuidString: action["uuid"].string!)
        let intPlayer = action["player"].int!
        let unitClass = action["class"].string!

//        print("EMOJIS: | 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 |")
//        print("EMOJIS: | 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 |")
//        print("EMOJIS: | 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 |")
//        print("EMOJIS: | 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 |")
//        print("EMOJIS: | 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 |")
//        print("EMOJIS: | 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 |")
//        print("EMOJIS: | 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 |")
//        print("EMOJIS: | 🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 |")
//        print("self.currentPlayerNumber2: \(self.currentPlayerNumber2)")
//        print("intPlayer: \(intPlayer)")
//        print("self.playerIsHost2: \(self.playerIsHost2)")

        let localOfflineUnit = self.AllUnitsInGameScene[uuid]
        if intPlayer == self.currentPlayerNumber2 {
            localOfflineUnit?.sprite.removeFromParent()
            localOfflineUnit?.spriteSight.removeFromParent()
            localOfflineUnit?.spriteMovementBlocker.removeFromParent()
            localOfflineUnit?.meleeSight.removeFromParent()
            
            self.playerSK = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
            self.playerSK.isPlayer = true
            self.playerSK.isAutonomous = false
            self.playerSK.uuid = uuid
            self.playerSK.sprite.position = startLocation
            self.playerSK.nameGUI = "GUI_HOLDER"
            self.appendUnitToGameScene(self.playerSK)

            self.didFinishLoadingBlankGameScene()

        } else {
            localOfflineUnit?.sprite.removeFromParent()
            localOfflineUnit?.spriteSight.removeFromParent()
            localOfflineUnit?.spriteMovementBlocker.removeFromParent()
            localOfflineUnit?.meleeSight.removeFromParent()
            
            let newUnit = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
            newUnit.isPlayer = true
            newUnit.isAutonomous = false
            newUnit.uuid = uuid
            newUnit.sprite.position = startLocation
            self.appendUnitToGameScene(newUnit)
        }
    }


    func executeGameSceneEvent_WALK_STOP(_ json : JSON) {
        let finalDestination = CGPointFromString(json["destination"].string!)
        let unitUUID = UUID.init(uuidString: json["uuid"].string!)

        (self.AllUnitsInGameScene[unitUUID!] as! PathfinderUnit).isMoving = false
        (self.AllUnitsInGameScene[unitUUID!] as! PathfinderUnit).forceUnitPositionTo(destination: finalDestination)
    }
    
    
    func executeGameSceneEvent_WALK(_ json : JSON) {
        if let uuidString = json["uuid"].string {
            let uuidOfMovingUnit = UUID(uuidString: uuidString)
            let facingStr = json["direction"].string!

            if let uid = uuidOfMovingUnit {
                 // hostSetOfAiUnits
                let direction = unitFaceAngleConvertFrom(string: facingStr)

//                if let lastPosition = unitRef.lastPositionFromWebSocket {
//                    if lastPosition != CGPointFromString(json["current_position"].string!) {
                        if (self.AllUnitsInGameScene[uid] as! PathfinderUnit).isMoving != true {
//                            print("[GUEST]: got walk order for unit \(uid)")
                            (self.AllUnitsInGameScene[uid] as! PathfinderUnit)
                                    .OrderUnitToMoveOneStep(direction: direction, completionHandler: { finalDestination in

                            })
                        }
//                    }
//                } else {
//                    if unitRef.isMoving != true {
//                        unitRef.OrderUnitToMoveOneStep(direction: direction, completionHandler: { finalDestination in
//
//                        })
//                    }
//                }
                if let currentPosition = json["current_position"].string {
                    (self.AllUnitsInGameScene[uid] as! PathfinderUnit).lastPositionFromWebSocket = CGPointFromString(currentPosition)
                }
            }
        }
    }
    
    func executeGameSceneEvent_ATTACK(_ json : JSON) {
        let uuidOfMovingUnit = UUID(uuidString: json["uuid"].string!)
        let facingStr = json["direction"].string!
        let unitRef = self.AllUnitsInGameScene[uuidOfMovingUnit!] as! MeleeUnitNEW
        
        let direction = unitFaceAngleConvertFrom(string: facingStr)
        
        unitRef.angleFacing = direction

        unitRef.orderUnitToAttackMelee(angleFacing: direction)
        unitRef.sprite.playAttackAnimation(direction: direction, completionHandler: { _ in
            unitRef.CoolingDown = false
        })
    }


    func executeGameSceneEvent_DID_TAKE_DAMAGE(_ json : JSON) {
        print("[WEBSOCKET]: unit did take damage.")
        let victimUUID : UUID! = UUID(uuidString: json["victim_uuid"].string!)
        let attackerUUID : UUID! = UUID(uuidString: json["attacker_uuid"].string!)
        let DMG : Int = json["amount"].int!
        self.applyDamage(self.AllUnitsInGameScene[victimUUID]!, amount: DMG, fromUnit: self.AllUnitsInGameScene[attackerUUID]!)
    }


    func executeGameSceneEvent_UNIT_DIED(_ json : JSON) {
        print("[WEBSOCKET]: a unit has just died.")
        let uuid : UUID! = UUID(uuidString: json["uuid"].string!)
        self.AllUnitsInGameScene[uuid]!.killWithAnimation()
    }

    
    public func unitFaceAngleConvertFrom(string: String) -> UnitFaceAngle {
        switch string {
        case "up":
            return .up
        case "down":
            return .down
        case "left":
            return .left
        case "right":
            return .right
        case "ul":
            return .ul
        case "ur":
            return .ur
        case "dl":
            return .dl
        case "dr":
            return .dr
        default:
            return .up
        }
    }
}
