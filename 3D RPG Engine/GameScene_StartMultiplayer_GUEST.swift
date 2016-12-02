//
// Created by Mateusz Andrzejczuk on 11/28/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
import SwiftyJSON
import Alamofire
import Starscream









extension GameScene {


    func initGameMapAsGuest(_ gameName: String) {
        self.multiplayerGameSocketId = gameName

//        self.socket.connect()
//        self.socket.onConnect = {

//            self.socket.write(string: "GUEST IS LOADING GAME SCENE!", completion: {

                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.socket.delegate = self
                    self.downloadMapDataFromHost()

                }

                /*
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {

                }

                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
                    self.postUnitsToAPI({ transmissionWasSuccessful in

                        let json : JSON = [
                                "type":"GAME_HAS_STARTED"
                        ]
                        (self.viewControllerRef as! HostGameViewController).socket.write(
                                string: json.rawString()!,
                                completion: {_ in
                                    self.hostDidFinishPOSTUnitsToAPI()
                                })
                    })
                    //self.broadcastAIUnitsToGameScene({ _ in
                    //})
                }
                */
//            })

//        }

    }


    func downloadMapDataFromHost() {

        let url = URL(string: "http://10.1.10.25:8888/get_map_data_as_guest/?game_name=\(multiplayerGameSocketId)")!
        print("HOST GET MAP DATA REQUEST: \(url)")
        Alamofire.request(url).responseJSON { response in
            if let value = response.result.value {
                let json : JSON = JSON(value)
                let unitsJSON = json["results"]["data"]["units"]
                print("HOST DID FINISH GET AI UNITS TO API: \n \(unitsJSON)")
                self.appendManyUnitsAIToGameScene_Guest(action: unitsJSON)
            }
        }
    }


    func connectToSocketAsGuest(_ didConnect: @escaping (Bool?) -> ()) -> () {
        print("CONNECTING TO GAME SCENE SOCKET AS GUEST: \(self.socket.currentURL)")
        socket.connect()
        socket.onConnect = {
            let teamNum = Int(arc4random_uniform(100) + 5)
//        self.currentPlayerNumber = teamNum
//        self.playerSK.teamNumber = teamNum
            DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
                Thread.sleep(forTimeInterval: 1.0)
                DispatchQueue.main.async {
//                    self.socket.write(string: "Someone entered Multiplayer mode, with AI.")
                    self.socket.delegate = self
                    self.broadcastPlayerToGameSceneAsGuest()
                    didConnect(true)
                }
//            Thread.sleep(forTimeInterval: 1.0)
//            DispatchQueue.main.async {

//            }
            }
        }
    }

    func broadcastPlayerToGameSceneAsGuest() {
        let strUUID : String = UUID().uuidString
        let sLoc : CGPoint = CGPoint(x:600,y:350)
        let broadcastMessage : JSON = [
                "id":self.totalSocketMessages,
                "type":"BROADCAST_UNIT",
                "uuid":strUUID,
                "sent_by_host":(currentPlayerNumber2 == 1),
                "position": "{\(sLoc.x), \(sLoc.y)}",
                "class":"HeroFootmanUnit",
                "player":currentPlayerNumber2
        ]
        socket.write(string: broadcastMessage.rawString()!)
    }

    func printGuestUnitsInGameScene() {
        for dict in AllUnitsInGameScene {
            printg("Unit UUID: \(dict.key)")
        }
    }

    func printg(_ val: Any) {
        print("[GUEST]: \(val)")
    }

    func joinGame() {
        Thread.sleep(forTimeInterval: 1.0)
        DispatchQueue.main.async {
            self.broadcastPlayerToGameScene()
        }
    }

    func appendManyUnitsAIToGameScene_Guest(action: JSON) {
        alert("⚠️", "GOT ARTIFICIAL INTELLIGENCE UNIT SPAWN EVENT")

//        if self.playerSK.teamNumber == 1 {
//            self.playerSK.sprite.name = "HUMAN_PLAYER"
//        } else {
//            self.playerSK.sprite.name = ""
//        }

        for i in 0...(action.arrayValue.count - 1) {
            let startLocation = CGPointFromString(action[i]["position"].string!)
            let uuid : UUID! = UUID.init(uuidString: action[i]["uuid"].string!)
            let intPlayer = action[i]["player"].int!
            let unitClass = action[i]["class"].string!

//            if self.currentPlayerNumber == 1 {
//
//                if let localUnitToBeRemovedForMultiplayer = self.AllUnitsInGameScene[uuid] {
//                    localUnitToBeRemovedForMultiplayer.sprite.removeFromParent()
//                }
//                let newUnit = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)
//
//                newUnit.isAutonomous = true
//                newUnit.uuid = uuid
//                newUnit.sprite.position = startLocation
//                newUnit.positionLogical = startLocation
//                newUnit.isPlayer = false
//                self.hostSetOfAiUnits[newUnit.uuid] = newUnit
//
//                self.appendAIUnitToGameScene(unit: newUnit)
//            } else {
                let newUnit = getNewUnitInstanceUsing(string: unitClass, playerNumber: intPlayer)

                newUnit.isAutonomous = true
                newUnit.uuid = uuid
                newUnit.sprite.position = startLocation
                newUnit.positionLogical = startLocation
                newUnit.isPlayer = false

                self.hostSetOfAiUnits[newUnit.uuid] = newUnit

                self.appendAIUnitToGameScene_Guest(unit: newUnit)
//            }
        }

        print("Guest will connect in 1.5 seconds...")

        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            Thread.sleep(forTimeInterval: 1.5)
            DispatchQueue.main.async {
                self.connectToSocketAsGuest({ connected in

                })
            }
        }
    }


    func appendAIUnitToGameScene_Guest(unit : AbstractUnit) {
        alert("⚠️", "Game joined as guest was successful!")

        let classname = String(describing: Mirror(reflecting: unit).subjectType)

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

        let point : CGPoint = unit.sprite.position
        let x : CGFloat = point.x
        let y : CGFloat = point.y
        let gpmp : GamePathMatrixPoint = GamePathMatrixPoint(
                LandPoint: point,
                IsBlocked: true,
                spaceTime: "VOID")
        let keyStr : String = "{\(x),\(y)}"

        PathsBlocked[keyStr] = gpmp

        if unit.teamNumber == 1 {
            unit.sprite.run(SKAction.colorize(with: .red, colorBlendFactor: 0.9, duration: 1))
        }

        self.AllUnitsInGameScene[unit.uuid] = unit
        self.AllUnitGUIDs.append(unit.uuid)
    }

}