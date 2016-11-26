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
        
        let fireUpSinglePlayerMacro = UIAlertAction(
            title: "📱 Host Game On Socket URI",
            style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                self.presetSinglePlayerAI()
        }
        
        let showAlertForGuestReadyToConnect = UIAlertAction(
            title: "🔍 Guest Mode - Auto Join",
            style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                self.connectToSocketAsGuest()
        }
        
        let printJsonUnit = UIAlertAction(
            title: "🖊 Print Debug Message",
            style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                self.broadcastDebugMessage_PrintAllUnitsInGameScene()
        }
       
        alertController.addAction(connectNow)
        alertController.addAction(broadCastHeroAction)
        alertController.addAction(changePlayerAction)
        alertController.addAction(cancelAction)
        alertController.addAction(fireUpSinglePlayerMacro)
        alertController.addAction(showAlertForGuestReadyToConnect)
        alertController.addAction(printJsonUnit)
        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    
    func presetSinglePlayerAI() {
        generateManyRandomUnits(.easy)
        self.activateTimers()
        socket.connect()
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async {
                self.socket.write(string: "Creating new LAN game, single player with AI.")
                self.socket.delegate = self
            }
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async {
                self.broadcastAIUnitsToGameScene()
            }
        }
    }
    
    
    func connectToSocketAsGuest() {
        socket.connect()
        let teamNum = Int(arc4random_uniform(5) + 1000)
        self.currentPlayerNumber = teamNum
        self.playerSK.teamNumber = teamNum
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async {
                self.socket.write(string: "Someone entered Multiplayer mode, with AI.")
                self.socket.delegate = self
            }
            Thread.sleep(forTimeInterval: 1.0)
            DispatchQueue.main.async {
                self.broadcastPlayerToGameScene()
            }
        }
    }
    
    
    func joinGame() {
        Thread.sleep(forTimeInterval: 1.0)
        DispatchQueue.main.async {
            self.broadcastPlayerToGameScene()
        }
    }
    
    
    func toggleSocketConnection() {
        if socket.isConnected == true {
            socket.disconnect()
        } else {
            socket.connect()
            socket.write(string: "Player \(self.currentPlayerNumber) has joined the game.")
            socket.delegate = self
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
                self.currentPlayerNumber = Int(self.playerNumberInput)!
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
