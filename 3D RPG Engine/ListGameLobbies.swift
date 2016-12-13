//
// Created by Mateusz Andrzejczuk on 11/26/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class ListGameLobbyViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    var lobbiesTableView = LobbyMessagesTableView(frame: CGRect(x:0,y:0,width:SCREEN_BOUNDS.width * 0.5,height:SCREEN_BOUNDS.height * 0.65))
    var listOfOpenLobbies : [OpenGameLobby] = []
    var currentlySelectedLobby : OpenGameLobby?
    var btn_01 = UIButton(frame: CGRect(x: 50,y: 30,width: 250,height: 40))

    override func viewDidLoad() {
        super.viewDidLoad()

        generateBackgroundStone()
        generateAllButtons()
        lobbiesTableView.center = self.view.center
        lobbiesTableView.register(UITableViewCell.self, forCellReuseIdentifier: TABLE_VIEW_CELL)
        lobbiesTableView.dataSource = self
        lobbiesTableView.delegate = self
        view.addSubview(self.lobbiesTableView)
        getListOfOpenLobbies()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func openJoinGameViewController() {
        if let lobby = currentlySelectedLobby {
            let vc = JoinGameViewController()
            vc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            present(vc, animated: true, completion: {
                vc.textViewName.text = lobby.name
                vc.connectAutomatically()
            })
        }
    }

    func returnToMainMenu() {
        self.dismiss(animated: true, completion: {
        })
    }
}


struct OpenGameLobby {
    let id : Int
    let name : String
}


extension ListGameLobbyViewController {
    func getListOfOpenLobbies() {
        var url : URL = URL(string: "http://\(HOST_SERVER):8888/get_hosted_games_list/")!
        Alamofire.request(url).responseJSON { response in
            print("REQUEST SENT \(url.absoluteString)")
            if let value = response.result.value {
                let json : JSON = JSON(value)
                print("LIST OF LOBBIES: \n \(json)")
                let total = json["total"].int!
                for i in 0...(total - 1) {
                    let id : Int = json["results"][i]["id"].int!
                    let name : String = json["results"][i]["name"].string!
                    self.listOfOpenLobbies.append(OpenGameLobby(id:id,name:name))
                }
                self.lobbiesTableView.reloadData()
            }
        }
    }
}


extension ListGameLobbyViewController {
    func generateBackgroundStone() {
        let stoneBackground = UIImageView(frame: self.view.frame)
        stoneBackground.image = UIImage(named: "mainMenuBackground")
        self.view.addSubview(stoneBackground)
    }

    func generateAllButtons() {
        btn_01.center.x = self.view.center.x
        btn_01.setTitle("Select A Lobby", for: UIControlState())
        btn_01.setTitleColor(UIColor.white, for: UIControlState())
        btn_01.backgroundColor = UIColor.gray
        btn_01.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_01)
        btn_01.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_01.addTarget(
                self,
                action: #selector(ListGameLobbyViewController.openJoinGameViewController),
                for: .touchUpInside
                );

        let btn_02 = UIButton(frame: CGRect(x: 50,y: view.frame.height-50,width: 250,height: 40))
        btn_02.setBackgroundImage(UIImage(named: "wideMenuButton2"), for: UIControlState())
        btn_02.center.x = self.view.center.x
        btn_02.setTitle("Return To Main Menu", for: UIControlState())
        btn_02.setTitleColor(UIColor.white, for: UIControlState())
        btn_02.backgroundColor = UIColor.gray
        btn_02.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 16)
        view.addSubview(btn_02)
        btn_02.addTarget(
                self,
                action: #selector(ListGameLobbyViewController.returnToMainMenu),
                for: .touchUpInside
                );
    }
}


extension ListGameLobbyViewController {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfOpenLobbies.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL, for: indexPath)
        cell.textLabel?.text = listOfOpenLobbies[indexPath.row].name
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentlySelectedLobby = listOfOpenLobbies[indexPath.row]
        self.btn_01.titleLabel?.text = "Join \(listOfOpenLobbies[indexPath.row].name)"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if tableView is UsersInLobbyTableView {
            return "Hosted Public Games"
//        }
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        if tableView is UsersInLobbyTableView {
            return "X Total Games"
//        }
    }
}