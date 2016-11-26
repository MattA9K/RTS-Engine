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

        let okAction2 = UIAlertAction(
            title: "Terrain Generator",
            style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("Done")
                self.terrainAlertController()
        }
        
        alertController.addAction(okAction)
        alertController.addAction(okAction2)
        alertController.addAction(printAllNodesInScene)

        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    
    func terrainAlertController() {
        let alertController = UIAlertController(
            title: "Generate New Map",
            message: "...",
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        let DestructiveAction2 = UIAlertAction(title: "Generate Terrain Random", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            print("Destructive")
            self.generateTerrainRandom()
        }
        
        let GuestAction = UIAlertAction(title: "Broadcast Tiles", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            self.broadcastTileMapToClients()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            print("Destructive")
            self.broadcastTileMapToClients()
        }
        
        let printTiles = UIAlertAction(title: "Print Tiles To Alert", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            for node in self.children {
                if node is TileSpriteNode {
                    print("[TILE NAME]: \(node.name)")
                }
            }
        }

        alertController.addAction(DestructiveAction2)
        alertController.addAction(GuestAction)
        alertController.addAction(printTiles)
        alertController.addAction(cancel)
        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    
}
