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
    
    func getMapUnits(mapName: String) -> [[MapCoordUnit]] {
        let Player = MapCoordUnit.Player;
        let FtmanP1 = MapCoordUnit.FtmanP1;
        let GruntP2 = MapCoordUnit.GruntP2;
        let SpearP2 = MapCoordUnit.SpearP2;
        let OrcHutP2 = MapCoordUnit.OrcHutP2;
        let GreatHallP2 = MapCoordUnit.GreatHallP2;
        let Void = MapCoordUnit.Void;
        let OrcBarracks = MapCoordUnit.OrcBarracks;
        let OrcWall = MapCoordUnit.OrcWall;
        let OrcWall_Horizontal = MapCoordUnit.OrcWall_Horizontal;
        let OrcBlacksmith = MapCoordUnit.OrcBlacksmith;
        let OrcLumberMill = MapCoordUnit.OrcLumberMill;
        let GruntHero = MapCoordUnit.GruntHero;
        let GruntRecruit = MapCoordUnit.GruntRP2;
        let GruntMarine = MapCoordUnit.GruntMP2;
        
        let GruntElite = MapCoordUnit.GruntElite;
        let SpearSuper = MapCoordUnit.SpearSuper;
        let SpearElite = MapCoordUnit.SpearElite;
        let FtmanMerc = MapCoordUnit.FtmanMerc;
        
        let GruntLvl3 = MapCoordUnit.GruntLvl3;
        
        let GruntLvl4 = MapCoordUnit.GruntLvl4;
        let Balrog = MapCoordUnit.Balrog;
        
        var RawMapData = ""
        if let filepath = NSBundle.mainBundle().pathForResource((mapName + "_units"), ofType: "txt") {
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
        
        let strings = RawMapData.componentsSeparatedByString("|")
        var returnArray = [[MapCoordUnit]]()
        for string in strings {
            let array = string.componentsSeparatedByString(",")
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
    
    func getMapTiles(mapName: String) -> [[MapCoordTile]] {
        let STONE = MapCoordTile.Stone;
        let 🌲 = MapCoordTile.Tree;
        let 🍃 = MapCoordTile.Grass;
        let 🌑 = MapCoordTile.Void;
//        let 🔆 = MapCoordTile.Void;
        
        
        let C_U = MapCoordTile.Coast_U;
        let C_UL = MapCoordTile.Coast_UL;
        let C_UR = MapCoordTile.Coast_UR;
        let C_L = MapCoordTile.Coast_L;
        let C_R = MapCoordTile.Coast_R;
        let C_BL = MapCoordTile.Coast_BL;
        let C_BR = MapCoordTile.Coast_BR;
        let C_B = MapCoordTile.Coast_B;
        
        let 🚰 = MapCoordTile.Water;
        let DIRT = MapCoordTile.Dirt;
        let SAND1 = MapCoordTile.Sand1;
        let SAND2 = MapCoordTile.Sand2;
        let SAND3 = MapCoordTile.Sand3;
        let SAND4 = MapCoordTile.Sand4;
        let SAND5 = MapCoordTile.Sand5;
        
        let stringTile1 = MapCoordTile.StringTile1;
        let stringTile2 = MapCoordTile.StringTile2;
        let stringTile3 = MapCoordTile.StringTile3;
        let stringTile4 = MapCoordTile.StringTile4;
        let stringTile5 = MapCoordTile.StringTile5;
        let stringTile6 = MapCoordTile.StringTile6;
        let stringTile7 = MapCoordTile.StringTile7;
        let stringTile8 = MapCoordTile.StringTile8;
        let stringTile9 = MapCoordTile.StringTile9;
        
        let tileBlocker1 = MapCoordTile.tileblockerTest1;
        let tileBlocker2 = MapCoordTile.tileblockerTest2;
        
        let AG_Vertical_Transition = MapCoordTile.AG_Vertical_Transition_GRASS_DIRT;
        let AG_Horizontal_Transition = MapCoordTile.AG_Horizontal_Transition_GRASS_DIRT;
        
        let AG_Vertical_Transition2 = MapCoordTile.AG_Vertical_Transition_DIRT_GRASS;
        let AG_Horizontal_Transition2 = MapCoordTile.AG_Horizontal_Transition_DIRT_GRASS;
        
        let AG_Dirt_GrassCorner_UL = MapCoordTile.AG_Dirt_GrassCorner_UL
        let AG_Dirt_GrassCorner_UR = MapCoordTile.AG_Dirt_GrassCorner_UR
        let AG_Dirt_GrassCorner_DL = MapCoordTile.AG_Dirt_GrassCorner_DL
        let AG_Dirt_GrassCorner_DR = MapCoordTile.AG_Dirt_GrassCorner_DR
        
        let AG_Grass_DirtCorner_UL = MapCoordTile.AG_Grass_DirtCorner_UL
        let AG_Grass_DirtCorner_UR = MapCoordTile.AG_Grass_DirtCorner_UR
        let AG_Grass_DirtCorner_DL = MapCoordTile.AG_Grass_DirtCorner_DL
        let AG_Grass_DirtCorner_DR = MapCoordTile.AG_Grass_DirtCorner_DR
        
        let AG_Grass_Plain = MapCoordTile.AG_Grass_Plain
        let AG_Dirt_Plain = MapCoordTile.AG_Dirt_Plain
        
        let AG_Coast_WaterUL = MapCoordTile.AG_Coast_WaterUL
        let AG_Coast_WaterUR = MapCoordTile.AG_Coast_WaterUR
        let AG_Coast_WaterDL = MapCoordTile.AG_Coast_WaterDL
        let AG_Coast_WaterDR = MapCoordTile.AG_Coast_WaterDR
        
        let AG_Coast_DirtUL = MapCoordTile.AG_Coast_DirtUL
        let AG_Coast_DirtUR = MapCoordTile.AG_Coast_DirtUR
        let AG_Coast_DirtDL = MapCoordTile.AG_Coast_DirtDL
        let AG_Coast_DirtDR = MapCoordTile.AG_Coast_DirtDR
        
        let AG_Coast_DirtU = MapCoordTile.AG_Coast_DirtU
        let AG_Coast_DirtD = MapCoordTile.AG_Coast_DirtD
        let AG_Coast_DirtL = MapCoordTile.AG_Coast_DirtL
        let AG_Coast_DirtR = MapCoordTile.AG_Coast_DirtR
        
        let AG_Water = MapCoordTile.AG_Water
        let AG_Coast_ReefU = MapCoordTile.AG_Coast_ReefU
        let AG_Water_Island_Tiny = MapCoordTile.AG_Water_Island_Tiny
        
        var RawMapData = ""
        if let filepath = NSBundle.mainBundle().pathForResource((mapName + "_tiles"), ofType: "txt") {
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
        
        
        let strings = RawMapData.componentsSeparatedByString("|")
        
        var returnArray = [[MapCoordTile]]()
        for string in strings {
            let array = string.componentsSeparatedByString(",")
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
    case Player, FtmanP1, FtmanP2, GruntP2, GruntHero, SpearP2, Void, PlyrFtman, GruntRP2, GruntMP2,
    TileGrass, OrcHutP2, GreatHallP2, OrcBarracks, OrcBlacksmith, OrcLumberMill, OrcWall, OrcWall_Horizontal,
    GruntElite, SpearElite, SpearSuper, FtmanMerc, GruntLvl3, GruntLvl4, Balrog;
    
    
    var Unit: AbstractUnit {
        get {
            switch (self) {
                
            case .FtmanP1:
                return FootmanUnit(player: 1)
                
            case .FtmanMerc:
                return FootmanMercUnit(player: 1)
                
            case .Player:
                return getPlayerUnit()
            case .GruntRP2:
                return GruntRecruitUnit(player: 2)
            case .SpearP2:
                return SpearThrowerUnit(player: 2)
            case .GruntMP2:
                return GruntMarineUnit(player: 2)
            case.SpearElite:
                return SpearThrowerEliteUnit(player: 2)
            case.SpearSuper:
                return SpearThrowerSuperUnit(player: 2)
            case.GruntElite:
                return GruntEliteUnit(player: 2)

            case .GruntLvl3:
                return GruntLvl3Unit(player: 2)
                
            case .GruntLvl4:
                return GruntLvl4Unit(player: 2)
            case .Balrog:
                return BalrogUnit(player: 2)
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
    case Grass, Void, Stone, Tree, Coast_BL, Coast_BR, Coast_B, Coast_L, Coast_R,
    Coast_UL, Coast_UR, Coast_U, Water, Dirt,
    Sand1, Sand2, Sand3, Sand4, Sand5, Sand6,
    
    StringTile1, StringTile2, StringTile3, StringTile4, StringTile5, StringTile6,
    StringTile7, StringTile8, StringTile9,
    
    // __________AG START__________
    AG_Grass_Plain, AG_Dirt_Plain,
    
    AG_Vertical_Transition_GRASS_DIRT, AG_Horizontal_Transition_GRASS_DIRT,
    AG_Vertical_Transition_DIRT_GRASS, AG_Horizontal_Transition_DIRT_GRASS,
    
    AG_Dirt_GrassCorner_UL, AG_Dirt_GrassCorner_UR,
    AG_Dirt_GrassCorner_DL, AG_Dirt_GrassCorner_DR,
    
    AG_Grass_DirtCorner_UL, AG_Grass_DirtCorner_UR,
    AG_Grass_DirtCorner_DL, AG_Grass_DirtCorner_DR,
    
    AG_Coast_WaterUL, AG_Coast_WaterUR,
    AG_Coast_WaterDL, AG_Coast_WaterDR,
    
    AG_Coast_DirtUL, AG_Coast_DirtUR,
    AG_Coast_DirtDL, AG_Coast_DirtDR,
    
    AG_Coast_DirtU, AG_Coast_DirtD,
    AG_Coast_DirtL, AG_Coast_DirtR,
    
    AG_Coast_ReefU, AG_Water_Island_Tiny, AG_Water,
    // ____________________________
    
    tileblockerTest1, tileblockerTest2;
    
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
            case .Sand1:
                return SKDesertTile1()
            case .Sand2:
                return SKDesertTile2()
            case .Sand3:
                return SKDesertTile3()
            case .Sand4:
                return SKDesertTile4()
            case .Sand5:
                return SKDesertTile5()
            case .Sand6:
                return SKDesertTile6()
                
            case .AG_Vertical_Transition_GRASS_DIRT:
                return SKAmazingGrassTile(imageNamed:"AG-grass|dirt")
            case .AG_Horizontal_Transition_GRASS_DIRT:
                return SKAmazingGrassTile(imageNamed:"AG-grass_dirt")
                
            case .AG_Vertical_Transition_DIRT_GRASS:
                return SKAmazingGrassTile(imageNamed:"AG-dirt|grass")
            case .AG_Horizontal_Transition_DIRT_GRASS:
                return SKAmazingGrassTile(imageNamed:"AG-dirt_grass")
                
            case .AG_Dirt_GrassCorner_UL:
                return SKAmazingGrassTile(imageNamed:"AG-dirt-grassUL")
            case .AG_Dirt_GrassCorner_UR:
                return SKAmazingGrassTile(imageNamed:"AG-dirt-grassUR")
            case .AG_Dirt_GrassCorner_DL:
                return SKAmazingGrassTile(imageNamed:"AG-dirt-grassDL")
            case .AG_Dirt_GrassCorner_DR:
                return SKAmazingGrassTile(imageNamed:"AG-dirt-grassDR")
                
            case .AG_Grass_DirtCorner_UL:
                return SKAmazingGrassTile(imageNamed:"AG-grass-dirtUL")
            case .AG_Grass_DirtCorner_UR:
                return SKAmazingGrassTile(imageNamed:"AG-grass-dirtUR")
            case .AG_Grass_DirtCorner_DL:
                return SKAmazingGrassTile(imageNamed:"AG-grass-dirtDL")
            case .AG_Grass_DirtCorner_DR:
                return SKAmazingGrassTile(imageNamed:"AG-grass-dirtDR")

            case .AG_Grass_Plain:
                return SKAmazingGrassTile(imageNamed:"AG-grass-plain")
            case .AG_Dirt_Plain:
                return SKAmazingGrassTile(imageNamed:"AG-dirt-plain")
                
            case .AG_Coast_DirtU:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-U")
            case .AG_Coast_DirtD:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-D")
            case .AG_Coast_DirtL:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-L")
            case .AG_Coast_DirtR:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-R")
                
            case .AG_Coast_WaterUL:
                return SKAmazingGrassTile(imageNamed:"AG-coast-water-UL")
            case .AG_Coast_WaterUR:
                return SKAmazingGrassTile(imageNamed:"AG-coast-water-UR")
            case .AG_Coast_WaterDL:
                return SKAmazingGrassTile(imageNamed:"AG-coast-water-DL")
            case .AG_Coast_WaterDR:
                return SKAmazingGrassTile(imageNamed:"AG-coast-water-DR")
                
            case .AG_Coast_DirtUL:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-UL")
            case .AG_Coast_DirtUR:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-UR")
            case .AG_Coast_DirtDL:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-DL")
            case .AG_Coast_DirtDR:
                return SKAmazingGrassTile(imageNamed:"AG-coast-dirt-DR")

            case .AG_Coast_ReefU:
                return SKAmazingGrassTile(imageNamed:"AG-coast-reef-U")
            case .AG_Water_Island_Tiny:
                return SKAmazingGrassTile(imageNamed:"AG-coast-lone-island")
            case .AG_Water:
                return SKAmazingGrassTile(imageNamed:"AG-water")
                
            case .StringTile1:
                return SKStringTile(imageID: "1")
            case .StringTile2:
                return SKStringTile(imageID: "2")
            case .StringTile3:
                return SKStringTile(imageID: "3")
            case .StringTile4:
                return SKStringTile(imageID: "4")
            case .StringTile5:
                return SKStringTile(imageID: "5")
            case .StringTile6:
                return SKStringTile(imageID: "6")
            case .StringTile7:
                return SKStringTile(imageID: "7")
            case .StringTile8:
                return SKStringTile(imageID: "8")
            case .StringTile9:
                return SKStringTile(imageID: "9")
                
            case .tileblockerTest1:
                return SKTileBlocker(imageNamed: "RadiusDummyB")
            case .tileblockerTest2:
                return SKTileBlocker(imageNamed: "RadiusDummyG")
            default:
                return SKGroundTileGeneric()
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
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKDirtTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "Dirt")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKDesertTile1: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert1")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}

class SKDesertTile2: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert2")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}

class SKDesertTile3: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert3")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}

class SKDesertTile4: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert4")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}
class SKDesertTile5: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert5")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}
class SKDesertTile6: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert6")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}

class SKAmazingGrassTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert5")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
    init(imageNamed: String) {
        super.init()
        let imageName = imageNamed
        sprite = SKSpriteNode(imageNamed: imageName)
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z + 1
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}

class SKStringTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert5")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
    init(imageID: String) {
        super.init()
        let imageName = "string-tile-" + imageID
        sprite = SKSpriteNode(imageNamed: imageName)
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}
class SKTileBlocker: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "desert5")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
    
    init(imageNamed: String) {
        super.init()
        let imageName = imageNamed
        sprite = SKSpriteNode(imageNamed: imageName)
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z + 1
        sprite.xScale = 1.0
        sprite.yScale = 1.0
    }
}





class SKCoast__I: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "|Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_I_: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "| Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_TT: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "T Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast___: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "_ Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_L_: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "I_ Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast__l: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "_lWater")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_TI: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "T| Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKCoast_IT: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "|T Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
        sprite.xScale = 0.7
        sprite.yScale = 0.7
    }
}

class SKWaterTile: SKGroundTileGeneric {
    override init() {
        super.init()
        sprite = SKSpriteNode(imageNamed: "Water")
        sprite.position = CGPoint(x:280, y:300)
        sprite.zPosition = SpritePositionZ.Tileset.Z
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
        sprite.zPosition = SpritePositionZ.SmallDoodad.Z
        sprite.xScale = 0.2
        sprite.yScale = 0.2
        self.sprite.name = "block doodad"
    }
}