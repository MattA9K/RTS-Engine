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
    
    
    
    /*
    func generateUnitDebug() {
        let alertController = UIAlertController(
            title: "Spawn Unit",
            message: "Simple alertView demo with Destructive and Ok.",
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        let DestructiveAction = UIAlertAction(title: "Generate New Unit", style: UIAlertActionStyle.destructive) { (result : UIAlertAction) -> Void in
            print("Destructive")
            self.generateUnitsBasic()
        }
        
        let okAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Done")
        }
        
        //        alertController.addTextField(configurationHandler: { shit in
        //            shit.addTarget(self, action: #selector(self.textBoxContentDidChange), for: .allEditingEvents)
        //        })
        
        let activateAI = UIAlertAction(
            title: "Activate AI",
            style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
            self.activateTimers()
        }
        
        let broadcastAI = UIAlertAction(
            title: "Broadcast AI",
            style: UIAlertActionStyle.default)
        { (result : UIAlertAction) -> Void in
            print("Done")
            self.broadcastAIUnitsToGameScene({ _ in
            })
        }
        
        
        alertController.addAction(okAction)
        alertController.addAction(DestructiveAction)
        alertController.addAction(activateAI)
        alertController.addAction(broadcastAI)
        
        self.viewControllerRef?.present(alertController, animated: true, completion: nil)
    }
    */

    /*
    func generateUnitsBasic() {
        
        let enemyTeamNumber = (arc4random_uniform(1000) + 2)
        
        let spawnLocation1 = CGPoint(x:800, y:650)
        let u1 = GruntLvl4Unit(player: Int(enemyTeamNumber))
        u1.sprite.position = spawnLocation1
        
        let spawnLocation2 = CGPoint(x:600, y:600)
        let u2 = BalrogUnit(player: Int(enemyTeamNumber))
        u2.sprite.position = spawnLocation2
        
        let spawnLocation3 = CGPoint(x:600, y:700)
        let u3 = BalrogUnit(player: Int(enemyTeamNumber))
        u3.sprite.position = spawnLocation3
        
        let spawnLocation4 = CGPoint(x:400, y:550)
        let u4 = BalrogUnit(player: self.playerSK.teamNumber)
        u4.sprite.position = spawnLocation4
        
//        self.appendUnitToGameScene(u1)
        self.appendUnitToGameScene(u2)
//        self.appendUnitToGameScene(u3)
        self.appendUnitToGameScene(u4)
        

        u4.sprite.run(SKAction.colorize(with: .red, colorBlendFactor: 0.9, duration: 1))
    }
    */
    
    enum BatchUnits {
        case easy, medium, hard;
    }
    func generateManyRandomUnits(_ batch : BatchUnits) {
        let enemyTeamNumber = (arc4random_uniform(1000) + 2)
        
        var arrayOfStartLocations : [CGPoint]!
        
        if batch == .easy {
            arrayOfStartLocations = getRandomStartLocationsForUnits(width:10, height: 10)
        } else if batch == .medium {
            arrayOfStartLocations = getRandomStartLocationsForUnits(width:15, height: 15)
        } else if batch == .hard {
            arrayOfStartLocations = getRandomStartLocationsForUnits(width:20, height: 20)
        }
        
        var i = 0
        for cgPoint in arrayOfStartLocations {
            let spawnLocation2 = CGPoint(x:600, y:600)
            
            print("SPAWNING SHIT: \(i)")
            print("TOTAL SHIT: \(arrayOfStartLocations.count)")
            
            if i > (arrayOfStartLocations.count / 2) {
                
                let rollDice = Int(arc4random_uniform(6) + 2)
                if rollDice == 2 {
                    let u2 = GruntLvl3Unit(player: 17)
                    u2.sprite.position = cgPoint

                    self.appendUnitToGameScene(u2)
                }
                else if rollDice == 3 {
                    let u2 = BalrogUnit(player: 17)
                    u2.sprite.position = cgPoint
                    self.appendUnitToGameScene(u2)
                }
                else if rollDice == 6 {
                    let u2 = BalrogUnit(player: 17)
                    u2.sprite.position = cgPoint
                    self.appendUnitToGameScene(u2)
                }
                else if rollDice == 4 {
                    let u2 = BalrogUnit(player: 17)
                    u2.sprite.position = cgPoint
                    self.appendUnitToGameScene(u2)
                }
                else if rollDice == 5 {
                    let u2 = BalrogUnit(player: 17)
                    u2.sprite.position = cgPoint
                    self.appendUnitToGameScene(u2)
                }
                

                print("🔵ALLY SPAWNED!")
            } else {
                
                let rollDice = Int(arc4random_uniform(6) + 2)
                if rollDice == 2 {
                    let u2 = BalrogUnit(player: Int(enemyTeamNumber))
                    u2.sprite.position = cgPoint
                    self.appendUnitToGameScene(u2)
                }
                else if rollDice == 3 {
                    let u2 = BalrogUnit(player: Int(enemyTeamNumber))
                    u2.sprite.position = cgPoint
                    self.appendUnitToGameScene(u2)
                }
                else if rollDice == 6 {
                    let u2 = BalrogUnit(player: Int(enemyTeamNumber))
                    u2.sprite.position = cgPoint
                    self.appendUnitToGameScene(u2)
                }
                else if rollDice == 4 {
                    let u2 = BalrogUnit(player: Int(enemyTeamNumber))
                    u2.sprite.position = cgPoint
                    self.appendUnitToGameScene(u2)
                }
                else if rollDice == 5 {
                    let u2 = BalrogUnit(player: Int(enemyTeamNumber))
                    u2.sprite.position = cgPoint
                    self.appendUnitToGameScene(u2)
                }
                
                print("🔴ENEMY SPAWNED!")
            }
            
            
            i += 1
        }
    }
    
    
    func getRandomStartLocationsForUnits(width: Int, height: Int) -> [CGPoint] {
        var unitStartLocations = [CGPoint]()
        
        let totalWidth = width
        let totalHeight = height
        
        var curRow = ""
        var entireMapSoFar = ""
        
        var allColumns = [String]()
        
        for y in 0...totalHeight {
            for x in 0...totalWidth {
                
                let rollDice = Int(arc4random_uniform(8) + 2)
                
                if rollDice == 5 {
                    curRow.append("O  ")
                    unitStartLocations.append(CGPoint(x:x*50,y:y*50))
                } else {
                    curRow.append("X  ")
                }
            }
            allColumns.append(curRow + "\n")
            entireMapSoFar.append(curRow + "\n")
            curRow = ""
        }
        
        allColumns = allColumns.reversed()
        for i in 0...(allColumns.count - 1) {
            print(allColumns[i])
        }
        
        return unitStartLocations
    }
    
    /*
    func generateBunchOfUnits() {
        let spawnLocation1 = CGPoint(x:800, y:650)
        let spawnLocation2 = CGPoint(x:600, y:500)
        let spawnLocation3 = CGPoint(x:550, y:500)
        
        let u1 = GruntLvl4Unit(player: 10)
        u1.sprite.position = spawnLocation1
        //            debugAllUnitGUIDs.append(u1.uuid)
        
        let u2 = BalrogUnit(player: 10)
        u2.sprite.position = spawnLocation2
        //            debugAllUnitGUIDs.append(u2.uuid)
        
        //            let u3 = GruntLvl3Unit(player: 2)
        //            u3.sprite.position = spawnLocation3
        //            debugAllUnitGUIDs.append(u3.uuid)
        
        self.appendUnitToGameScene(u1)
        self.appendUnitToGameScene(u2)
        //            self.appendUnitToGameScene(u3)
    }
    */
}
