//
//  UnitCommand Enum.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 12/18/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


enum UnitCommand {
    case walkMove, attackMove, stop, attackUnit;
    
    var name : (String) {
        get {
            switch self {
            case .stop:
                return "❌"
            case .walkMove:
                return "➡️"
            case .attackMove:
                return "🗡"
            case .attackUnit:
                return "⚔"
            default:
                return "❓"
            }
        }
    }
}
