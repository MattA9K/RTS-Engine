//
//  GameUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import UIKit


public enum GameSettings {
    case FriendlyFire, SpriteScale;
    
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
                return 150
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
        return 20
    }
    
    static func ScanForEnemySpeed() -> Double {
        return 3.0
    }
    
    static func MovementSpeed() -> Double {
        return 0.3
    }
    
    static func AttackSpeedMelee() -> Double {
        return 0.5
    }
    
    static func AttackSpeedRanged() -> Double {
        return 4.0
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


enum Sight {
    case Image;
    
    var Invisible : String {
        return "SearchRadiusDummy"
    }
    var VisibleDebugMode : String {
        return "SearchRadiusDummyV"
    }
}



public struct Reflection {
    func getClassNameBasic(instance: Any) -> String {
        let mirror = Mirror(reflecting: instance)
        let classname = String(mirror.subjectType)
        return classname
    }
}


