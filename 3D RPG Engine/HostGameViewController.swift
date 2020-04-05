//
//  HostGameViewController.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/17/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import UIKit
import SpriteKit
import Starscream
import Alamofire
import SwiftyJSON


let TABLE_VIEW_CELL = "LobbyUser"

let SCREEN_BOUNDS = UIScreen.main.bounds


class UsersInLobbyTableView : UITableView {

}

class LobbyMessagesTableView : UITableView {

}

class HostGameViewController: SocketedViewController, UITableViewDelegate, UITableViewDataSource {


//    let mapScene : MiniMapScene! = MiniMapScene(fileNamed:"MiniMapMedium")!
    var textViewName = UITextField(frame: CGRect(x:0,y:0,width:0,height:0))
    var textViewChat = UITextField(frame: CGRect(x:0,y:0,width:0,height:0))
    var usersTableView = UsersInLobbyTableView(frame: CGRect(x:0,y:0,width:0,height:0))
    var socketMessagesTableView = LobbyMessagesTableView(frame: CGRect(x:0,y:0,width:0,height:0))
    var socketURI : String!

    var currentPlayerName : String! = "noname"
    
    var mainView = SplitVerticalViewController()
    var socket : WebSocket!

    var lobbyUsers : [LobbyUser] = []

    var lobbyChatMessages : [LobbyChatMessage] = [
            LobbyChatMessage(teamNumber: 1, playerName: "CiniCraft", message: "welcome to the lobby")
    ]
    var terminal : HostLobbyTerminal!

    let lv: UIView = UIView(frame:
    CGRect(
            x:0,
            y:0,
            width:UIScreen.main.bounds.width/2,
            height:UIScreen.main.bounds.height
            ))

    let rv: UIView = UIView(frame:
    CGRect(
            x:UIScreen.main.bounds.width * 0.25,
            y:0,
            width:UIScreen.main.bounds.width/2,
            height:UIScreen.main.bounds.height
            ))

    let lblPlayerNumber = UILabel(frame: CGRect(x:0,y:0,width:100,height:40))
    let teamNumber = 1

    var allTimers : [Timer] = []
    
    // 1.]
    override func viewDidLoad() {
        currentPlayerName = getRandomPlayerNickName()
        super.viewDidLoad()
        self.generateBackgroundStone()


        // Do any additional setup after loading the view.
    }

    // 2.]
    func postNewLobbyToServerSQL() {
        let params = [
                "game_name":textViewName.text!,
                "game_type":"zzz"
        ]
        let url : String = "http://\(HOST_SERVER):8888/create_game_lobby/"
        Alamofire.request(url,
                        method: .post,
                        parameters: params,
                        encoding: JSONEncoding.default, headers: [:]).responseJSON { response in
                    self.didFinishAPIPOSTRequest()
//                    self.loadJoyStickScene()
                    print("POST request is complete: \n\n \(response.result.value)")
                }
    }


    func activateTimerLobbyDataBroadcaster() {
        let lobbyTimer = Timer.scheduledTimer(
                timeInterval: 3.0,
                target: self,
                selector: #selector(self.socketedViewControllerDidConnect),
                userInfo: "",
                repeats: true
        )
        self.allTimers.append(lobbyTimer)
    }

