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


    func postUnitsToAPI(_ didTransmitSuccessfully: @escaping (Bool?) -> ()) -> () {
//            guard self.playerSK.teamNumber == 1 else {
//                return
//            }
        var arrayOfUnits = [JSON]()
        for unit in AllUnitsInGameScene {
//            if unit.value is HeroFootmanUnit {
//            } else {
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
//            }
        }
        let finalDict = [
                "type":"BROADCAST_AI_UNITS",
                "units":JSON(arrayOfUnits)
        ]
        let finalJSON : JSON = JSON(finalDict) //.rawString()!
        let parameters : [String:String] = [
                "game_name":multiplayerGameSocketId,
                "game_type":"ZZZ",
                "map_data":finalJSON.rawString()!
        ]
        let url : String = "http://\(HOST_SERVER):8888/upload_map_data_as_host/"

        print("Making API call to host the game map data. \n \(url)")
        Alamofire.request(url,
                method: .post,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: [:]).responseJSON
        { response in

            print("API call successful! \n \(parameters)")
            didTransmitSuccessfully(true)
        }
    }

    func generateGameMapUnitForHost() {
        var newUnits = [UUID:AbstractUnit]()
        let playerNew = self.getPlayerUnit()
        self.unitsForMultiplayer = newUnits
        newUnits[playerNew.uuid] = playerNew
        self.AllUnitsInGameScene = newUnits
//        for guid in newUnits {
//            self.AllUnitGUIDs.append(guid.key)
//        }
        playerSK = self.AllUnitsInGameScene[playerNew.uuid]
        didFinishLoadingBlankGameScene()
        initPlayerTarget()
    }

    func initGameMapAsHost(_ gameName: String) {
        self.multiplayerGameSocketId = gameName
//        self.generateUnblockedPaths()
        self.generateTerrainRandom()
//        generateGameMapUnitForHost()
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            Thread.sleep(forTimeInterval: 0.3)
            DispatchQueue.main.async {
                self.socket.connect()
                self.socket.onConnect = {
                    Thread.sleep(forTimeInterval: 0.4)
                    DispatchQueue.main.async {
                        self.socket.write(string: "Creating new LAN game, single player with AI.", completion: {
                            Thread.sleep(forTimeInterval: 1.0)
                            DispatchQueue.main.async {
                                self.socket.write(string: "Creating new LAN game, single player with AI.")
                                self.socket.delegate = self
                            }
                            Thread.sleep(forTimeInterval: 1.0)
                            DispatchQueue.main.async {
                                self.generateManyRandomUnits(.easy, offSet: CGPoint(x:-1000,y:-1000))
                                self.generateManyRandomUnits(.easy, offSet: CGPoint(x:1000,y:1000))
                                self.activateTimers()
                            }
                            Thread.sleep(forTimeInterval: 1.0)
                            DispatchQueue.main.async {
                                self.postUnitsToAPI({ transmissionWasSuccessful in

                                    let json : JSON = [
                                        "type":"GAME_HAS_STARTED"
                                    ]
                                    (self.viewControllerRef as! HostGameViewController).terminal.socket.write(string: json.rawString()!, completion: {
                                        
                                        self.hostDidFinishPOSTUnitsToAPI()
                                    })
                                    
                                })
                                //self.broadcastAIUnitsToGameScene({ _ in
                                //})
                            }
                        })
                    }
                }
            }
        }
    }

    func hostDidFinishPOSTUnitsToAPI() {
        let url = URL(string: "http://\(HOST_SERVER):8888/get_map_data_as_guest/?game_name=\(multiplayerGameSocketId)")!
        print("HOST GET MAP DATA REQUEST: \(url)")
        Alamofire.request(url).responseJSON { response in
            if let value = response.result.value {
                let json : JSON = JSON(value)
                let unitsJSON = json["results"]["data"]
                print("HOST DID FINISH GET AI UNITS TO API: \n \(json)")
                self.appendManyUnitsAIToGameScene(action: unitsJSON)
                self.broadcastPlayerToGameSceneAsHost()
            }
        }
    }

    func broadcastPlayerToGameSceneAsHost() {
        let strUUID : String = UUID().uuidString
        let sLoc : CGPoint = CGPoint(x:600,y:350)
        let broadcastMessage : JSON = [
                "id":self.totalSocketMessages,
                "type":"BROADCAST_UNIT",
                "uuid":strUUID,
                "sent_by_host":(currentPlayerNumber2 == 1),
                "position": "{\(sLoc.x), \(sLoc.y)}",
                "class":"HeroFootmanUnit",
                "player":1
        ]
        socket.write(string: broadcastMessage.rawString()!)
    }

    func generateUnblockedPaths() {
        func roundToFifties_(_ x : CGFloat) -> CGFloat {
            return CGFloat(50 * Int(round(x / 50.0)))
        }
        func roundPointToFifties(_ point: CGPoint) -> CGPoint {
            var new = point
            new.x = roundToFifties_(new.x)
            new.y = roundToFifties_(new.y)
            return new
        }

        var X = 0.0
        var Y = 0.0

        let MAX_WIDTH = 55
        let MAX_HEIGHT = 55
        let OFFSET_X = 5
        let OFFSET_Y = 5

        /// output for debugging
        var output : String = ""
        for Y in 0...MAX_HEIGHT {
            output.append("\n")
            for X in 0...MAX_WIDTH {
                let point : CGPoint = CGPoint(x:X,y:Y)
                let x : CGFloat = point.x
                let y : CGFloat = point.y
                let gpmp : GamePathMatrixPoint = GamePathMatrixPoint(
                        LandPoint: point,
                        IsBlocked: false,
                        spaceTime: "VOID",
                        _color: DEFAULT_UNBLOCKED)
                let keyStr : String = "{\(x),\(y)}"
                PathsBlocked["{\(X*50), \(Y*50)}"] = gpmp
                output.append("(\(X*50), \(Y*50)) ")
            }
        }
    }
}
