//
//  GameScene_DebugUtility.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/22/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import Starscream
import SwiftyJSON



extension GameScene {
    
    func presentUnitDebuggerDialog() {
        let alertController = UIAlertController(
            title: "Unit Debuggind",
            message: "Get unit info from RAM",
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        let printAllNodesInScene = UIAlertAction(
        title: "Print All SKNodes",
        style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            print("Destructive")
            
            var strBody = "\n "

            for unit in self.AllUnitsInGameScene {
                strBody += "\(unit.value.uuid) : " +
                "\(Mirror(reflecting: unit.value).subjectType)"
            }
            
            self.alert("Units in GameScene", strBody)
        }
        
        let okAction = UIAlertAction(
        title: "Cancel",
        style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Done")
        }

        
        alertController.addAction(okAction)
        alertController.addAction(printAllNodesInScene)

        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    
    
}