    func deactivateTimers() {
        for timer in self.allTimers {
            timer.invalidate()
        }
    }

    
    func generateBackgroundStone() {
        let stoneBackground = UIImageView(frame: self.view.frame)
        stoneBackground.image = UIImage(named: "mainMenuBackground")
        self.view.addSubview(stoneBackground)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func didReceiveSocketCommand(commandJson: JSON) {
        let type : String = commandJson["type"].string!
        switch type {
        case "GUEST_DID_JOIN":
            print("A guest has joined the game!")
            didGetGuestJoinedLobbyAlert(commandJson)
        case "CHAT_MESSAGE":
            print("Someone posted a text message.")
            didGetChatMessage(commandJson)

        default:
            print("nope")
        }
        super.didReceiveSocketCommand(commandJson: commandJson)
    }

    override func socketedViewControllerDidConnect() {
        print("websocket is connected")
        let alertHost1 : JSON = [
                "type":"CHAT_MESSAGE",
                "teamNumber":teamNumber,
                "playerName":currentPlayerName,
                "message":"someone joined the lobby."
        ]

        let alertHost2 : JSON = [
                "type":"GUEST_DID_JOIN",
                "teamNumber":teamNumber,
                "playerName":currentPlayerName,
                "message":"someone joined the lobby."
        ]

//        terminal.socket.write(string: alertHost1.rawString()!, completion: { _ in
        
        self.terminal.socket.write(string: alertHost2.rawString()!, completion: {
            
        })
//        })
        super.socketedViewControllerDidConnect()
    }

    
    @objc func returnToMainMenu() {
        self.dismiss(animated: true, completion: {
        })
    }

    func gameLobbyNameAlert() {
        let alert = UIAlertController(title: "Host New Game",
                message: "Name seen in the join lobby:",
                preferredStyle: UIAlertController.Style.alert)

        let cancelAction = UIAlertAction(
                title: "cancel",
                style: UIAlertAction.Style.cancel) { (result : UIAlertAction) -> Void in
            print("Ok Cool")
            self.didFinishEnteringGameLobbyName()
        }

        let okAction = UIAlertAction(
                title: "submit",
                style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
            print("Ok Cool")
            self.didFinishEnteringGameLobbyName()

        }

        alert.addTextField(configurationHandler: { shit in
            shit.placeholder = "Game Name"
            shit.addTarget(self, action: #selector(self.textBoxContentDidChangeForPlayerNumber), for: .allEditingEvents)
        })

        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }



    //postNewLobbyToServerSQL
    @objc func textBoxContentDidChangeForPlayerNumber(sender: UITextField) {
        if let text = sender.text {
            textViewName.text = text
        }
    }


}


struct SplitVerticalViewController {
    let lv: UIView = UIView(frame:
    CGRect(x:0,y:0,width:UIScreen.main.bounds.width/2,height:UIScreen.main.bounds.height))

    let rv: UIView = UIView(frame:
        CGRect(
        x:50,
        y:0,
        width:UIScreen.main.bounds.width/2,
        height:UIScreen.main.bounds.height)
    )
}


extension HostGameViewController {
    func didFinishAPIPOSTRequest() {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
                    Thread.sleep(forTimeInterval: 2.0)
                    DispatchQueue.main.async {
                        self.terminal = HostLobbyTerminal(redisSocketChannelName: "\(self.textViewName.text!)lobby")
                        self.terminal.delegate = self
                        self.terminal.establishStableConnection("\(self.textViewName.text!)lobby")
                        self.activateTimerLobbyDataBroadcaster()
                    }
                }

    }





    func didFinishEnteringGameLobbyName() {
        //______________________________
        // RIGHT SIDE STUFF:
        self.socketMessagesTableView.register(UITableViewCell.self, forCellReuseIdentifier: TABLE_VIEW_CELL)
        self.socketMessagesTableView.dataSource = self
        self.socketMessagesTableView.delegate = self
        socketMessagesTableView.frame.size.width = rv.frame.size.width * 0.9
        socketMessagesTableView.frame.size.height = rv.frame.size.height / 2
        socketMessagesTableView.center = self.rv.center
        socketMessagesTableView.frame.origin.y = SCREEN_BOUNDS.height * 0.35
        self.rv.addSubview(socketMessagesTableView)


        //______________________________
        // LEFT SIDE STUFF:
        self.usersTableView.register(UITableViewCell.self, forCellReuseIdentifier: TABLE_VIEW_CELL)
        self.usersTableView.dataSource = self
        self.usersTableView.delegate = self
        usersTableView.frame.size.width = lv.frame.size.width * 0.9
        usersTableView.frame.size.height = lv.frame.size.height / 2
        usersTableView.center = self.lv.center
        usersTableView.frame.origin.y = SCREEN_BOUNDS.height * 0.35

        self.lv.addSubview(usersTableView)


        let btn_01 = UIButton(frame: CGRect(x: 50,y: 30,width: 75,height: 40))
//        btn_01.center.x = self.lv.center.x
        btn_01.setTitle("Host Game", for: UIControl.State())
        btn_01.setTitleColor(UIColor.white, for: UIControl.State())
        btn_01.backgroundColor = UIColor.gray
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        lv.addSubview(btn_01)
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControl.State())
        btn_01.addTarget(
                self,
                action: #selector(self.loadGameScene),
                for: .touchUpInside
        );

        let btn_02 = UIButton(frame: CGRect(x: 130,y: 30,width: 75,height: 40))
//        btn_02.center.x = self.lv.center.x
        btn_02.setTitle("Open Debugger", for: UIControl.State())
        btn_02.setTitleColor(UIColor.white, for: UIControl.State())
        btn_02.backgroundColor = UIColor.gray
        btn_02.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        lv.addSubview(btn_02)
        btn_02.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControl.State())
        btn_02.addTarget(
                self,
                action: #selector(self.presentUnitDebuggerDialog),
                for: .touchUpInside
        );


