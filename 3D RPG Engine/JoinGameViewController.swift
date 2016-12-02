//
//  JoinGameViewController.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/17/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit
import Alamofire
import SwiftyJSON
import UIKit

class JoinGameViewController :
        SocketedViewController, UIAlertViewDelegate, UITableViewDelegate, UITableViewDataSource {

//    let mapScene : MiniMapScene! = MiniMapScene(fileNamed:"MiniMapMedium")!
    var textViewName = UITextField(frame: CGRect(x:0,y:0,width:0,height:0))
    var textViewChat = UITextField(frame: CGRect(x:0,y:0,width:0,height:0))
    var usersTableView = UsersInLobbyTableView(frame: CGRect(x:0,y:0,width:0,height:0))
    var socketMessagesTableView = LobbyMessagesTableView(frame: CGRect(x:0,y:0,width:0,height:0))

    var currentPlayerName : String! = "noname"
    var mainView = SplitVerticalViewController()

    var lobbyUsers : [LobbyUser] = []

    var lobbyChatMessages : [LobbyChatMessage] = [
            LobbyChatMessage(teamNumber: 2, playerName: "CiniCraft", message: "welcome to the lobby")
    ]
    var terminal : GuestLobbyTerminal!
    var allTimers : [Timer] = []


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
    let teamNumber = Int(arc4random_uniform(99) + 2)


    func getRandomPlayerNickName() -> String {
        let r1 = Int(arc4random_uniform(5) + 0)
        let r2 = Int(arc4random_uniform(5) + 0)
        let prefixArray = ["Thebes", "Corinth", "Argos", "Megara", "Lamia"]
        let suffixArray = ["Pompeii", "Rome", "Ariminum", "Bononia", "Caesarea"]
        let randomName = "\(prefixArray[r1])_\(suffixArray[r2])"
        return randomName
    }


    override func viewDidLoad() {
        currentPlayerName = getRandomPlayerNickName()
        super.viewDidLoad()

        generateBackgroundStone()
        // Do any additional setup after loading the view.


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
        btn_01.setTitle("Connect", for: UIControlState())
        btn_01.setTitleColor(UIColor.white, for: UIControlState())
        btn_01.backgroundColor = UIColor.gray
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        lv.addSubview(btn_01)
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_01.addTarget(
                self,
                action: #selector(self.connect),
                for: .touchUpInside
                );

        let btn_02 = UIButton(frame: CGRect(x: 130,y: 30,width: 75,height: 40))
//        btn_02.center.x = self.lv.center.x
        btn_02.setTitle("Debug", for: UIControlState())
        btn_02.setTitleColor(UIColor.white, for: UIControlState())
        btn_02.backgroundColor = UIColor.gray
        btn_02.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        lv.addSubview(btn_02)
        btn_02.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_02.addTarget(
                self,
                action: #selector(self.returnToMainMenu),
                for: .touchUpInside
                );

        let btn_03 = UIButton(frame: CGRect(x: 50,y: lv.frame.size.height-45,width: 250,height: 40))
        btn_03.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_03.center.x = lv.center.x
        btn_03.setTitle("Return To Main Menu", for: UIControlState())
        btn_03.setTitleColor(UIColor.white, for: UIControlState())
        btn_03.backgroundColor = UIColor.gray
        btn_03.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        self.lv.addSubview(btn_03)
        btn_03.addTarget(
                self,
                action: #selector(self.returnToMainMenu),
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


        let btn_04 = UIButton(frame: CGRect(x: 150,y: 30,width: 75,height: 40))
        btn_04.setTitle("Send", for: UIControlState())
        btn_04.setTitleColor(UIColor.white, for: UIControlState())
        btn_04.backgroundColor = UIColor.gray
        btn_04.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        rv.addSubview(btn_04)
        btn_04.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_04.addTarget(
                self,
                action: #selector(self.broadcastChatMessage),
                for: .touchUpInside
                );


        view.addSubview(rv)
        view.addSubview(lv)
    }

    func connect(sender: UIButton) {
        terminal = GuestLobbyTerminal(redisSocketChannelName: "\(textViewName.text!)lobby")
        terminal.delegate = self
        self.terminal.establishStableConnection("\(textViewName.text!)lobby")
        sender.removeFromSuperview()

        let socketURILabel = UILabel(frame: CGRect(x:0,y:0,width:350,height:40))
        socketURILabel.textColor = .white
        socketURILabel.text = terminal.socketURI
        self.rv.addSubview(socketURILabel)
        print("THIS IS THE CLIENT'S CURRENT CONNECTION: \n \(terminal.socket.currentURL)")
    }
    func connectAutomatically() {
        terminal = GuestLobbyTerminal(redisSocketChannelName: "\(textViewName.text!)lobby")
        terminal.delegate = self
        self.terminal.establishStableConnection("\(textViewName.text!)lobby")

        let socketURILabel = UILabel(frame: CGRect(x:0,y:0,width:450,height:40))
        socketURILabel.textColor = .white
        socketURILabel.text = terminal.socketURI
        self.rv.addSubview(socketURILabel)
        print("THIS IS THE CLIENT'S CURRENT CONNECTION: \n \(terminal.socket.currentURL)")

        lblPlayerNumber.textColor = .white
        lblPlayerNumber.text = "Player: \(teamNumber)"
        self.lv.addSubview(lblPlayerNumber)
        self.activateTimerLobbyDataBroadcaster()
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
        case "GAME_HAS_STARTED":
            print("HOST HAS STARTED THE GAME!")
            didGetAlertFromHost_StartGame(commandJson)
        default:
            print("nope")
        }
        super.didReceiveSocketCommand(commandJson: commandJson)
    }

    override func socketedViewControllerDidConnect() {
        print("SOCKET DID CONNECT: \(terminal.socket.currentURL)")
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
            self.terminal.socket.write(string: alertHost2.rawString()!, completion: { _ in
            })
//        })
        super.socketedViewControllerDidConnect()
    }

    func generateBackgroundStone() {
        let stoneBackground = UIImageView(frame: self.view.frame)
        stoneBackground.image = UIImage(named: "mainMenuBackground")
        self.view.addSubview(stoneBackground)
    }


    func returnToMainMenu() {
        self.dismiss(animated: true, completion: {
        })
    }

    func showCredits() {
        let alert = UIAlertController(
                title: AntiochAlertType.credits.Title,
                message: AntiochAlertType.credits.Body,
                preferredStyle: UIAlertControllerStyle.alert)

        alert.addAction(
                UIAlertAction(
                        title: AntiochAlertType.credits.AcceptButton,
                        style: UIAlertActionStyle.default,
                        handler: nil
                        )
                )

        self.present(alert, animated: true, completion: nil)
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

    /*
    func willShowMiniMap(_ pathsBlocked: [String:GamePathMatrixPoint]) {

    }

    func didShowMiniMap(/*miniMapScene: MiniMapScene*/) {
        loadMiniMapScene()
    }

    func updateMiniMap(_ pathsBlocked: [String:GamePathMatrixPoint]) {
        self.mapScene.updateBlockedPaths(pathsBlocked: pathsBlocked)
    }

    func loadMiniMapScene() {
        let deviceHeight = UIScreen.main.nativeBounds.width
        let deviceWidth = UIScreen.main.nativeBounds.height

        let gameViewSize = CGRect(x: 0, y: 0, width: self.view.frame.size.width / 4, height: view.frame.size.height / 3);
        let mainView = SKView(frame: gameViewSize);
        mainView.scene?.size = gameViewSize.size;

        /* Sprite Kit applies additional optimizations to improve rendering performance */
        mainView.ignoresSiblingOrder = false;


        /* Set the scale mode to scale to fit the window */
        mapScene.scaleMode = .aspectFit;
        mainView.presentScene(mapScene);
        self.view.addSubview(mainView);
        print("Game scene created successfully on host, preparing to POST it to the API.")

    }*/
}


