//
//  MapPoint.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit





public enum MapCoordUnit {
    case FtmanP1, GruntP2, Void, PlyrFtman, TileGrass
    
    
    var Unit: BaseUnit {
        get {
            switch (self) {
            case .FtmanP1:
                return FootmanUnit(unit: Actor.AnyUnit, player: 1)
            case .GruntP2:
                return GruntUnit(unit: Actor.AnyUnit, player: 2)
            default:
                return FootmanUnit(unit: Actor.AnyUnit)
            }
        }
    }
}


