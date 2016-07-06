//
//  GameUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import UIKit

public enum Actor {
    
    case Player, EnemyFootman, AnyUnit;
    
    var SpritePNG: String {
        get {
            switch (self) {
            case .Player:
                return "footman_down_down"
            case .EnemyFootman:
                return "dummy01"
            case .AnyUnit:
                return "footman_down_down"
            }
        }
    }
    
    var pointCG: CGPoint {
        get {
            switch (self) {
            case .Player:
                return CGPointMake(500, 600)
            case .EnemyFootman:
                return CGPointMake(500, 400)
            case .AnyUnit:
                return CGPointMake(500, 400)
            }
        }
    }
    
    var unitType: String {
        get {
            switch (self) {
            case .Player:
                return "player"
            case .EnemyFootman:
                return "enemy"
            case .AnyUnit:
                return "enemy"
            }
        }
    }
}

