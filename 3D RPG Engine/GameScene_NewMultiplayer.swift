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
    /*
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
    */
    func textBoxContentDidChangeForPlayerNumber(sender: UITextField) {
        if let text = sender.text {
            playerNumberInput = text
        }
    }
}
