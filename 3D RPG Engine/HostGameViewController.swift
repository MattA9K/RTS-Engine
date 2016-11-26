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


let TABLE_VIEW_CELL = "LobbyUser"

let SCREEN_BOUNDS = UIScreen.main.bounds


class HostGameViewController: UIViewController, WebSocketDelegate, UITableViewDelegate, UITableViewDataSource {

    var textViewName = UITextField(frame: CGRect(x:0,y:0,width:0,height:0))
    var usersTableView = UITableView(frame: CGRect(x:0,y:0,width:0,height:0))
    var socketMessagesTableView = UITableView(frame: CGRect(x:0,y:0,width:0,height:0))
    
    var mainView = SplitVerticalViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.generateBackgroundStone()
        // Do any additional setup after loading the view.
        
        
        
        //______________________________
        // RIGHT SIDE STUFF:
        self.socketMessagesTableView.register(UITableViewCell.self, forCellReuseIdentifier: TABLE_VIEW_CELL)
        self.socketMessagesTableView.dataSource = self
        self.socketMessagesTableView.delegate = self
        
        socketMessagesTableView.frame.size.width = mainView.rv.frame.size.width * 0.9
        socketMessagesTableView.frame.size.height = mainView.rv.frame.size.height / 2
        socketMessagesTableView.center = self.mainView.rv.center
        socketMessagesTableView.frame.origin.y = SCREEN_BOUNDS.height * 0.35
        self.mainView.rv.addSubview(socketMessagesTableView)
        
        
        //______________________________
        // LEFT SIDE STUFF:
        /*
        self.usersTableView.register(UITableViewCell.self, forCellReuseIdentifier: TABLE_VIEW_CELL)
        self.usersTableView.dataSource = self
        self.usersTableView.delegate = self
        
        usersTableView.frame.size.width = mainView.lv.frame.size.width * 0.9
        usersTableView.frame.size.height = mainView.lv.frame.size.height / 2
        usersTableView.center = self.mainView.lv.center
        usersTableView.frame.origin.y = SCREEN_BOUNDS.height * 0.35
        self.mainView.lv.addSubview(usersTableView)
        */
        
        let btn_01 = UIButton(frame: CGRect(x: 50,y: 30,width: 250,height: 40))
        btn_01.center.x = self.mainView.lv.center.x
        btn_01.setTitle("Host Game", for: UIControlState())
        btn_01.setTitleColor(UIColor.white, for: UIControlState())
        btn_01.backgroundColor = UIColor.gray
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        mainView.lv.addSubview(btn_01)
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_01.addTarget(
            self,
            action: #selector(self.startGame),
            for: .touchUpInside
        );
        
        
        textViewName.frame = CGRect(
            x:0,
            y:75,
            width:mainView.lv.frame.size.width * 0.8,
            height:mainView.lv.frame.size.height * 0.08
        )
        self.mainView.lv.addSubview(textViewName)
        textViewName.borderStyle = .roundedRect
        textViewName.placeholder = "Enter Game Name"
        textViewName.center.x = mainView.lv.center.x
        
        let btn_03 = UIButton(frame: CGRect(x: 50,y: mainView.lv.frame.size.height-45,width: 250,height: 40))
        btn_03.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_03.center.x = mainView.lv.center.x
        btn_03.setTitle("Return To Main Menu", for: UIControlState())
        btn_03.setTitleColor(UIColor.white, for: UIControlState())
        btn_03.backgroundColor = UIColor.gray
        btn_03.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        self.mainView.lv.addSubview(btn_03)
        btn_03.addTarget(
            self,
            action: #selector(self.returnToMainMenu),
            for: .touchUpInside
        );
        
        view.addSubview(mainView.rv)
        view.addSubview(mainView.lv)
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
    

    func startGame() {
        let gsp : GameScenePresenter = GameScenePresenter(self)
        mainView.rv.addSubview(gsp.mainView)
        gsp.startGameSceneAlertController()
        gsp.gameScene.initializeSwipeToPanCameraEventHandler()
        
        gsp.mainView.frame = mainView.rv.frame
//        gsp.centerGameScene(view: self.mainView.rv)
        print("Something just happened...")
    }
    
    
    func returnToMainMenu() {
        self.dismiss(animated: true, completion: {
        })
    }

}


struct SplitVerticalViewController {
    let lv: UIView = UIView(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.width/2,height:UIScreen.main.bounds.height))
    let rv: UIView = UIView(frame:
        CGRect(
        x:350,
        y:0,
        width:UIScreen.main.bounds.width/2,
        height:UIScreen.main.bounds.height)
    )
}


extension HostGameViewController {
    func websocketDidConnect(socket: WebSocket) {
        print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        print("websocket is disconnected: \(error?.localizedDescription)")
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        print("websocketDidReceiveMessage: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: Data) {
        print("got some data: \(data.count)")
    }
}


extension HostGameViewController {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL, for: indexPath)
        
        cell.textLabel?.text = "Yo Nigga."
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Players in lobby:"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Footer"
    }
}