        textViewName.frame = CGRect(
                x:0,
                y:75,
                width:lv.frame.size.width * 0.8,
                height:lv.frame.size.height * 0.08
                )
        self.lv.addSubview(textViewName)
        textViewName.borderStyle = .roundedRect
        textViewName.placeholder = "Enter Game Name"
        textViewName.center.x = lv.center.x

        textViewChat.frame = CGRect(
                x:0,
                y:75,
                width:rv.frame.size.width * 0.8,
                height:rv.frame.size.height * 0.08
                )
        self.rv.addSubview(textViewChat)
        textViewChat.borderStyle = .roundedRect
        textViewChat.placeholder = "Say something in chat!"
        textViewChat.center.x = rv.center.x


        let btn_03 = UIButton(frame: CGRect(x: 50,y: lv.frame.size.height-45,width: 250,height: 40))
        btn_03.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControl.State())
        btn_03.center.x = lv.center.x
        btn_03.setTitle("Return To Main Menu", for: UIControl.State())
        btn_03.setTitleColor(UIColor.white, for: UIControl.State())
        btn_03.backgroundColor = UIColor.gray
        btn_03.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        self.lv.addSubview(btn_03)
        btn_03.addTarget(
                self,
                action: #selector(self.returnToMainMenu),
                for: .touchUpInside
        );


        let btn_04 = UIButton(frame: CGRect(x: 250,y: 30,width: 75,height: 40))
        btn_04.setTitle("Send", for: UIControl.State())
        btn_04.setTitleColor(UIColor.white, for: UIControl.State())
        btn_04.backgroundColor = UIColor.gray
        btn_04.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        rv.addSubview(btn_04)
        btn_04.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControl.State())
        btn_04.addTarget(
                self,
                action: #selector(self.broadcastChatMessage),
                for: .touchUpInside
        );


        view.addSubview(rv)
        view.addSubview(lv)


//        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
//                    Thread.sleep(forTimeInterval: 2.0)
//                    DispatchQueue.main.async {
                        self.postNewLobbyToServerSQL()
//                    }
//                }
    }

}


extension HostGameViewController {
    @objc func broadcastChatMessage() {

        let msgJson : JSON = [
                "type":"CHAT_MESSAGE",
                "teamNumber":teamNumber,
                "playerName":"StateCCM",
                "message":textViewChat.text!
        ]
        self.terminal.socket.write(string: msgJson.rawString()!)
    }

    func broadcastGameHasStarted() {
        let msgJson : JSON = [
                "type":"CHAT_MESSAGE",
                "teamNumber":teamNumber,
                "playerName":"StateCCM",
                "message":textViewChat.text!
        ]
        self.terminal.socket.write(string: msgJson.rawString()!)
    }
}



extension HostGameViewController {

    func didGetGuestJoinedLobbyAlert(_ json: JSON) {
        let guestIdentifier = json["playerName"].string!
        let guestTeamNumber = json["teamNumber"].int!

        var dontAppend : Bool = false

        for user in self.lobbyUsers {
            if user.playerName == guestIdentifier {
                dontAppend = true
            }
        }
        if dontAppend == false {
            self.lobbyUsers.append(LobbyUser(teamNumber: guestTeamNumber, playerName: guestIdentifier))
            self.usersTableView.reloadData()
        }
    }

    func didGetChatMessage(_ json: JSON) {
        let guestIdentifier = json["playerName"].string!
        let guestTeamNumber = json["teamNumber"].int!
        let textMessage = json["message"].string!
        self.lobbyChatMessages.append(
                LobbyChatMessage(
                        teamNumber: guestTeamNumber,
                        playerName: guestIdentifier,
                        message: textMessage
                        ))
        self.socketMessagesTableView.reloadData()
    }


