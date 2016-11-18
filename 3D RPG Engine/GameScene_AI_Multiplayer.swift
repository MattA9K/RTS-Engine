//
//  GameScene_AI_Multiplayer.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/18/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import Starscream
import SwiftyJSON
import SpriteKit





extension GameScene {
    
    
    
    
    func generateUnitDebug() {
        let alertController = UIAlertController(
            title: "Spawn Unit",
            message: "Simple alertView demo with Destructive and Ok.",
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        let DestructiveAction = UIAlertAction(title: "Generate New Unit", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            print("Destructive")
            
            let spawnLocation1 = CGPoint(x:600, y:550)
            let spawnLocation2 = CGPoint(x:600, y:500)
            let spawnLocation3 = CGPoint(x:550, y:500)
            
            let u1 = GruntLvl4Unit(player: 2)
            u1.sprite.position = spawnLocation1
            //            debugAllUnitGUIDs.append(u1.uuid)
            
            let u2 = GruntLvl3Unit(player: 2)
            u2.sprite.position = spawnLocation2
//            debugAllUnitGUIDs.append(u2.uuid)
            
            //            let u3 = GruntLvl3Unit(player: 2)
            //            u3.sprite.position = spawnLocation3
            //            debugAllUnitGUIDs.append(u3.uuid)
            
            
            self.appendUnitToGameScene(u1)
            self.appendUnitToGameScene(u2)
            //            self.appendUnitToGameScene(u3)
        }
        
        let okAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Done")
        }
        
        //        alertController.addTextField(configurationHandler: { shit in
        //            shit.addTarget(self, action: #selector(self.textBoxContentDidChange), for: .allEditingEvents)
        //        })
        
        alertController.addAction(okAction)
        
        alertController.addAction(DestructiveAction)
        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
        
    }
}
