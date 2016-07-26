//
//  UnitSearchArea.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/25/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation


enum UnitSearchArea {
    case Melee, Ranged;
    
    var Default: Double {
        get {
            switch (self) {
            case .Melee:
                return 0.6
            default:
                return 0.8
            }
        }
    }
}