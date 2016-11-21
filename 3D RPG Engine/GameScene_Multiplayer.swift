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
    func getNewUnitInstanceUsing(string: String, playerNumber: Int) -> AbstractUnit {
        if string == "FootmanUnit" {
            return FootmanUnit(player: playerNumber)
        }
        else if string == "HeroFootmanUnit" {
            return HeroFootmanUnit(player: playerNumber)
        }
        else if string == "GruntEliteUnit" {
            return GruntEliteUnit(player: playerNumber)
        }
        else if string == "GruntRecruitUnit" {
            return GruntRecruitUnit(player: playerNumber)
        }
        else if string == "SpearThrowerUnit" {
            return SpearThrowerUnit(player: playerNumber)
        }
        else if string == "SpearThrowerEliteUnit" {
            return SpearThrowerEliteUnit(player: playerNumber)
        }
        else if string == "SpearThrowerSuperUnit" {
            return SpearThrowerSuperUnit(player: playerNumber)
        }
        else if string == "GruntMarineUnit" {
            return GruntMarineUnit(player: playerNumber)
        }
        else if string == "GruntLvl3Unit" {
            return GruntLvl3Unit(player: playerNumber)
        }
        else if string == "GruntLvl4Unit" {
            return GruntLvl4Unit(player: playerNumber)
        }
        else if string == "BalrogUnit" {
            return BalrogUnit(player: playerNumber)
        }
        else {
            return GruntRecruitUnit(player: playerNumber)
        }
    }
}

/*
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
                        let unit = GruntLvl4Unit(player: 2)
                        
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
    
    
    func sendGameEventToSocket(event: String) {
        if self.socket.isConnected == true {
            socket.write(string: event)
        }
    }
    
    func sendGameEventToSocket(event: GameSocketEvents, unit: AbstractUnit) {
        var socketMessage = ""
        if self.playerIsHost == true {
            if event == .UnitWalk {
                socketMessage = generateSocketMessageForUnitWalk(unit: unit)
                if self.socket.isConnected == true {
                    socket.write(string: socketMessage)
                }
            } else if event == .UnitAttack {
                socketMessage = generateSocketMessageForUnitAttack(unit: unit)
                if self.socket.isConnected == true {
                    socket.write(string: socketMessage)
                }
            }
        } else if unit.teamNumber == playerSK.teamNumber {
            if event == .UnitWalk {
                socketMessage = generateSocketMessageForUnitWalk(unit: unit)
                if self.socket.isConnected == true {
                    socket.write(string: socketMessage)
                }
            } else if event == .UnitAttack {
                socketMessage = generateSocketMessageForUnitAttack(unit: unit)
                if self.socket.isConnected == true {
                    socket.write(string: socketMessage)
                }
            }
        }

    }
    
    
    func generateSocketMessageForUnitAttack(unit: AbstractUnit) -> String {
        let structData = SocketEventUnitAttack(
            unitUUID: unit.uuid,
            positionOfUnit: unit.positionLogical,
            spriteName: unit.sprite.name!,
            positionOfAttack: unit.positionLogical,
            facing: unit.angleFacing,
            player: unit.teamNumber
        )
//        let dataWrapper = SocketMessage(id: "\(self.gameHostEventIncrement)", type: "attack", event: structData)
        return JSON(structData.toJSON()).rawString()!
    }
    
    func generateSocketMessageForUnitWalk(unit: AbstractUnit) -> String {
        let structData = SocketEventUnitWalk(
            unitUUID: unit.uuid,
            positionOfUnit: unit.positionLogical,
            spriteName: unit.sprite.name!,
            facing: unit.angleFacing,
            player: unit.teamNumber,
            isHost: self.playerIsHost
        )
//        let dataWrapper = SocketMessage(id: "\(self.gameHostEventIncrement)", type: "walk", event: structData)
        return JSON(structData.toJSON()).rawString()!
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
    let player : Int
    let isHost : Bool

    func toJSON() -> [String: String] {
        return [
            "type":type,
            "unitUUID":unitUUID.uuidString,
            "positionOfUnit":"\(positionOfUnit)",
            "spriteName":spriteName,
            "facing":facing.facingAngleString,
            "player":"\(player)",
            "isHost":"\(isHost)"
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
    let player : Int

    func toJSON() -> [String: String] {
        return [
            "type":type,
            "unitUUID":unitUUID.uuidString,
            "positionOfUnit":"\(positionOfUnit)",
            "spriteName":spriteName,
            "positionOfAttack":"\(positionOfAttack)",
            "facing":facing.facingAngleString,
            "player":"\(player)"
        ]
    }
}
*/
