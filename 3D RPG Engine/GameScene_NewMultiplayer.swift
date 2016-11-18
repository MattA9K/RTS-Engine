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
        
        alertController.addAction(connectNow)
        alertController.addAction(broadCastHeroAction)
        alertController.addAction(changePlayerAction)
        alertController.addAction(cancelAction)
        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
        
        
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
            "type":"BROADCAST_UNIT",
            "uuid":self.playerSK.uuid.uuidString,
            "position": "{\(self.playerSK.sprite.position.x), \(self.playerSK.sprite.position.y)}",
            "class":"GruntLvl4Unit",
            "player":self.playerSK.teamNumber
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
                
                switch type {
                case "SOCKET_MULTIPLAYER_EVENT":
                    appendActionToGameScene(action: json)
                case "SPAWN_UNIT":
                    appendUnitToGameScene(action: json)
                case "BROADCAST_UNIT":
                    appendUnitToGameScene(action: json)
                default:
                    print("WARNING - Method not yet implemented.")
                }
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
        let newUnit = GruntLvl3Unit(player: intPlayer)
        
        newUnit.uuid = uuid
        newUnit.sprite.position = startLocation
        self.appendUnitToGameScene(newUnit)
    }
    
    func executeGameSceneEvent_WALK(_ json : JSON) {
        let uuidOfMovingUnit = UUID(uuidString: json["uuid"].string!)
        let facing = json["direction"].string!
        let unitRef = self.AllUnitsInGameScene[uuidOfMovingUnit!] as! PathfinderUnit
        
        switch facing {
        case "up":
            unitRef.OrderUnitToMoveOneStep(direction: .up, completionHandler: { finalDestination in
            })
        case "down":
            unitRef.OrderUnitToMoveOneStep(direction: .down, completionHandler: { finalDestination in
            })
        case "left":
            unitRef.OrderUnitToMoveOneStep(direction: .left, completionHandler: { finalDestination in
            })
        case "right":
            unitRef.OrderUnitToMoveOneStep(direction: .right, completionHandler: { finalDestination in
            })
        case "ul":
            unitRef.OrderUnitToMoveOneStep(direction: .ul, completionHandler: { finalDestination in
            })
        case "ur":
            unitRef.OrderUnitToMoveOneStep(direction: .ur, completionHandler: { finalDestination in
            })
        case "dl":
            unitRef.OrderUnitToMoveOneStep(direction: .dl, completionHandler: { finalDestination in
            })
        case "dr":
            unitRef.OrderUnitToMoveOneStep(direction: .dr, completionHandler: { finalDestination in
            })
        default:
            print("socket error!")
        }
    }
    
    func executeGameSceneEvent_ATTACK(_ json : JSON) {
        let uuidOfMovingUnit = UUID(uuidString: json["uuid"].string!)
        let facing = json["direction"].string!
        let unitRef = self.AllUnitsInGameScene[uuidOfMovingUnit!] as! MeleeUnitNEW
        
        switch facing {
        case "up":
            unitRef.sprite.playFaceAnimation(direction: .up)
            unitRef.orderUnitToAttackMelee(angleFacing: .up)
        case "down":
            unitRef.sprite.playFaceAnimation(direction: .down)
            unitRef.orderUnitToAttackMelee(angleFacing: .down)
        case "left":
            unitRef.sprite.playFaceAnimation(direction: .left)
            unitRef.orderUnitToAttackMelee(angleFacing: .left)
        case "right":
            unitRef.sprite.playFaceAnimation(direction: .right)
            unitRef.orderUnitToAttackMelee(angleFacing: .right)
        case "ul":
            unitRef.sprite.playFaceAnimation(direction: .ul)
            unitRef.orderUnitToAttackMelee(angleFacing: .ul)
        case "ur":
            unitRef.sprite.playFaceAnimation(direction: .ur)
            unitRef.orderUnitToAttackMelee(angleFacing: .ur)
        case "dl":
            unitRef.sprite.playFaceAnimation(direction: .dl)
            unitRef.orderUnitToAttackMelee(angleFacing: .dl)
        case "dr":
            unitRef.sprite.playFaceAnimation(direction: .dr)
            unitRef.orderUnitToAttackMelee(angleFacing: .dr)
        default:
            print()
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
