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
    case FtmanP1, FtmanP2, GruntP2, SpearP2, Void, PlyrFtman, TileGrass, OrcHutP2, GreatHallP2, OrcBarracks, OrcBlacksmith, OrcLumberMill, OrcWall;
    
    
    var Unit: BaseUnit {
        get {
            switch (self) {
            case .FtmanP1:
                return getPlayerUnit()
            case .FtmanP2:
                return SpellSwordUnit(unit: Actor.AnyUnit, player: 2)
            case .GruntP2:
                return GruntUnit(unit: Actor.AnyUnit, player: 2)
            case .SpearP2:
                return SpearThrowerUnit(unit: Actor.AnyUnit, player: 2)
            case .OrcHutP2:
                return OrcHut_Structure(player: 2)
            case .GreatHallP2:
                return OrcGreatHall_Structure(player: 2)
            case .OrcBarracks:
                return OrcBarracks_Structure(player: 2)
            case .OrcBlacksmith:
                return OrcBlacksmith_Structure(player: 2)
            case .OrcLumberMill:
                return OrcLumbermill_Structure(player: 2)
            case .OrcWall:
                return OrcWall_Structure(player: 2)
            default:
                return FootmanUnit(unit: Actor.AnyUnit)
            }
        }
    }

    
    func getPlayerUnit() -> BaseUnit {
        let unit = FootmanUnit(unit: Actor.AnyUnit, player: 1)
        unit.isPlayer = true
        return unit
    }
}



public enum MapCoordTile {
    case Grass, Void, Stone, Tree;
    
    
    var Tile: SKGroundTileGeneric {
        get {
            switch (self) {
            case .Grass:
                return SKGrassTile()
            case .Void:
                return SKGrassTile()
            case .Stone:
                return SKDoodadStone()
            case .Tree:
                return SKDoodadTree()
            default:
                return SKGroundTileGeneric()
            }
        }
    }
}