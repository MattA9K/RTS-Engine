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
    case friendlyFire, spriteScale;
    
    var Default: CGFloat {
        get {
            switch (self) {
            case .spriteScale:
                return 0.6
            default:
                return 0.8
            }
        }
    }
}

enum UnitDefaultProperty {
    case melee, ranged, movement;
    
    var Range: CGFloat {
        get {
            switch (self) {
            case .melee:
                return 50
            case .ranged:
                return 150
            case .movement:
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
    public func roundToFifties(_ x : CGFloat) -> CGFloat {
        return CGFloat(50 * Int(round(x / 50.0)))
    }
}


struct UnitData {
    static func DecayLength() -> Double {
        return 20
    }
    
    static func ScanForEnemySpeed() -> Double {
        return 1.0
    }
    
    static func MovementSpeed() -> Double {
        return 0.3
    }
    
    static func AttackSpeedMelee() -> Double {
        return 0.6
    }
    
    static func AttackSpeedRanged() -> Double {
        return 1.0
    }
}

enum UnitFaceAngle {
    case up, down, left, right,
    ul, ur, dl, dr;
    
    var facingAngleString: String {
        get {
            switch (self) {
                
            case .up:
                return "up"
            case .down:
                return "down"
            case .left:
                return "left"
            case .right:
                return "right"
                
            case .ul:
                return "ul"
            case .ur:
                return "ur"
            case .dl:
                return "dl"
            case .dr:
                return "dr"
                
            default:
                return "fuck off"
            }
        }
    }
    
}



public enum SpritePositionZ {
    case deadUnit, aliveUnit, tileset, smallDoodad
    
    var Z: CGFloat {
        get {
            switch (self) {
            case .deadUnit:
                return 5
            case .aliveUnit:
                return 10
            case .smallDoodad:
                return 15
            case .tileset:
                return 0
            }
        }
    }
}


enum Sight {
    case image;
    
    var Invisible : String {
        return "SearchRadiusDummy"
    }
    var VisibleDebugMode : String {
        return "SearchRadiusDummyV"
    }
}



public struct Reflection {
    func getClassNameBasic(_ instance: Any) -> String {
        let mirror = Mirror(reflecting: instance)
        let classname = String(describing: mirror.subjectType)
        return classname
    }
}