    func loadJoyStickScene(onToScene: GameScene) {
        let joyStickSize : CGRect = CGRect(x: 0, y: SCREEN_BOUNDS.size.height - 150, width: 150, height: 150);
        let joyStickView : SKView = SKView(frame: joyStickSize)
        let gameScene : JoyStickScene = JoyStickScene(fileNamed: "JoyStickScene")!
        gameScene.joyStick.setGameSceneRef(onToScene)
        joyStickView.presentScene(gameScene, transition: .doorway(withDuration: 1.0))
        self.view.addSubview(joyStickView)

        let cmdBar : CommandBar = CommandBar(scene: onToScene)
        onToScene.commandBarDelegate = cmdBar
        self.view.addSubview(cmdBar.mainView)
        
        let xP : CGFloat = SCREEN_BOUNDS.size.width - 140
        let frameCollectionView : CGRect = CGRect(x: xP, y: 0, width: 140, height: 150)
        let cmdCardView = UnitCommandCardView(frame: frameCollectionView)
        cmdCardView.backgroundColor = .black
        self.view.addSubview(cmdCardView)
        
        onToScene.commandCardView = cmdCardView
        onToScene.commandCardView!.delegateGameScene = onToScene
    }


    @objc func loadGameScene() {
        let ClientHardware = UIDevice.current.modelName as NSString
        let HardwareFormFactor = ClientHardware.substring(with: NSRange(location: 0, length: 4))

        var sceneName = ""

        let deviceHeight = UIScreen.main.nativeBounds.width
        let deviceWidth = UIScreen.main.nativeBounds.height

        print("resolution: \(deviceWidth) x \(deviceHeight)")

        if deviceWidth == 960 && deviceHeight == 640 {
            sceneName = "iPhone4SGameScene"
        }
        else if deviceWidth == 1136 && deviceHeight == 640 {
            sceneName = "iPhone5GameScene"
        }
        else if deviceWidth == 1334 && deviceHeight == 750 {
            sceneName = "iPhone6GameScene"
        }
        else if deviceWidth == 1920 && deviceHeight == 1080 {
            sceneName = "iPhone6PlusGameScene"
        }
        else if deviceWidth == 2048 && deviceHeight == 1536 {
            sceneName = "iPadRetinaGameScene"
        }
        else if deviceWidth >= 2732 && deviceHeight >= 2048 {
            sceneName = "iPadProGameScene"
        }
        if let scene = GameScene(fileNamed:sceneName) {
            // Configure the view.
            scene.viewControllerRef = self

            let gameViewSize = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: view.frame.size.height);
            let mainView = SKView(frame: gameViewSize);
            mainView.scene?.size = gameViewSize.size;

            /* Sprite Kit applies additional optimizations to improve rendering performance */
            mainView.ignoresSiblingOrder = false;


            /* Set the scale mode to scale to fit the window */
            scene.playerIsHost2 = true
            scene.currentPlayerNumber2 = 1
            scene.scaleMode = .aspectFit;
            scene.multiplayerGameSocketId = textViewName.text!
            mainView.presentScene(scene);
            self.view.addSubview(mainView);
            print("Game scene created successfully on host, preparing to POST it to the API.")
            scene.initGameMapAsHost(textViewName.text!)
            self.deactivateTimers()
            loadJoyStickScene(onToScene: scene)
            self.willShowMiniMap(scene.PathsBlocked)
            self.didShowMiniMap()
        }
    }




    func startGame() {
        let gsp : GameScenePresenter = GameScenePresenter(self)
        rv.addSubview(gsp.mainView)
        gsp.startGameSceneAlertController()
        gsp.gameScene.initializeSwipeToPanCameraEventHandler()

        gsp.mainView.frame = rv.frame
        if let textName = self.textViewName.text {
            gsp.gameScene.multiplayerGameSocketId = textName
        }

        print("Something just happened...")
    }

}


extension HostGameViewController {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView is UsersInLobbyTableView {
            return lobbyUsers.count
        } else {
            return lobbyChatMessages.count
        }
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView is UsersInLobbyTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL, for: indexPath)
            cell.textLabel?.text = "\(lobbyUsers[indexPath.row].teamNumber) - \(lobbyUsers[indexPath.row].playerName)"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL, for: indexPath)
            cell.textLabel?.text = lobbyChatMessages[indexPath.row].message
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView is UsersInLobbyTableView {
            return "Players in lobby:"
        } else {
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if tableView is UsersInLobbyTableView {
            return "X Total Players"
        } else {
            return ""
        }
    }
}


public func getRandomPlayerNickName() -> String {
    let r1 = Int(arc4random_uniform(5) + 0)
    let r2 = Int(arc4random_uniform(5) + 0)
    let prefixArray = ["Thebes", "Corinth", "Argos", "Megara", "Lamia"]
    let suffixArray = ["Pompeii", "Rome", "Ariminum", "Bononia", "Caesarea"]
    let randomName = "\(prefixArray[r1])_\(suffixArray[r2])"
    return randomName
}
