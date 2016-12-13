//
//  GameScene_UnitInitializer.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
import SwiftyJSON




extension GameScene {

    /// Create a new unit, offline only, you will need to broadcast this unit to the socket afterwards
    func getNewUnitInstanceUsing(string: String, playerNumber: Int) -> AbstractUnit {
        if string == "FootmanUnit" {
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = FootmanUnit(player: playerNumber)
            u.primaryColor = teamColor
            return u
        }
        else if string == "HeroFootmanUnit" {
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = HeroFootmanUnit(player: playerNumber, gameScene: self)
            u.primaryColor = teamColor
            return u
        }
        else if string == "GruntEliteUnit" {
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = GruntEliteUnit(player: playerNumber)
            u.primaryColor = teamColor
            return u
        }
        else if string == "OrcHutUnit" {
            print("getNewUnitInstanceUsing \(string)")
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = OrcHutUnit(player: playerNumber, spawnLocation: CGPoint(x:0, y:0))
            u.hasJunkyardDogBehavior = true
            u.primaryColor = teamColor
            return u
        }
        else if string == "OrcHutHatcheryUnit" {
            print("getNewUnitInstanceUsing \(string)")
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = OrcHutHatcheryUnit(player: playerNumber, spawnLocation: CGPoint(x:0, y:0))
            u.hasHatcheryBehavior = true
            u.primaryColor = teamColor
            return u
        }
        else if string == "GruntRecruitUnit" {
            print("getNewUnitInstanceUsing \(string)")
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = GruntRecruitUnit(player: playerNumber)
            u.hasJunkyardDogBehavior = false
            u.primaryColor = teamColor
            return u
        }
        else if string == "PeonUnit" {
            print("getNewUnitInstanceUsing \(string)")
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = PeonUnit(player: playerNumber)
            u.hasJunkyardDogBehavior = true
            u.primaryColor = teamColor
            return u
        }
        else if string == "SpearThrowerUnit" {
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = SpearThrowerUnit(player: playerNumber)
            u.primaryColor = teamColor
            return u
        }
        else if string == "SpearThrowerEliteUnit" {
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = SpearThrowerEliteUnit(player: playerNumber)
            u.primaryColor = teamColor
            return u
        }
        else if string == "SpearThrowerSuperUnit" {
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = SpearThrowerSuperUnit(player: playerNumber)
            u.primaryColor = teamColor
            return u
        }
        else if string == "GruntMarineUnit" {
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = GruntMarineUnit(player: playerNumber)
            u.primaryColor = teamColor
            return u
        }
        else if string == "GruntLvl3Unit" {
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = GruntLvl3Unit(player: playerNumber)
            u.primaryColor = teamColor
            return u
        }
        else if string == "GruntLvl4Unit" {
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = GruntLvl4Unit(player: playerNumber)
            u.primaryColor = teamColor
            return u
        }
        else if string == "BalrogUnit" {
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = BalrogUnit(player: playerNumber)
            u.primaryColor = teamColor
            return u
        }
        else {
            let teamColor = newPlayerDictionaryGenerator(playerNumber)
            let u = GruntRecruitUnit(player: playerNumber)
            u.primaryColor = teamColor
            return u
        }
    }

    /// Create a new player object for each teamNumber in the GameScene
    /// Returns the randomly selected color for this player
    func newPlayerDictionaryGenerator(_ player : Int) -> UIColor {
        if self.allPlayers[player] == nil {
            self.allPlayers[player] = Player(playerNumber: player, groupNumber: 1)
            print("PLAYER OBJECT CREATED FOR PLAYER: \(player)")
            return self.allPlayers[player]!.color
        } else {
            return .gray
        }
    }
}
