//
// Created by Mateusz Andrzejczuk on 11/26/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import Starscream
import SwiftyJSON
import SpriteKit




enum LobbyChannelName {
    case foobar;
    var string : String {
        get {
            return "foobar"
        }
    }
}



class SocketTerminal : WebSocketDelegate {
    var socketURI : String!
    var delegate : SocketedViewController?
    var socket : WebSocket!
    var messagesReceived : Int = 0

    func websocketDidConnect(socket: WebSocket) {
        print("websocket is connected")
    }

    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("websocket is disconnected: \(error?.localizedDescription)")
    }

    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        print("websocketDidReceiveMessage: \(text)")
        socketTerminalDidReceivePayloadJSON(text)
    }

    func websocketDidReceiveData(socket: WebSocket, data: Data) {
        print("got some data: \(data.count)")
    }

    init() {

    }

    init(redisSocketChannelName: String) {
        socketURI = "ws://10.1.10.25:7002/ws/\(redisSocketChannelName)?subscribe-broadcast&publish-broadcast&echo"
        print("Guest has connected! \(socketURI)")
        self.socket = WebSocket(url: URL(string: socketURI)!)
    }

    func establishStableConnection(_ channelName: String) {
        let textName : String = channelName
//        if let textName = self.textViewName.text {
            let gameIdentifier = "ws://10.1.10.25:7002/ws/\(textName)?subscribe-broadcast&publish-broadcast&echo"
            self.socket = WebSocket(url: URL(string: gameIdentifier)!)
            self.socket.connect()
            self.socket.onConnect = {
                self.socket.write(string: "SOMEONE_CONNECTED", completion: { _ in
                    self.socket.delegate = self
                    self.delegate!.socketedViewControllerDidConnect()
                })
            }
//        }
    }

    func executeSocketCommand(commandJson: JSON) {
        if let del = delegate {
            print("GOT A SOCKET COMMAND: \n\n \(commandJson)")
            del.didReceiveSocketCommand(commandJson: commandJson)
        }
    }

    func socketTerminalDidReceivePayloadJSON(_ rawJson: String) {
        if let dataFromString = rawJson.data(using: .utf8, allowLossyConversion: false) {
            let json : JSON = JSON(data: dataFromString)
            if let type = json["type"].string {
                self.messagesReceived += 1
                switch type {
                case "DEBUG_LOG_INFO":
                    executeSocketCommand(commandJson: json)
                default:
                    executeSocketCommand(commandJson: json)
                }
            }

        }
    }
}


protocol Socketed {
    func socketedViewControllerDidConnect()
    func didReceiveSocketCommand(commandJson: JSON)
}

class SocketedViewController : UIViewController, Socketed {
    func socketedViewControllerDidConnect() {

    }

    func didReceiveSocketCommand(commandJson: JSON) {
        print("")
    }

    let mapScene : MiniMapScene! = MiniMapScene(fileNamed:"MiniMapMedium")!

    func willShowMiniMap(_ pathsBlocked: [String:GamePathMatrixPoint]) {

    }

    func didShowMiniMap(/*miniMapScene: MiniMapScene*/) {
        self.loadMiniMapScene()
    }

    func updateMiniMap(_ pathsBlocked: [String:GamePathMatrixPoint]) {
        self.mapScene.updateBlockedPaths(pathsBlocked: pathsBlocked)
    }

    func loadMiniMapScene() {
//        let ClientHardware = UIDevice.current.modelName as NSString
//        let HardwareFormFactor = ClientHardware.substring(with: NSRange(location: 0, length: 4))

//        var sceneName = "MapPreviewFromMenu"

        let deviceHeight = UIScreen.main.nativeBounds.width
        let deviceWidth = UIScreen.main.nativeBounds.height

//        if let scene = MiniMapScene(fileNamed:sceneName) {
        // Configure the view.
//            scene.viewControllerRef = self as HostGameViewController

        let gameViewSize = CGRect(x: 0, y: 0, width: self.view.frame.size.width / 4, height: view.frame.size.height / 3);
        let mainView = SKView(frame: gameViewSize);
        mainView.scene?.size = gameViewSize.size;

        /* Sprite Kit applies additional optimizations to improve rendering performance */
        mainView.ignoresSiblingOrder = false;


        /* Set the scale mode to scale to fit the window */
//            scene.playerIsHost2 = true
//            scene.currentPlayerNumber2 = 1
        mapScene.scaleMode = .aspectFit;
//            scene.multiplayerGameSocketId = textViewName.text!
        mainView.presentScene(mapScene);
        self.view.addSubview(mainView);
        print("Game scene created successfully on host, preparing to POST it to the API.")
//            scene.initGameMapAsHost(textViewName.text!)
//            self.deactivateTimers()
//        }
    }
}


class HostLobbyTerminal : SocketTerminal {
    override func executeSocketCommand(commandJson: JSON) {
        if let del = delegate {
            (del as! HostGameViewController).didReceiveSocketCommand(commandJson: commandJson)
        }
    }
}

class GuestLobbyTerminal : SocketTerminal {
    override func executeSocketCommand(commandJson: JSON) {
        if let del = delegate {
            (del as! JoinGameViewController).didReceiveSocketCommand(commandJson: commandJson)
        }
    }
}