extension JoinGameViewController {

    func didGetAlertFromHost_StartGame(_ json: JSON) {
        print("GUEST iOS CLIENT GOT ALERTED ABOUT THE GAME STARTING!")
        self.lobbyChatMessages.append(
                LobbyChatMessage(
                        teamNumber: 1,
                        playerName: "Host",
                        message: "Game is about to start!"
                        ))
        self.socketMessagesTableView.reloadData()

        self.loadGameScene()
    }

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
}

extension JoinGameViewController {
    func broadcastChatMessage() {
        let msgJson : JSON = [
                "type":"CHAT_MESSAGE",
                "teamNumber":2,
                "playerName":"StateCCM",
                "message":textViewChat.text!
        ]
        self.terminal.socket.write(string: msgJson.rawString()!)
    }

    func broadcastAllUnitsInit(_ arrayUnits: [AbstractUnit]) {
        broadCastAllUnitsForDebug(arrayUnits.count - 1, arrayUnits)
    }
    func broadCastAllUnitsForDebug(_ i: Int,_ arrayUnits: [AbstractUnit]) {
        if i > -1 {
            self.terminal.socket.write(string: arrayUnits[i].sprite.name!, completion: { _ in
                let next = i - 1
                self.broadCastAllUnitsForDebug(next, arrayUnits)
            })
        }
    }
}


extension JoinGameViewController {
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


extension JoinGameViewController {
    func loadGameScene() {
        let ClientHardware = UIDevice.current.modelName as NSString
        let HardwareFormFactor = ClientHardware.substring(with: NSRange(location: 0, length: 4))
        let playerNum : Int = Int(arc4random_uniform(126) + 5)
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
//        sceneName = "MapPreviewFromMenu"
        if let scene = GameScene(fileNamed:sceneName) {
            // Configure the view.
            scene.viewControllerRef = self as! JoinGameViewController

            let gameViewSize = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: view.frame.size.height);
            let mainView = SKView(frame: gameViewSize);
            mainView.scene?.size = gameViewSize.size;

            /* Sprite Kit applies additional optimizations to improve rendering performance */
            mainView.ignoresSiblingOrder = true;


            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFit;
            scene.multiplayerGameSocketId = textViewName.text!
            scene.playerIsHost2 = false
            scene.currentPlayerNumber2 = playerNum
            mainView.presentScene(scene);
            self.view.addSubview(mainView);
            print("Game scene created successfully on host, preparing to POST it to the API.")
            scene.initGameMapAsGuest(textViewName.text!)
        }
    }
}