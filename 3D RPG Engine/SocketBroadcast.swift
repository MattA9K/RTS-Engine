//
//  SocketBroadcast.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/24/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SwiftyJSON
import Starscream


//class SocketBroadcast {
//    let gameSceneReference: GameScene
//    let listOfMessages: [String]
//    var messageK: Int
//    
//    func writeListOfStringsToSocket() {
//        if messageK >= 0 {
//            if gameSceneReference.socket.isConnected {
//                gameSceneReference.socket.write(string:, completion: {
//                    self.writeListOfStringsToSocket()
//                })
//            }
//            messageK -= 1
//        }
//    }
//    
//    init(game: GameScene, list: [String]) {
//        messageK = list.count - 1
//        listOfMessages = list
//        gameSceneReference = game
//    }
//}
