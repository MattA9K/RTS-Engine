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

    func recursiveUnitBroadcast() {
        let alertController = UIAlertController(
                title: "Broadcast Units To Socket",
                message: "...",
                preferredStyle: UIAlertControllerStyle.alert
        )

        let DestructiveAction2 = UIAlertAction(title: "Go", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            print("Destructive")
            var array : [AbstractUnit] = []
            for unit in self.AllUnitsInGameScene {
                array.append(unit.value)
            }

            if self.viewControllerRef is JoinGameViewController {
                (self.viewControllerRef! as! JoinGameViewController).broadcastAllUnitsInit(array)
            } else {

            }
        }

        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            print("Destructive")
        }

        let teleport = UIAlertAction(title: "Teleport Hero", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            let destination = CGPoint(x:2250,y:2000)
            (self.playerSK as! PathfinderUnit).moveUnitWithSpritesInTheDirection(
                    self.playerSK.sprite.position,
                    direction: self.playerSK.angleFacing,
                    destination: destination, finalDestination: { finalDestination in
                self.playerSK.sprite.position = destination
                self.spriteControlPanel!.moveToFollowPlayerHero(destination)
            })
        }

        let spawnBuilding = UIAlertAction(title: "Spawn Building", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            let startLocation : CGPoint = self.playerTarget!.position
            let newBuildingUnit = OrcHutUnit(player: 1999)
            newBuildingUnit.sprite.position = startLocation
            self.appendAIUnitToGameScene(unit: newBuildingUnit)
        }

        let spawnTree = UIAlertAction(title: "Spawn Tree", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            let startLocation : CGPoint = self.playerTarget!.position
            let newBuildingUnit = TreeUnit(player: 1999)
            newBuildingUnit.sprite.position = startLocation
            self.appendAIUnitToGameScene(unit: newBuildingUnit)
        }

        let BroadcastTiles = UIAlertAction(title: "Broadcast Tiles", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            self.broadcastTileMapToClients()
        }

        let recconect = UIAlertAction(title: "Refresh Connection", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            self.socket.connect()
            self.socket.onConnect = {
                print("\n\nCONNECTION HAS JUST BEEN REESTABLISHED!!!\n\n")
            }
        }

        let blockedPaths = UIAlertAction(title: "Show Mini Map", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Destructive")
            print("\n\n\(self.PathsBlocked)\n\n")

            if self.viewControllerRef is HostGameViewController {
                (self.viewControllerRef as! HostGameViewController).willShowMiniMap(self.PathsBlocked)
                (self.viewControllerRef as! HostGameViewController).didShowMiniMap()
            } else if self.viewControllerRef is JoinGameViewController {
                (self.viewControllerRef as! JoinGameViewController).willShowMiniMap(self.PathsBlocked)
                (self.viewControllerRef as! JoinGameViewController).didShowMiniMap()
            }


        }



        alertController.addAction(teleport)
        alertController.addAction(spawnBuilding)
        alertController.addAction(spawnTree)
        alertController.addAction(blockedPaths)
        alertController.addAction(BroadcastTiles)
        alertController.addAction(DestructiveAction2)
        alertController.addAction(cancel)
        alertController.addAction(recconect)

        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }

}
