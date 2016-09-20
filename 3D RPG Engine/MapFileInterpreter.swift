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
                } else if tile == "🚹" {
                    print(tile)
                    finalArray.append(FtmanP1)
                } else if tile == "✴️" {
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
                } else if tile == "🔴" {
                    finalArray.append(OrcWall)
                } else if tile == "⭕️" {
                    finalArray.append(GruntRecruit)
                } else if tile == "☢️" {
                    finalArray.append(GruntMarine)
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
        let SAND6 = MapCoordTile.Sand6;
        
        
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
// -----------------------------------------------------------------
// -----------------------------------------------------------------

protocol StartingUnits {
    var startLocation: CGPoint { get set }
}

public enum MapCoordUnit {
    case Player, FtmanP1, FtmanP2, GruntP2, GruntHero, SpearP2, Void, PlyrFtman, GruntRP2, GruntMP2,
    TileGrass, OrcHutP2, GreatHallP2, OrcBarracks, OrcBlacksmith, OrcLumberMill, OrcWall, OrcWall_Horizontal,
    GruntElite, SpearElite, SpearSuper;
    
    
    var Unit: AbstractUnit {
        get {
            switch (self) {
                
            case .FtmanP1:
                return FootmanUnit(player: 1)
            case .Player:
                return getPlayerUnit()
                //            case .FtmanP2:
            //                return SpellSwordUnit(player: 2)
            case .GruntP2:
                return GruntUnit(player: 2)
            case .GruntRP2:
                return GruntRecruitUnit(player: 2)
                //            case .GruntHero:
            //                return HeroGruntUnit(player: 2)
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
    Coast_UL, Coast_UR, Coast_U, Water, Dirt,
    Sand1, Sand2, Sand3, Sand4, Sand5, Sand6;
    
    
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
        
    }
}