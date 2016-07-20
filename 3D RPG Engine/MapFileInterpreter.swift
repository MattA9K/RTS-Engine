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
        let 😇 = MapCoordUnit.Player;
        let 😊 = MapCoordUnit.FtmanP1;
        let 😈 = MapCoordUnit.GruntP2;
        let 👺 = MapCoordUnit.SpearP2;
        let 🔻 = MapCoordUnit.OrcHutP2;
        let 🔶 = MapCoordUnit.GreatHallP2;
        let 🌑 = MapCoordUnit.Void;
        let 🔷 = MapCoordUnit.OrcBarracks;
        let 🔴 = MapCoordUnit.OrcWall;
        let 🔸 = MapCoordUnit.OrcWall_Horizontal;
        let 🔵 = MapCoordUnit.OrcBlacksmith;
        let 💎 = MapCoordUnit.OrcLumberMill;
        
        
        
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
                    finalArray.append(🌑)
                }
                else if tile == "😈" {
                    print(tile)
                    finalArray.append(😈)
                } else if tile == "😇" {
                    print(tile)
                    finalArray.append(😇)
                } else if tile == "😊" {
                    print(tile)
                    finalArray.append(😊)
                } else if tile == "🔶" {
                    print(tile)
                    finalArray.append(🔶)
                } else if tile == "🔷" {
                    print(tile)
                    finalArray.append(🔷)
                } else if tile == "🔴" {
                    print(tile)
                    finalArray.append(🔴)
                } else if tile == "🔵" {
                    print(tile)
                    finalArray.append(🔵)
                } else if tile == "💎" {
                    print(tile)
                    finalArray.append(💎)
                } else if tile == "👺" {
                    print(tile)
                    finalArray.append(👺)
                } else if tile == "🔸" {
                    print(tile)
                    finalArray.append(🔸)
                }
                
            }
            returnArray.append(finalArray)
        }
        
        //          TOP_LEFT                                                                                    BOTTOM_LEFT
        
        return returnArray
    }
    
    func getMapTiles(mapName: String) -> [[MapCoordTile]] {
        let 🐚 = MapCoordTile.Stone;
        let 🌲 = MapCoordTile.Tree;
        let 🍃 = MapCoordTile.Grass;
        let 🌑 = MapCoordTile.Void;
        let 🔆 = MapCoordTile.Void;
        
        let 😸 = MapCoordTile.Coast_U;
        let 😹 = MapCoordTile.Coast_UL;
        let 😺 = MapCoordTile.Coast_UR;
        let 😻 = MapCoordTile.Coast_L;
        let 😼 = MapCoordTile.Coast_R;
        let 😽 = MapCoordTile.Coast_BL;
        let 😾 = MapCoordTile.Coast_BR;
        let 😿 = MapCoordTile.Coast_B;
        let 🚰 = MapCoordTile.Water;
        let 🚪 = MapCoordTile.Dirt;
        
        
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
                } else if tile == "🍃" {
                    finalArray.append(🍃)
                } else if tile == "🚪" {
                    finalArray.append(🚪)
                } else if tile == "🚰" {
                    finalArray.append(🚰)
                } else if tile == "😹" {
                    finalArray.append(😹)
                } else if tile == "😸" {
                    finalArray.append(😸)
                } else if tile == "😻" {
                    finalArray.append(😻)
                } else if tile == "😺" {
                    finalArray.append(😺)
                }
                else if tile == "😽" {
                    finalArray.append(😽)
                } else if tile == "😿" {
                    finalArray.append(😿)
                } else if tile == "😾" {
                    finalArray.append(😾)
                } else if tile == "😼" {
                    finalArray.append(😼)
                }
            }
            returnArray.append(finalArray)
        }
        
        //          TOP_LEFT                                                                                    BOTTOM_LEFT
        return returnArray
    }
    
}