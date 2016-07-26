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


public enum GameSettings {
    case FriendlyFire, SpriteScale;
    
    var Enabled: Bool {
        get {
            switch (self) {
            case .FriendlyFire:
                return false
            default:
                return true
            }
        }
    }
    
    var Default: CGFloat {
        get {
            switch (self) {
            case .SpriteScale:
                return 0.6
            default:
                return 0.8
            }
        }
    }
}

enum UnitDefaultProperty {
    case Melee, Ranged, Movement;
    
    var Range: CGFloat {
        get {
            switch (self) {
            case .Melee:
                return 50
            case .Ranged:
                return 250
            case .Movement:
                return 50
            }
        }
    }
    
    var AttackSpeed: CGFloat {
        get {
            return 0.40
        }
    }
}

public struct PathFinder {
    public func roundToFifties(x : CGFloat) -> CGFloat {
        return CGFloat(50 * Int(round(x / 50.0)))
    }
}


struct UnitData {

    static func DecayLength() -> Double {
        return 80
    }
    
    static func ScanForEnemySpeed() -> Double {
        return 3.0
    }
    
    static func MovementSpeed() -> Double {
        return 0.4
    }
    
    static func AttackSpeed() -> Double {
        return 0.5
    }
}

enum UnitFaceAngle {
    case Up, Down, Left, Right;
    
    var facingAngleString: String {
        get {
            switch (self) {
            case .Up:
                return "up"
            case .Down:
                return "down"
            case .Left:
                return "left"
            case .Right:
                return "right"
            default:
                return "fuck off"
            }
        }
    }
    
}

public enum ViewDistance {
    case AI;
    
    var Default: CGFloat {
        get {
            switch (self) {
            case .AI:
                return 350
            }
        }
    }
}


public enum SpritePositionZ {
    case DeadUnit, AliveUnit, Tileset, SmallDoodad
    
    var Z: CGFloat {
        get {
            switch (self) {
            case .DeadUnit:
                return 5
            case .AliveUnit:
                return 10
            case .SmallDoodad:
                return 15
            case .Tileset:
                return 0
            }
        }
    }
}
