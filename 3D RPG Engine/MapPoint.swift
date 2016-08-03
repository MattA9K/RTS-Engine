//
//  MapPoint.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



protocol StartingUnits {
    var startLocation: CGPoint { get set }
}

public enum MapCoordUnit {
    case Player, FtmanP1, FtmanP2, GruntP2, GruntHero, SpearP2, Void, PlyrFtman,
    TileGrass, OrcHutP2, GreatHallP2, OrcBarracks, OrcBlacksmith, OrcLumberMill, OrcWall, OrcWall_Horizontal;
    
    
    var Unit: AbstractUnit {
        get {
            switch (self) {

//            case .FtmanP1:
//                return FootmanUnit(player: 1)
            case .Player:
                return getPlayerUnit()
//            case .FtmanP2:
//                return SpellSwordUnit(player: 2)
            case .GruntP2:
                return GruntUnit(player: 2)
//            case .GruntHero:
//                return HeroGruntUnit(player: 2)
            case .SpearP2:
                return SpearThrowerUnit(player: 2)
//            case .OrcHutP2:
//                return OrcHut_Structure(player: 2)
//            case .GreatHallP2:
//                return OrcGreatHall_Structure(player: 2)
//            case .OrcBarracks:
//                return OrcBarracks_Structure(player: 2)
//            case .OrcBlacksmith:
//                return OrcBlacksmith_Structure(player: 2)
//            case .OrcLumberMill:
//                return OrcLumbermill_Structure(player: 2)
//            case .OrcWall:
//                return OrcWall_Structure(player: 2)
//            case .OrcWall_Horizontal:
//                return OrcWall_Horizontal_Structure(player: 2)
            default:
                return GruntUnit(player: 1)
            }
        }
    }

    
    func getPlayerUnit() -> AbstractUnit {
        let unit = HeroFootmanUnit(player: 1)
        unit.isPlayer = true
        return unit
    }
}



public enum MapCoordTile {
    case Grass, Void, Stone, Tree, Coast_BL, Coast_BR, Coast_B, Coast_L, Coast_R,
    Coast_UL, Coast_UR, Coast_U, Water, Dirt;
    
    
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
            case .Coast_BL:
                return SKCoast_L_()
            case .Coast_B:
                return SKCoast___()
            case .Coast_BR:
                return SKCoast__l()
            case .Coast_L:
                return SKCoast_I_()
            case .Coast_R:
                return SKCoast__I()
            case .Coast_UL:
                return SKCoast_TI()
            case .Coast_UR:
                return SKCoast_IT()
            case .Coast_U:
                return SKCoast_TT()
            case .Water:
                return SKWaterTile()
            case .Dirt:
                return SKDirtTile()
//            default:
//                return SKGroundTileGeneric()
            }
        }
    }
}