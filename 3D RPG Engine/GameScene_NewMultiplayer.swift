//
//  GameScene_NewMultiplayer.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/17/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import Starscream
import SwiftyJSON



extension GameScene {
    
    func debugNewMultiplayer() {
        
        var connectionStatus = ""
        let clientInfo = "You're Player \(playerSK.teamNumber)"
        
        if socket.isConnected != true {
            connectionStatus = "Offline"
        } else {
            connectionStatus = "Online"
        }
        
        let alertController = UIAlertController(
            title: connectionStatus,
            message: clientInfo,
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        let cancelAction = UIAlertAction(
        title: "Cancel",
        style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            print("Ok Cool")
        }
        
        
        let broadCastHeroAction = UIAlertAction(
            title: "📡➡️🌎 Broadcast Hero",
            style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("Ok Cool")
                self.broadcastPlayerToGameScene()
        }
        
        let changePlayerAction = UIAlertAction(
            title: "Change Player Number",
            style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("Ok Cool")
                self.presentChangePlayerAlertController()
        }
        
        var txtConnectBtn = "Connect"
        if socket.isConnected == true {
            txtConnectBtn = "Disconnect"
        }
        
        let connectNow = UIAlertAction(
            title: txtConnectBtn,
            style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                self.toggleSocketConnection()
        }
        
        let fireUpSinglePlayerMacro = UIAlertAction(
            title: "Single Player AI Game",
            style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                self.presetSinglePlayerAI()
        }
        
        alertController.addAction(connectNow)
        alertController.addAction(broadCastHeroAction)
        alertController.addAction(changePlayerAction)
        alertController.addAction(cancelAction)
        alertController.addAction(fireUpSinglePlayerMacro)
        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    
    func presetSinglePlayerAI() {
        generateUnitsBasic()
        self.activateTimers()
        socket.connect()
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async {
                self.socket.write(string: "Creating new LAN game, single player with AI.")
                self.socket.delegate = self
            }
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async {
                self.broadcastPlayerToGameScene()
            }
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async {
                self.broadcastAIUnitsToGameScene()
            }
        }
    }
    
    
    func toggleSocketConnection() {
        if socket.isConnected == true {
            socket.disconnect()
        } else {
            socket.connect()
            socket.delegate = self
        }
    }
    
    func broadcastPlayerHeroMovementToGameScene(_ direction: UnitFaceAngle) {
        let broadcastMessage : JSON = [
            "id":self.totalSocketMessages,
            "type":"SOCKET_MULTIPLAYER_EVENT",
            "uuid":self.playerSK.uuid.uuidString,
            "player":self.playerSK.teamNumber,
            "sent_by_host":false,
            "direction":self.playerSK.angleFacing.facingAngleString,
            "unit_action":"walk"
        ]
        socket.write(string: broadcastMessage.rawString()!)
    }
    
    func broadcastPlayerHeroAttackToGameScene(_ direction: UnitFaceAngle) {
        let broadcastMessage : JSON = [
            "id":self.totalSocketMessages,
            "type":"SOCKET_MULTIPLAYER_EVENT",
            "uuid":self.playerSK.uuid.uuidString,
            "player":self.playerSK.teamNumber,
            "sent_by_host":false,
            "direction":self.playerSK.angleFacing.facingAngleString,
            "unit_action":"attack"
        ]
        socket.write(string: broadcastMessage.rawString()!)
    }
    
    func broadcastPlayerToGameScene() {
        let broadcastMessage : JSON = [
            "id":self.totalSocketMessages,
            "type":"BROADCAST_UNIT",
            "uuid":self.playerSK.uuid.uuidString,
            "position": "{\(self.playerSK.sprite.position.x), \(self.playerSK.sprite.position.y)}",
            "class":"\(Mirror(reflecting: self.playerSK).subjectType)",
            "player":self.playerSK.teamNumber
        ]
        socket.write(string: broadcastMessage.rawString()!)
    }
    
    func broadcastAIUnitsToGameScene() {
        var arrayOfUnits = [JSON]()
        for unit in AllUnitsInGameScene {
            if unit.value.teamNumber != self.playerSK.teamNumber {
                let broadcastMessage : JSON = [
                    "id":self.totalSocketMessages,
                    "type":"BROADCAST_UNIT",
                    "uuid":unit.value.uuid.uuidString,
                    "position": "{\(unit.value.sprite.position.x), \(unit.value.sprite.position.y)}",
                    "class":"\(Mirror(reflecting: unit.value).subjectType)",
                    "player":unit.value.teamNumber
                ]
                arrayOfUnits.append(broadcastMessage)
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
        let broadcastMessage : JSON = [
            "id":self.totalSocketMessages,
            "type":"SOCKET_MULTIPLAYER_EVENT",
            "uuid":unit.uuid.uuidString,
            "player":unit.teamNumber,
            "sent_by_host":false,
            "direction":direction.facingAngleString,
            "unit_action":"walk",
            "current_position":"{\(unit.sprite.position.x), \(unit.sprite.position.y)}",
        ]
        socket.write(string: broadcastMessage.rawString()!)
    }
    
    func broadcastUnitAIAttackToGameScene(_ unit: AbstractUnit, _ direction: UnitFaceAngle) {
        let broadcastMessage : JSON = [
            "id":self.totalSocketMessages,
            "type":"SOCKET_MULTIPLAYER_EVENT",
            "uuid":self.playerSK.uuid.uuidString,
            "player":unit.teamNumber,
            "sent_by_host":false,
            "direction":direction.facingAngleString,
            "unit_action":"attack",
            "current_position":"{\(unit.sprite.position.x), \(unit.sprite.position.y)}",
        ]
        socket.write(string: broadcastMessage.rawString()!)
    }
}




extension GameScene {
    func socketTerminal(_ rawJson: String) {
        if let dataFromString = rawJson.data(using: .utf8, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            if let type = json["type"].string {
                print("❤️")
                
                self.totalSocketMessages += 1
                switch type {
                case "SOCKET_MULTIPLAYER_EVENT":
                    appendActionToGameScene(action: json)
                case "SPAWN_UNIT":
                    appendUnitToGameScene(action: json)
                case "BROADCAST_UNIT":
                    appendUnitToGameScene(action: json)
                case "BROADCAST_AI_UNITS":
                    appendManyUnitsAIToGameScene(action: json)
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
                self.AllUnitsInGameScene[uuid]!.sprite.removeFromParent()
                let newUnit = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
                
                newUnit.isAutonomous = true
                newUnit.uuid = uuid
                newUnit.sprite.position = startLocation
                
                self.appendAIUnitToGameScene(unit: newUnit)
            } else {
                let newUnit = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
                
                newUnit.isAutonomous = true
                newUnit.uuid = uuid
                newUnit.sprite.position = startLocation
                
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
    
    func appendUnitToGameScene(action : JSON) {
        print("GOT UNIT SPAWN EVENT!!!")
        alert("⚠️", "GOT UNIT SPAWN EVENT")
        
        let startLocation = CGPointFromString(action["position"].string!)
        let uuid : UUID! = UUID.init(uuidString: action["uuid"].string!)
        let intPlayer = action["player"].int!
        let unitClass = action["class"].string!
        
        let localOfflineUnit = self.AllUnitsInGameScene[uuid]
        
        if intPlayer == self.currentPlayerNumber {
            localOfflineUnit?.sprite.removeFromParent()
            self.playerSK = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
            self.playerSK.isPlayer = true
            self.playerSK.isAutonomous = false
            self.playerSK.uuid = uuid
            self.playerSK.sprite.position = startLocation
            self.appendUnitToGameScene(self.playerSK)
        } else {
            let newUnit = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
            newUnit.isPlayer = true
            newUnit.isAutonomous = false
            newUnit.uuid = uuid
            newUnit.sprite.position = startLocation
            self.appendUnitToGameScene(newUnit)
        }
    }
    
    func appendAIUnitToGameScene(unit : AbstractUnit) {
        print("GOT UNIT SPAWN EVENT!!!")
        alert("⚠️", "GOT UNIT SPAWN EVENT")
        self.appendUnitToGameScene(unit)
    }
    
    
    
    
    
    func executeGameSceneEvent_WALK(_ json : JSON) {
        let uuidOfMovingUnit = UUID(uuidString: json["uuid"].string!)
        let facingStr = json["direction"].string!
        let unitRef = self.AllUnitsInGameScene[uuidOfMovingUnit!] as! PathfinderUnit
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
    
    func executeGameSceneEvent_ATTACK(_ json : JSON) {
        let uuidOfMovingUnit = UUID(uuidString: json["uuid"].string!)
        let facingStr = json["direction"].string!
        let unitRef = self.AllUnitsInGameScene[uuidOfMovingUnit!] as! MeleeUnitNEW
        
        let direction = unitFaceAngleConvertFrom(string: facingStr)
        
        unitRef.angleFacing = direction
//        unitRef.orderUnitToAttackMelee(angleFacing: direction)
//        unitRef.sprite.playAttackAnimation(direction: direction, completionHandler: { _ in
//            unitRef.CoolingDown = false
//        })
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



extension GameScene {
    func alert(_ title: String, _ body: String) {
        let alertController = UIAlertController(
            title: title,
            message: body,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let okAction = UIAlertAction(
            title: "DONE",
            style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                print("Ok Cool")
        }
        alertController.addAction(okAction)
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    
    func alert(_ title: String) {
        let alertController = UIAlertController(
            title: title,
            message: "",
            preferredStyle: UIAlertControllerStyle.alert
        )
        let okAction = UIAlertAction(
            title: "DONE",
            style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                print("Ok Cool")
        }
        alertController.addAction(okAction)
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    
    func presentChangePlayerAlertController() {
        print("The fuck dude...")
        let alertController = UIAlertController(
            title: "Change Player",
            message: "Enter the player number you'd like to be.",
            preferredStyle: UIAlertControllerStyle.alert
        )
        let okAction = UIAlertAction(
            title: "Submit",
            style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
                print("Ok Cool")
                self.playerSK.teamNumber = Int(self.playerNumberInput)!
                self.currentPlayerNumber = Int(self.playerNumberInput)!
        }
        
        alertController.addTextField(configurationHandler: { shit in
            shit.placeholder = "Player Number (Int)"
            shit.addTarget(self, action: #selector(GameScene.textBoxContentDidChangeForPlayerNumber), for: .allEditingEvents)
        })
        alertController.addAction(okAction)
//        alertController.addAction(cancelAction)
        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    
    func textBoxContentDidChangeForPlayerNumber(sender: UITextField) {
        if let text = sender.text {
            playerNumberInput = text
        }
    }
}
