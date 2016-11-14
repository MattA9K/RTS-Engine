//
//  GameScene_Multiplayer.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
import SwiftyJSON



extension GameScene {
    
    func hostMultiplayerGame() {
        if self.socket.isConnected == true {
            var parentJsonWrapper = [JSON]()
            
            let header : JSON = ["header":"new_game"]
            parentJsonWrapper.append(header)
            
            for unit in AllUnitsInGameScene {
                let dataToSend : JSON = [
                    "UUID" : unit.value.uuid.uuidString,
                    "location_x" : unit.value.sprite.position.x,
                    "location_y" : unit.value.sprite.position.y,
                    "unitClass" : Reflection().getClassNameBasic(unit.value),
                    "player" : unit.value.teamNumber
                ];
                parentJsonWrapper.append(dataToSend)
            }
            
            let message = JSON(parentJsonWrapper).rawString()
            socket.write(string: message!)
        }
    }
    
    func connectMultiplayerGame() {
        print(self.latestDataFromWebSocket)
        let json = JSON(self.latestDataFromWebSocket)
        var hostUnits = [UUID:AbstractUnit]()
        
        if let header = json[0]["header"].string {
            if header == "new_game" {
                let loopLength = json.array!.count
                for i in 1...loopLength {
                    if let type = json[i]["type"].string {
                        let unit = GruntLvl3Unit(player: 2)
                        
                        let _x = json[i]["location_x"].double!
                        let _y = json[i]["location_y"].double!
                        unit.sprite.position = CGPoint(x: _x, y: _y)
                        unit.uuid = UUID(uuidString: json[i]["UUID"].string!)!
                        
                    }
                }
            }
        }
    }
    
    func textBoxContentDidChange(sender : UITextField) {
        if let text = sender.text {
            print("TEXT CHANGED: \(text)")
            if text == "host" {
                self.hostMultiplayerGame()
            } else if text == "join" {
                self.connectMultiplayerGame()
            }
        }
    }
    
    func displayLatestWebSocketData() {
        let alertController = UIAlertController(title: "Websocket Latest Data", message: latestDataFromWebSocket, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "DONE", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Ok Cool")
        }
        
        alertController.addAction(okAction)
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    
    func showSocketInfo() {
        let alertController = UIAlertController(
            title: "Web Socket",
            message: "Tap the red button to show latest Socket msg.",
            preferredStyle: UIAlertControllerStyle.alert)
        
        let DestructiveAction = UIAlertAction(
        title: "Get Socket Data",
        style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            print("Destructive")
            self.displayLatestWebSocketData()
        }
        
        let okAction = UIAlertAction(
        title: "DONE",
        style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Done")
        }
        
        alertController.addTextField(configurationHandler: { shit in
            shit.addTarget(self, action: #selector(self.textBoxContentDidChange), for: .allEditingEvents)
        })
        
        alertController.addAction(DestructiveAction)
        alertController.addAction(okAction)
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
        
        if self.socket.isConnected != true {
            socket.connect()
        }
    }
    
    
    func sendGameEventToSocket(event: String) {
        if self.socket.isConnected == true {
            socket.write(string: event)
        }
    }
    
    func sendGameEventToSocket(event: GameSocketEvents, unit: AbstractUnit) {
        var socketMessage = ""
        if event == .UnitWalk {
            socketMessage = generateSocketMessageForUnitWalk(unit: unit)
            if self.socket.isConnected == true && self.playerIsHost == true {
                socket.write(string: socketMessage)
            }
        } else if event == .UnitAttack {
            socketMessage = generateSocketMessageForUnitAttack(unit: unit)
            if self.socket.isConnected == true && self.playerIsHost == true {
                socket.write(string: socketMessage)
            }
        }
    }
    
    
    func generateSocketMessageForUnitAttack(unit: AbstractUnit) -> String {
        let structData = SocketEventUnitAttack(
            unitUUID: unit.uuid,
            positionOfUnit: unit.positionLogical,
            spriteName: unit.sprite.name!,
            positionOfAttack: unit.positionLogical,
            facing: unit.angleFacing
        )
//        let dataWrapper = SocketMessage(id: "\(self.gameHostEventIncrement)", type: "attack", event: structData)
        return JSON(structData.toJSON()).rawString()!
    }
    
    func generateSocketMessageForUnitWalk(unit: AbstractUnit) -> String {
        let structData = SocketEventUnitWalk(
            unitUUID: unit.uuid,
            positionOfUnit: unit.positionLogical,
            spriteName: unit.sprite.name!,
            facing: unit.angleFacing
        )
//        let dataWrapper = SocketMessage(id: "\(self.gameHostEventIncrement)", type: "walk", event: structData)
        return JSON(structData.toJSON()).rawString()!
    }
}


enum GameSocketEvents {
    case UnitWalk, UnitAttack;
}

struct SocketMessage {
    let id : String
    let type : String
    let event : SocketEvent

}

protocol SocketEvent {

}


struct SocketEventUnitWalk : SocketEvent {
    let type : String = "SocketEventUnitWalk"
    let unitUUID : UUID
    let positionOfUnit : CGPoint
    let spriteName : String
    let facing : UnitFaceAngle

    func toJSON() -> [String: String] {
        return [
            "type":type,
            "unitUUID":unitUUID.uuidString,
            "positionOfUnit":"\(positionOfUnit)",
            "spriteName":spriteName,
            "facing":facing.facingAngleString
        ]
    }
}

struct SocketEventUnitAttack : SocketEvent {
    let type : String = "SocketEventUnitAttack"
    let unitUUID : UUID
    let positionOfUnit : CGPoint
    let spriteName : String
    let positionOfAttack : CGPoint
    let facing : UnitFaceAngle

    func toJSON() -> [String: String] {
        return [
            "type":type,
            "unitUUID":unitUUID.uuidString,
            "positionOfUnit":"\(positionOfUnit)",
            "spriteName":spriteName,
            "positionOfAttack":"\(positionOfAttack)",
            "facing":facing.facingAngleString
        ]
    }
}
