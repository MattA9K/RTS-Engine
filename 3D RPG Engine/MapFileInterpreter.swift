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
                } else if tile == "🅱" {
                    print(tile)
                    finalArray.append(SpearP2)
                } else if tile == "🅾" {
                    print(tile) // nigga
                    finalArray.append(GruntHero)
                } else if tile == "🆘" {
                    
                } else if tile == "🆎" {
                    
                } else if tile == "🈲" {
                    
                }
                
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
                } else if tile == "⬛️" {
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
                } else if tile == "⬇️" {
                    finalArray.append(C_B)
                } else if tile == "↘️" {
                    finalArray.append(C_BR)
                } else if tile == "➡️" {
                    finalArray.append(C_R)
                }
            }
            returnArray.append(finalArray)
        }
        
        //          TOP_LEFT                                                                                    BOTTOM_LEFT
        return returnArray
    }
    
}