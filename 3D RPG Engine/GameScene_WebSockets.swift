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
    }
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        
        if text != "--heartbeat--" {
//            print(text)
            
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
                print("❤️")
                
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
                default:
                    print("WARNING - Method not yet implemented.")
                }
            }
        }
    }
    
    func appendManyUnitsAIToGameScene(action: JSON) {
        alert("⚠️", "GOT ARTIFICIAL INTELLIGENCE UNIT SPAWN EVENT")
        
        for i in 0...(action["units"].arrayValue.count - 1) {
            let startLocation = CGPointFromString(action["units"][i]["position"].string!)
            let uuid : UUID! = UUID.init(uuidString: action["units"][i]["uuid"].string!)
            let intPlayer = action["units"][i]["player"].int!
            let unitClass = action["units"][i]["class"].string!
            
            if self.currentPlayerNumber == 1 {
                //                self.AllUnitsInGameScene[uuid] = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
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
        
        let localOfflineUnit = self.AllUnitsInGameScene[uuid]
        
        if intPlayer == self.currentPlayerNumber {
            localOfflineUnit?.sprite.removeFromParent()
            localOfflineUnit?.spriteSight.removeFromParent()
            localOfflineUnit?.spriteMovementBlocker.removeFromParent()
            localOfflineUnit?.meleeSight.removeFromParent()
            
            self.playerSK = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
            self.playerSK.isPlayer = true
            self.playerSK.isAutonomous = false
            self.playerSK.uuid = uuid
            self.playerSK.sprite.position = startLocation
            self.appendUnitToGameScene(self.playerSK)
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
        
        PathsBlocked[String(describing: unitToAppend.sprite.position)] = true
        
        self.AllUnitsInGameScene[unitToAppend.uuid] = unitToAppend
        self.AllUnitGUIDs.append(unitToAppend.uuid)
    }
    
    func appendAIUnitToGameScene(unit : AbstractUnit) {
        print("GOT UNIT SPAWN EVENT!!!")
        //        alert("⚠️", "GOT UNIT SPAWN EVENT")
        print("[isAutonomous]: \(unit.isAutonomous)")
        
        let classname = String(describing: Mirror(reflecting: unit).subjectType)
        
        if self.playerSK.teamNumber == 1 {
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
        
        PathsBlocked[String(describing: unit.sprite.position)] = true
        
        if unit.teamNumber == 1 {
            unit.sprite.run(SKAction.colorize(with: .red, colorBlendFactor: 0.9, duration: 1))
        }
        
        self.AllUnitsInGameScene[unit.uuid] = unit
        self.AllUnitGUIDs.append(unit.uuid)
    }
    
    
    
    func executeGameSceneEvent_WALK(_ json : JSON) {
        if let uuidString = json["uuid"].string {
            let uuidOfMovingUnit = UUID(uuidString: uuidString)
            let facingStr = json["direction"].string!
            print("[HOST SET OF AI UNITS]: \n \(self.hostSetOfAiUnits)")
            if let uuidUnwrapped = uuidOfMovingUnit {
                let unitRef = self.AllUnitsInGameScene[uuidUnwrapped] as! PathfinderUnit // hostSetOfAiUnits
                let direction = unitFaceAngleConvertFrom(string: facingStr)
                if let lastPosition = unitRef.lastPositionFromWebSocket {
                    if lastPosition != CGPointFromString(json["current_position"].string!) {
                        if unitRef.isMoving != true {
                            unitRef.OrderUnitToMoveOneStep(direction: direction, completionHandler: { finalDestination in
                                print("🔶🔶🔶 Unit AI did get move command!!! 🔶🔶🔶")
                            })
                        }
                    }
                } else {
                    if unitRef.isMoving != true {
                        unitRef.OrderUnitToMoveOneStep(direction: direction, completionHandler: { finalDestination in
                            print("🔶🔶🔶 Unit AI did get move command!!! 🔶🔶🔶")
                        })
                    }
                }
                if let currentPosition = json["current_position"].string {
                    unitRef.lastPositionFromWebSocket = CGPointFromString(currentPosition)
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
        
        //        if self.currentPlayerNumber != unitRef.teamNumber {
        unitRef.orderUnitToAttackMelee(angleFacing: direction)
        unitRef.sprite.playAttackAnimation(direction: direction, completionHandler: { _ in
            unitRef.CoolingDown = false
        })
        //        }
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
