//
//  GameScene_Multiplayer.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
import SwiftyJSON




extension GameScene {
    func getNewUnitInstanceUsing(string: String, playerNumber: Int) -> AbstractUnit {
        if string == "FootmanUnit" {
            return FootmanUnit(player: playerNumber)
        }
        else if string == "HeroFootmanUnit" {
            return HeroFootmanUnit(player: playerNumber, gameScene: self, loadSpriteImmediately: true)
        }
        else if string == "GruntEliteUnit" {
            return GruntEliteUnit(player: playerNumber)
        }
        else if string == "GruntRecruitUnit" {
            return GruntRecruitUnit(player: playerNumber)
        }
        else if string == "SpearThrowerUnit" {
            return SpearThrowerUnit(player: playerNumber)
        }
        else if string == "SpearThrowerEliteUnit" {
            return SpearThrowerEliteUnit(player: playerNumber)
        }
        else if string == "SpearThrowerSuperUnit" {
            return SpearThrowerSuperUnit(player: playerNumber)
        }
        else if string == "GruntMarineUnit" {
            return GruntMarineUnit(player: playerNumber)
        }
        else if string == "GruntLvl3Unit" {
            return GruntLvl3Unit(player: playerNumber)
        }
        else if string == "GruntLvl4Unit" {
            return GruntLvl4Unit(player: playerNumber)
        }
        else if string == "BalrogUnit" {
            return BalrogUnit(player: playerNumber)
        }
        else {
            return GruntRecruitUnit(player: playerNumber)
        }
    }
}
