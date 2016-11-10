//
//  MapFileInterpreter.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/20/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



struct MapFileInterpreter {
    
    func getMapUnits(_ mapName: String) -> [[MapCoordUnit]] {
        let Player = MapCoordUnit.player;
        let FtmanP1 = MapCoordUnit.ftmanP1;
        let GruntP2 = MapCoordUnit.gruntP2;
        let SpearP2 = MapCoordUnit.spearP2;
        let OrcHutP2 = MapCoordUnit.orcHutP2;
        let GreatHallP2 = MapCoordUnit.greatHallP2;
        let Void = MapCoordUnit.void;
        let OrcBarracks = MapCoordUnit.orcBarracks;
        let OrcBlacksmith = MapCoordUnit.orcBlacksmith;
        let GruntHero = MapCoordUnit.gruntHero;
        let GruntRecruit = MapCoordUnit.gruntRP2;
        let GruntMarine = MapCoordUnit.gruntMP2;
        
        let GruntElite = MapCoordUnit.gruntElite;
        let SpearSuper = MapCoordUnit.spearSuper;
        let SpearElite = MapCoordUnit.spearElite;
        let FtmanMerc = MapCoordUnit.ftmanMerc;
        
        let GruntLvl3 = MapCoordUnit.gruntLvl3;
        
        let GruntLvl4 = MapCoordUnit.gruntLvl4;
        let Balrog = MapCoordUnit.balrog;
        
        var RawMapData = ""
        if let filepath = Bundle.main.path(forResource: (mapName + "_units"), ofType: "txt") {
            do {
                let contents = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
                print("|||" + contents + "|||")
                RawMapData = contents
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        
        let strings = RawMapData.components(separatedBy: "|")
        var returnArray = [[MapCoordUnit]]()
        for string in strings {
            let array = string.components(separatedBy: ",")
            var finalArray = [MapCoordUnit]()

            for tile in array {
                if tile == "🌑" {
                    finalArray.append(Void)
                }
                else if tile == "🅰" {
                    print(tile)
                    finalArray.append(GruntP2)
                } else if tile == "🅿️" {
                    print(tile)
                    finalArray.append(Player)
                }
                else if tile == "🚹" {
                    print(tile)
                    finalArray.append(FtmanP1)
                }
                else if tile == "🛃" {
                    print(tile)
                    finalArray.append(FtmanMerc)
                }
                    
                else if tile == "✴️" {
                    print(tile)
                    finalArray.append(SpearP2)
                } else if tile == "🅾" {
                    print(tile) // nigga
                    finalArray.append(GruntHero)
                } else if tile == "🆘" {
                    finalArray.append(OrcBlacksmith)
                } else if tile == "🆎" {
                    finalArray.append(OrcBarracks)
                } else if tile == "🈲" {
                    finalArray.append(OrcHutP2)
                } else if tile == "🈴" {
                    finalArray.append(GreatHallP2)
//                } else if tile == "🔴" {
//                    finalArray.append(OrcWall)
                } else if tile == "⭕️" {
                    finalArray.append(GruntRecruit)
                } else if tile == "☢️" {
                    finalArray.append(GruntMarine)
                }
                else if tile == "🔴" {
                    finalArray.append(GruntLvl3)
                }
                    
                else if tile == "♦️" {
                    finalArray.append(SpearElite)
                }
                
                else if tile == "🔶" {
                    finalArray.append(SpearSuper)
                }
                
                else if tile == "❌" {
                    finalArray.append(GruntElite)
                }
                
                else if tile == "😈" {
                    finalArray.append(Balrog)
                }
                else if tile == "📛" {
                    finalArray.append(GruntLvl4)
                }
            
                // GruntMarine
            }
            returnArray.append(finalArray)
        }
        
        //          TOP_LEFT                                                                                    BOTTOM_LEFT
        
        return returnArray
    }
    
    func getMapTiles(_ mapName: String) -> [[MapCoordTile]] {
        let STONE = MapCoordTile.stone;
        let 🌲 = MapCoordTile.tree;
        let 🍃 = MapCoordTile.grass;
        let 🌑 = MapCoordTile.void;
//        let 🔆 = MapCoordTile.Void;
        
        
        let C_U = MapCoordTile.coast_U;
        let C_UL = MapCoordTile.coast_UL;
        let C_UR = MapCoordTile.coast_UR;
        let C_L = MapCoordTile.coast_L;
        let C_R = MapCoordTile.coast_R;
        let C_BL = MapCoordTile.coast_BL;
        let C_BR = MapCoordTile.coast_BR;
        let C_B = MapCoordTile.coast_B;
        
        let 🚰 = MapCoordTile.water;
        let DIRT = MapCoordTile.dirt;
        let SAND1 = MapCoordTile.sand1;
        let SAND2 = MapCoordTile.sand2;
        let SAND3 = MapCoordTile.sand3;
        let SAND4 = MapCoordTile.sand4;
        let SAND5 = MapCoordTile.sand5;
        
        let stringTile1 = MapCoordTile.stringTile1;
        let stringTile2 = MapCoordTile.stringTile2;
        let stringTile3 = MapCoordTile.stringTile3;

        
        let tileBlocker1 = MapCoordTile.tileblockerTest1;
        let tileBlocker2 = MapCoordTile.tileblockerTest2;
        
        let AG_Vertical_Transition = MapCoordTile.ag_Vertical_Transition_GRASS_DIRT;
        let AG_Horizontal_Transition = MapCoordTile.ag_Horizontal_Transition_GRASS_DIRT;
        
        let AG_Vertical_Transition2 = MapCoordTile.ag_Vertical_Transition_DIRT_GRASS;
        let AG_Horizontal_Transition2 = MapCoordTile.ag_Horizontal_Transition_DIRT_GRASS;
        
        let AG_Dirt_GrassCorner_UL = MapCoordTile.ag_Dirt_GrassCorner_UL
        let AG_Dirt_GrassCorner_UR = MapCoordTile.ag_Dirt_GrassCorner_UR
        let AG_Dirt_GrassCorner_DL = MapCoordTile.ag_Dirt_GrassCorner_DL
        let AG_Dirt_GrassCorner_DR = MapCoordTile.ag_Dirt_GrassCorner_DR
        
        let AG_Grass_DirtCorner_UL = MapCoordTile.ag_Grass_DirtCorner_UL
        let AG_Grass_DirtCorner_UR = MapCoordTile.ag_Grass_DirtCorner_UR
        let AG_Grass_DirtCorner_DL = MapCoordTile.ag_Grass_DirtCorner_DL
        let AG_Grass_DirtCorner_DR = MapCoordTile.ag_Grass_DirtCorner_DR
        
        let AG_Grass_Plain = MapCoordTile.ag_Grass_Plain
        let AG_Dirt_Plain = MapCoordTile.ag_Dirt_Plain
        
        let AG_Coast_WaterUL = MapCoordTile.ag_Coast_WaterUL
        let AG_Coast_WaterUR = MapCoordTile.ag_Coast_WaterUR
        let AG_Coast_WaterDL = MapCoordTile.ag_Coast_WaterDL
        let AG_Coast_WaterDR = MapCoordTile.ag_Coast_WaterDR
        
        let AG_Coast_DirtUL = MapCoordTile.ag_Coast_DirtUL
        let AG_Coast_DirtUR = MapCoordTile.ag_Coast_DirtUR
        let AG_Coast_DirtDL = MapCoordTile.ag_Coast_DirtDL
        let AG_Coast_DirtDR = MapCoordTile.ag_Coast_DirtDR
        
        let AG_Coast_DirtU = MapCoordTile.ag_Coast_DirtU
        let AG_Coast_DirtD = MapCoordTile.ag_Coast_DirtD
        let AG_Coast_DirtL = MapCoordTile.ag_Coast_DirtL
        let AG_Coast_DirtR = MapCoordTile.ag_Coast_DirtR
        
        let AG_Water = MapCoordTile.ag_Water
        let AG_Coast_ReefU = MapCoordTile.ag_Coast_ReefU
        let AG_Water_Island_Tiny = MapCoordTile.ag_Water_Island_Tiny
        
        var RawMapData = ""
        if let filepath = Bundle.main.path(forResource: (mapName + "_tiles"), ofType: "txt") {
            do {
                let contents = try NSString(contentsOfFile: filepath, usedEncoding: nil) as String
                print("|||" + contents + "|||")
                RawMapData = contents
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        
        
        let strings = RawMapData.components(separatedBy: "|")
        
        var returnArray = [[MapCoordTile]]()
        for string in strings {
            let array = string.components(separatedBy: ",")
            var finalArray = [MapCoordTile]()
            for tile in array {
                if tile == "🌑" {
                    finalArray.append(🌑)
                } else if tile == "✳️" {
                    finalArray.append(🍃)
                } else if tile == "🌲" {
                    finalArray.append(🌲)
                } else if tile == "⚪️" {
                    finalArray.append(STONE)
                } else if tile == "🔲" {
                    finalArray.append(DIRT)
                } else if tile == "🚰" {
                    finalArray.append(🚰)
                } else if tile == "C_UL" {
                    finalArray.append(C_UL)
                } else if tile == "⬆️" {
                    finalArray.append(C_U)
                } else if tile == "⬅️" {
                    finalArray.append(C_L)
                } else if tile == "↗️" {
                    finalArray.append(C_UR)
                }
                else if tile == "↙️" {
                    finalArray.append(C_BL)
                }
                else if tile == "⬇️" {
                    finalArray.append(C_B)
                }
                else if tile == "↘️" {
                    finalArray.append(C_BR)
                }
                else if tile == "➡️" {
                    finalArray.append(C_R)
                }
                
                else if tile == "🎾" {
                    finalArray.append(stringTile1)
                }
                else if tile == "☮️" {
                    finalArray.append(stringTile2)
                }
                else if tile == "✝️" {
                    finalArray.append(stringTile3)
                }
                
                else if tile == "🅰️" {
                    finalArray.append(AG_Vertical_Transition)
                }
                else if tile == "🅾️" {
                    finalArray.append(AG_Vertical_Transition2)
                }
                else if tile == "🅱️" {
                    finalArray.append(AG_Horizontal_Transition)
                }
                else if tile == "🆘" {
                    finalArray.append(AG_Horizontal_Transition2)
                }
                    
                else if tile == "0️⃣" {
                    finalArray.append(AG_Dirt_GrassCorner_DR)
                }
                else if tile == "1️⃣" {
                    
                    finalArray.append(AG_Dirt_GrassCorner_DL)
                }
                else if tile == "2️⃣" {
                    finalArray.append(AG_Dirt_GrassCorner_UR)
                }
                else if tile == "3️⃣" {
                    finalArray.append(AG_Dirt_GrassCorner_UL)
                }
                    // =======================================
                else if tile == "4️⃣" {
                    finalArray.append(AG_Grass_DirtCorner_DR)
                }
                else if tile == "5️⃣" {
                    
                    finalArray.append(AG_Grass_DirtCorner_DL)
                }
                else if tile == "6️⃣" {
                    finalArray.append(AG_Grass_DirtCorner_UR)
                }
                else if tile == "7️⃣" {
                    finalArray.append(AG_Grass_DirtCorner_UL)
                }
                
                else if tile == "❇️" {
                    finalArray.append(AG_Grass_Plain)
                }
                else if tile == "💩" {
                    finalArray.append(AG_Dirt_Plain)
                }
                
                    
                else if tile == "🕘" {
                    finalArray.append(AG_Coast_WaterUL)
                }
                else if tile == "🕒" {
                    
                    finalArray.append(AG_Coast_WaterUR)
                }
                else if tile == "🕤" {
                    finalArray.append(AG_Coast_WaterDL)
                }
                else if tile == "🕞" {
                    finalArray.append(AG_Coast_WaterDR)
                }
                    
                    
                else if tile == "💛" {
                    finalArray.append(AG_Coast_DirtUL)
                }
                else if tile == "💚" {
                    
                    finalArray.append(AG_Coast_DirtUR)
                }
                else if tile == "💙" {
                    finalArray.append(AG_Coast_DirtDL)
                }
                else if tile == "💜" {
                    finalArray.append(AG_Coast_DirtDR)
                }
                    
                    
                else if tile == "🔼" {
                    finalArray.append(AG_Coast_DirtU)
                }
                else if tile == "🔽" {
                    
                    finalArray.append(AG_Coast_DirtD)
                }
                else if tile == "◀️" {
                    finalArray.append(AG_Coast_DirtL)
                }
                else if tile == "▶️" {
                    finalArray.append(AG_Coast_DirtR)
                }
                    
                    
                    
                
                else if tile == "🏝" {
                    finalArray.append(AG_Water_Island_Tiny)
                }
                else if tile == "⚓️" {
                    finalArray.append(AG_Coast_ReefU)
                }
                else if tile == "🌊" {
                    finalArray.append(AG_Water)
                }
                    
                else if tile == "🇹🇹" {
                    finalArray.append(tileBlocker1)
                }
                else if tile == "🇨🇭" {
                    finalArray.append(tileBlocker2)
                }
                    
                else if tile == "🏜" {
                    finalArray.append(SAND2)
                }
                
                else if tile == "🌵" {
                    finalArray.append(SAND1)
                }
                else if tile == "🌋" {
                    finalArray.append(SAND3)
                }
                else if tile == "🗾" {
                    finalArray.append(SAND4)
                }
                else if tile == "🏕" {
                    finalArray.append(SAND5)
                }

            }
            returnArray.append(finalArray)
        }
        // 🌋🗾🏕🌠
        //          TOP_LEFT                                                                                    BOTTOM_LEFT
        return returnArray
    }
    
}

// -----------------------------------------------------------------
// ----------------------------------------------------------------- 🅾️
// -----------------------------------------------------------------

protocol StartingUnits {
    var startLocation: CGPoint { get set }
}

public enum MapCoordUnit {
    case player, ftmanP1, ftmanP2, gruntP2, gruntHero, spearP2, void, plyrFtman, gruntRP2, gruntMP2,
    tileGrass, orcHutP2, greatHallP2, orcBarracks, orcBlacksmith, orcLumberMill, orcWall, orcWall_Horizontal,
    gruntElite, spearElite, spearSuper, ftmanMerc, gruntLvl3, gruntLvl4, balrog;
    
    
    var Unit: AbstractUnit {
        get {
            switch (self) {
                
            case .ftmanP1:
                return FootmanUnit(player: 1)
                
            case .ftmanMerc:
                return FootmanMercUnit(player: 1)
                
            case .player:
                return getPlayerUnit()
            case .gruntRP2:
                return GruntRecruitUnit(player: 2)
            case .spearP2:
                return SpearThrowerUnit(player: 2)
            case .gruntMP2:
                return GruntMarineUnit(player: 2)
            case.spearElite:
                return SpearThrowerEliteUnit(player: 2)
            case.spearSuper:
                return SpearThrowerSuperUnit(player: 2)
            case.gruntElite:
                return GruntEliteUnit(player: 2)

            case .gruntLvl3:
                return GruntLvl3Unit(player: 2)
                
            case .gruntLvl4:
                return GruntLvl4Unit(player: 2)
            case .balrog:
                return BalrogUnit(player: 1)
            default:
                return GruntEliteUnit(player: 1)
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
    case grass, void, stone, tree, coast_BL, coast_BR, coast_B, coast_L, coast_R,
    coast_UL, coast_UR, coast_U, water, dirt,
    sand1, sand2, sand3, sand4, sand5, sand6,
    
    stringTile1, stringTile2, stringTile3, stringTile4, stringTile5, stringTile6,
    stringTile7, stringTile8, stringTile9,
    
    // __________AG START__________
    ag_Grass_Plain, ag_Dirt_Plain,
    
    ag_Vertical_Transition_GRASS_DIRT, ag_Horizontal_Transition_GRASS_DIRT,
    ag_Vertical_Transition_DIRT_GRASS, ag_Horizontal_Transition_DIRT_GRASS,
    
    ag_Dirt_GrassCorner_UL, ag_Dirt_GrassCorner_UR,
    ag_Dirt_GrassCorner_DL, ag_Dirt_GrassCorner_DR,
    
    ag_Grass_DirtCorner_UL, ag_Grass_DirtCorner_UR,
    ag_Grass_DirtCorner_DL, ag_Grass_DirtCorner_DR,
    
    ag_Coast_WaterUL, ag_Coast_WaterUR,
    ag_Coast_WaterDL, ag_Coast_WaterDR,
    
    ag_Coast_DirtUL, ag_Coast_DirtUR,
    ag_Coast_DirtDL, ag_Coast_DirtDR,
    
    ag_Coast_DirtU, ag_Coast_DirtD,
    ag_Coast_DirtL, ag_Coast_DirtR,
    
    ag_Coast_ReefU, ag_Water_Island_Tiny, ag_Water,
    // ____________________________
    
    tileblockerTest1, tileblockerTest2;
    
    var Tile: SKGroundTileGeneric {
        get {
            switch (self) {
            case .grass:
                return SKGrassTile()
            case .void:
                return SKGrassTile()
            case .stone:
                return SKDoodadStone()
            case .tree:
                return SKDoodadTree()
            case .coast_BL:
                return SKCoast_L_()
            case .coast_B:
                return SKCoast___()
            case .coast_BR:
                return SKCoast__l()
            case .coast_L:
                return SKCoast_I_()
            case .coast_R:
                return SKCoast__I()
            case .coast_UL:
                return SKCoast_TI()
            case .coast_UR:
                return SKCoast_IT()
            case .coast_U:
                return SKCoast_TT()
            case .water:
                return SKWaterTile()
            case .dirt:
                return SKDirtTile()
            case .sand1:
                return SKDesertTile1()
            case .sand2:
                return SKDesertTile2()
            case .sand3:
                return SKDesertTile3()
            case .sand4:
                return SKDesertTile4()
            case .sand5:
                return SKDesertTile5()
            case .sand6:
                return SKDesertTile6()
                
            case .ag_Vertical_Transition_GRASS_DIRT:
                return SKAmazingGrassTile(imageNamed:"AG-grass|dirt")
            case .ag_Horizontal_Transition_GRASS_DIRT:
                return SKAmazingGrassTile(imageNamed:"AG-grass_dirt")
                
            case .ag_Vertical_Transition_DIRT_GRASS:
                return SKAmazingGrassTile(imageNamed:"AG-dirt|grass")
            case .ag_Horizontal_Transition_DIRT_GRASS:
                return SKAmazingGrassTile(imageNamed:"AG-dirt_grass")
                
            case .ag_Dirt_GrassCorner_UL:
                return SKAmazingGrassTile(imageNamed:"AG-dirt-grassUL")
            case .ag_Dirt_GrassCorner_UR:
                return SKAmazingGrassTile(imageNamed:"AG-dirt-grassUR")
            case .ag_Dirt_GrassCorner_DL:
                return SKAmazingGrassTile(imageNamed:"AG-dirt-grassDL")
            case .ag_Dirt_GrassCorner_DR:
                return SKAmazingGrassTile(imageNamed:"AG-dirt-grassDR")
                
            case .ag_Grass_DirtCorner_UL:
                return SKAmazingGrassTile(imageNamed:"AG-grass-dirtUL")
            case .ag_Grass_DirtCorner_UR:
                return SKAmazingGrassTile(imageNamed:"AG-grass-dirtUR")
            case .ag_Grass_DirtCorner_DL:
                return SKAmazingGrassTile(imageNamed:"AG-grass-dirtDL")
            case .ag_Grass_DirtCorner_DR:
                return SKAmazingGrassTile(imageNamed:"AG-grass-dirtDR")

            case .ag_Grass_Plain:
                return SKAmazingGrassTile(imageNamed:"AG-grass-plain")
            case .ag_Dirt_Plain:
                return SKAmazingGrassTile(imageNamed:"AG-dirt-plain")
                
            case .ag_Coast_DirtU:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-U")
            case .ag_Coast_DirtD:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-D")
            case .ag_Coast_DirtL:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-L")
            case .ag_Coast_DirtR:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-R")
                
            case .ag_Coast_WaterUL:
                return SKAmazingGrassTile(imageNamed:"AG-coast-water-UL")
            case .ag_Coast_WaterUR:
                return SKAmazingGrassTile(imageNamed:"AG-coast-water-UR")
            case .ag_Coast_WaterDL:
                return SKAmazingGrassTile(imageNamed:"AG-coast-water-DL")
            case .ag_Coast_WaterDR:
                return SKAmazingGrassTile(imageNamed:"AG-coast-water-DR")
                
            case .ag_Coast_DirtUL:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-UL")
            case .ag_Coast_DirtUR:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-UR")
            case .ag_Coast_DirtDL:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-DL")
            case .ag_Coast_DirtDR:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-DR")

            case .ag_Coast_ReefU:
                return SKAmazingGrassTile(imageNamed:"AG-coast-reef-U")
            case .ag_Water_Island_Tiny:
                return SKAmazingGrassTile(imageNamed:"AG-coast-lone-island")
            case .ag_Water:
                return SKAmazingGrassTile(imageNamed:"AG-water")
                
            case .stringTile1:
                return SKStringTile(imageID: "1")
            case .stringTile2:
                return SKStringTile(imageID: "2")
            case .stringTile3:
                return SKStringTile(imageID: "3")
            case .stringTile4:
                return SKStringTile(imageID: "4")
            case .stringTile5:
                return SKStringTile(imageID: "5")
            case .stringTile6:
                return SKStringTile(imageID: "6")
            case .stringTile7:
                return SKStringTile(imageID: "7")
            case .stringTile8:
                return SKStringTile(imageID: "8")
            case .stringTile9:
                return SKStringTile(imageID: "9")
                
            case .tileblockerTest1:
                return SKTileBlocker(imageNamed: "RadiusDummyB")
            case .tileblockerTest2:
                return SKTileBlocker(imageNamed: "RadiusDummyG")
//            default:
//                return SKGroundTileGeneric()
            }
        }
    }
}

// -----------------------------------------------------------------
// -----------------------------------------------------------------
// -----------------------------------------------------------------

class SKGroundTileGeneric {
    var sprite: SKSpriteNode!
    init() {
        sprite = SKSpriteNode()
    }
}

class SKGrassTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "Grass")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKDirtTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "Dirt")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKDesertTile1: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert1")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}

class SKDesertTile2: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert2")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}

class SKDesertTile3: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert3")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}

class SKDesertTile4: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert4")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}
class SKDesertTile5: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert5")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}
class SKDesertTile6: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert6")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}

class SKAmazingGrassTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert5")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
        
    }
    init(imageNamed: String) {
        super.init()
        let imageName = imageNamed
        sprite = SKSpriteNode(imageNamed: imageName)
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z + 1
        sprite.xScale = 1.0
        sprite.yScale = 1.0
//        sprite.alpha = 0.45
    }
}

class SKStringTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert5")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
    init(imageID: String) {
        super.init()
        let imageName = "string-tile-" + imageID
        sprite = SKSpriteNode(imageNamed: imageName)
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}
class SKTileBlocker: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert5")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
    
    init(imageNamed: String) {
        super.init()
        let imageName = imageNamed
        sprite = SKSpriteNode(imageNamed: imageName)
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z + 1
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}





class SKCoast__I: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "|Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_I_: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "| Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_TT: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "T Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast___: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "_ Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_L_: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "I_ Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast__l: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "_lWater")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_TI: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "T| Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_IT: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "|T Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKWaterTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}


class SKDoodadStone: SKGroundTileGeneric {
    override init() {
        super.init()
        let imageName = ("stone-" + String(arc4random_uniform(3) + 1))
        print(imageName)
        sprite = SKDoodadBlocker(imageNamed: imageName)
        //        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = 12//SpritePositionZ.SmallDoodad.Z
        sprite.xScale = 0.2
        sprite.yScale = 0.2
        self.sprite.name = "block doodad"
    }
}

class SKDoodadTree: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKDoodadBlocker(imageNamed: ("tree-" + String(arc4random_uniform(4) + 1)))
        //        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.smallDoodad.Z
        sprite.xScale = 0.2
        sprite.yScale = 0.2
        self.sprite.name = "block doodad"
    }
}
