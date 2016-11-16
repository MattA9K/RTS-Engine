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
            latestDataFromWebSocket = text
            passWSTextThroughTerminal(wsStr: text)
        }
        print("got some text: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: Data) {
        print("got some data: \(data.count)")
    }
    
    
    func passWSTextThroughTerminal(wsStr: String) {
        if let dataFromString = wsStr.data(using: .utf8, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            print("JSON: \(json)")

            if self.playerIsHost == false {
                if let header = json[0]["header"].string {
                    if header == "new_game" {
                        self.spawnUnitsFromSocket(json: json)
                        self.spawnUnitPlayerForHost()
                    }
                }
                if let event = json["type"].string {
                    if event == "SocketEventUnitWalk" && Int(json["player"].string!) != playerSK.teamNumber {
                        self.moveUnitCalledFromSocket(json: json)
                    }
                    else if event == "SocketEventUnitAttack" && Int(json["player"].string!) != playerSK.teamNumber {
                        self.issueAttackOrderFromSocket(json: json)
                    }
                }
            } else {
                if let event = json["type"].string {
                    if event == "UnitsForHost" {
                        appendNonHostUnits(json: json)
                    }
                    else if event == "SocketEventUnitWalk" && Int(json["player"].string!) != playerSK.teamNumber {
                        self.moveUnitCalledFromSocket(json: json)
                    }
                    else if event == "SocketEventUnitAttack" && Int(json["player"].string!) != playerSK.teamNumber {
                        self.issueAttackOrderFromSocket(json: json)
                    }
                }
            }
            
            
            
        }
    }
    
    
    /*
    func nonHostSendUnitsToSocket() {
        let json : JSON = [
            "socket_type":"non_host_join",
            "unitUUID":self.playerSK.uuid,
            "position":self.playerSK.sprite.position
        ]
        self.socket.write(string: json.rawString()!)
    }
    */
   
    func appendNonHostUnits(json: JSON) {
        let position = CGPointFromString(json["positionOfUnit"].string!)
        let uuid = UUID(uuidString: json["unitUUID"].string!)
        
        let newUnit = GruntLvl4Unit(player: json["player"].int!)
        newUnit.uuid = uuid!
        newUnit.sprite.position = position
        
        self.appendUnitToGameScene(newUnit)
    }
    
    func spawnUnitPlayerForHost() {
        
        let jsonMsg : JSON = [
            "type":"UnitsForHost",
            "positionOfUnit": "{\(self.playerSK.positionLogical.x), \(self.playerSK.positionLogical.y)}",
            "unitUUID":"\(self.playerSK.uuid.uuidString)",
            "player":self.playerSK.teamNumber
        ]
        
        self.socket.write(string: jsonMsg.rawString()!)
    }
    
    func spawnUnitsFromSocket(json: JSON) {
        let totalUnits = json.array!.count - 1
        
        for i in 1...json.array!.count {
            if let uuid = json[i]["UUID"].string {
                let u1 = GruntLvl3Unit(player: json[i]["player"].int!)
                u1.uuid = UUID(uuidString: uuid)!
                
                print("UUID of multiplayer unit: \(u1.uuid)")
                print("JSON OF UNIT \(i): \(json[i])")
                print("X: \(json[i]["location_x"].int!)")
                print("Y: \(json[i]["location_y"].int!)")
                
                
                let position = CGPoint(x:json[i]["location_x"].int!, y:json[i]["location_y"].int!)
                u1.sprite.position = position
                
//                if json[i]["player"].int! != self.playerSK.teamNumber {
                self.appendUnitToGameScene(u1)
//                }
            }
        }
        
        self.generateAlertForDebug(
            title: "SOCKET ALERT",
            body: "generated: \(totalUnits) total units from the websocket!")
    }
    
    func moveUnitCalledFromSocket(json: JSON) {
        let uuidOfMovingUnit = UUID(uuidString: json["unitUUID"].string!)
        let facing = json["facing"].string!
        print("UUID of unit with socket order: \(json["unitUUID"].string!)")
        print(self.AllUnitsInGameScene.keys)
        let unitRef = self.AllUnitsInGameScene[uuidOfMovingUnit!] as! PathfinderUnit
        
//        let destination = CGPointFromString(json["positionOfUnit"].string!)
        
        print("MOVE UNIT CALLED FROM SOCKET!!")
        
        switch facing {
        case "up":
            unitRef.OrderUnitToMoveOneStep(direction: .up, completionHandler: { finalDestination in
            })
        case "down":
            print("")
            unitRef.OrderUnitToMoveOneStep(direction: .down, completionHandler: { finalDestination in
            })
        case "left":
            print("")
            unitRef.OrderUnitToMoveOneStep(direction: .left, completionHandler: { finalDestination in
            })
        case "right":
            print("")
            unitRef.OrderUnitToMoveOneStep(direction: .right, completionHandler: { finalDestination in
            })
        case "ul":
            print("")
            unitRef.OrderUnitToMoveOneStep(direction: .ul, completionHandler: { finalDestination in
            })
        case "ur":
            print("")
            unitRef.OrderUnitToMoveOneStep(direction: .ur, completionHandler: { finalDestination in
            })
        case "dl":
            print("")
            unitRef.OrderUnitToMoveOneStep(direction: .dl, completionHandler: { finalDestination in
            })
        case "dr":
            print()
            unitRef.OrderUnitToMoveOneStep(direction: .dr, completionHandler: { finalDestination in
            })
        default:
            print("socket error!")
        }
    }
    
    func issueAttackOrderFromSocket(json: JSON) {
        let uuidOfAttackingUnit = UUID(uuidString: json["unitUUID"].string!)
        let facing = json["facing"].string!
        let unitRef = self.AllUnitsInGameScene[uuidOfAttackingUnit!] as! MeleeUnitNEW
        
        
            switch facing {
            case "up":
                unitRef.sprite.playFaceUpAnimation()
                unitRef.OrderUnitToAttackMeleeUP()
                print()
            case "down":
                unitRef.sprite.playFaceDownAnimation()
                unitRef.OrderUnitToAttackMeleeDOWN()
                print()
            case "left":
                unitRef.sprite.playFaceLeftAnimation()
                unitRef.OrderUnitToAttackMeleeLEFT()
                print()
            case "right":
                unitRef.sprite.playFaceRightAnimation()
                unitRef.OrderUnitToAttackMeleeRIGHT()
                print()
            case "ul":
                unitRef.sprite.playFaceULAnimation()
                unitRef.OrderUnitToAttackMeleeUPLEFT()
                print()
            case "ur":
                unitRef.sprite.playFaceURAnimation()
                unitRef.OrderUnitToAttackMeleeUPRIGHT()
                print()
            case "dl":
                unitRef.sprite.playFaceDLAnimation()
                unitRef.OrderUnitToAttackMeleeDOWNLEFT()
                print()
            case "dr":
                unitRef.sprite.playFaceDRAnimation()
                unitRef.OrderUnitToAttackMeleeDOWNRIGHT()
                print()
            default:
                print()
            }
        
    }
    
    func wsDidGetNewHostedGameAlert() {
        generateAlertForDebug(
            title: "Success",
            body: "Got a websocket message related to joining a multiplayer game!"
        )
    }
    
    func generateAlertForDebug(title: String, body: String) {
        let alertController = UIAlertController(
            title: title,
            message: body,
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        let okAction = UIAlertAction(title: "DONE", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Ok Cool")
        }
        
        alertController.addAction(okAction)
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    
    func generateUnitDebug() {
        let alertController = UIAlertController(
            title: "Spawn Unit",
            message: "Simple alertView demo with Destructive and Ok.",
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        let DestructiveAction = UIAlertAction(title: "Generate New Unit", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            print("Destructive")
            
            let spawnLocation1 = CGPoint(x:600, y:550)
            let spawnLocation2 = CGPoint(x:600, y:500)
            let spawnLocation3 = CGPoint(x:550, y:500)
            
            let u1 = GruntLvl4Unit(player: 2)
            u1.sprite.position = spawnLocation1
//            debugAllUnitGUIDs.append(u1.uuid)
            
//            let u2 = GruntLvl3Unit(player: 2)
//            u2.sprite.position = spawnLocation2
//            debugAllUnitGUIDs.append(u2.uuid)
            
//            let u3 = GruntLvl3Unit(player: 2)
//            u3.sprite.position = spawnLocation3
//            debugAllUnitGUIDs.append(u3.uuid)
            
            
            self.appendUnitToGameScene(u1)
//            self.appendUnitToGameScene(u2)
//            self.appendUnitToGameScene(u3)
        }
        
        let okAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Done")
        }
        
//        alertController.addTextField(configurationHandler: { shit in
//            shit.addTarget(self, action: #selector(self.textBoxContentDidChange), for: .allEditingEvents)
//        })
        
        alertController.addAction(okAction)
        
        alertController.addAction(DestructiveAction)
        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
        
    }
    
    func showActionDebugAlert() {
        let alertController = UIAlertController(
            title: "Select Debug Action",
            message: "pick any action",
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        let connectToSocket = UIAlertAction(
        title: "Connect To Socket",
        style: UIAlertActionStyle.destructive)
        { (result : UIAlertAction) -> Void in
            self.connectGameSceneToWebSocket()
        }
        
        let hostMultiplayer = UIAlertAction(
        title: "Host Multiplayer Game",
        style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
            self.hostMultiplayerGame()
        }
        
        let sendDebugPingToSocket = UIAlertAction(
            title: "Send Debug Ping To Socket",
            style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
            self.sendTestDebugPingToSocket()
        }
        
        let joinMultiplayer = UIAlertAction(
            title: "Join Multiplayer Game",
            style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
            self.showSocketInfo()
        }
        
        let sendJsonToSocket = UIAlertAction(
            title: "Send Dummy JSON To Socket",
            style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
            self.sendJsonToSocket()
        }
        
        let generateUnitDebug = UIAlertAction(
            title: "Spawn Debug Unit",
            style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
            self.generateUnitDebug()
        }
        
        
        let enableHost = UIAlertAction(
            title: "Make Yourself Host",
            style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
            self.playerIsHost = true
        }
        
        let disableHost = UIAlertAction(
            title: "Stop Hosting Game",
            style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
            self.playerIsHost = false
        }
        
        let activateAI = UIAlertAction(
            title: "Activate AI",
            style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
            self.activateTimers()
        }
        
        let makeSelfPlayer5 = UIAlertAction(
            title: "Make Yourself Player 5",
            style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
            self.playerSK.teamNumber = 5
        }
        
        let cancelDialog = UIAlertAction(
            title: "Cancel",
            style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
        }
        
        alertController.addAction(connectToSocket)
        alertController.addAction(hostMultiplayer)
        
        alertController.addAction(sendDebugPingToSocket)
        alertController.addAction(joinMultiplayer)
        
        alertController.addAction(sendJsonToSocket)
        alertController.addAction(generateUnitDebug)
        
        alertController.addAction(activateAI)
        
        if self.playerSK.teamNumber != 5 {
            alertController.addAction(makeSelfPlayer5)
        }
        
        if self.playerIsHost == true {
            alertController.addAction(disableHost)
        } else {
            alertController.addAction(enableHost)
        }
        
        
        alertController.addAction(cancelDialog)
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
        
    }
    
    func sendJsonToSocket() {
        let array = ["key":"value", "hmmm":"yes?"]
        let json = JSON(array)
        self.socket.write(string: json.rawString()!)
    }
}
