//
//  GameMap.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


// Acts sort of like a JSON/XML to describe all units, doodads and tilesets put down for each GameScene.
// This is basically the game's "Map Editor"
class GameMap {
    
    var UnitsInMap = [Any]()
    var TilesInMap = [SKSpriteNode]()
    
    
    func generateGameSceneBasedFromMap() {
        
        let rows = getDefaultTileUnits()
        
        var rowI: CGFloat = 0;
        for row in rows {
            
            var colI: CGFloat = 0;
            for col in row {
                
                if col == MapCoordUnit.GruntP2 {
                    print("Unit found at: " + String(rowI * 50) + " " + String(colI * 50));
                    var unit = col.Unit;
                    (unit as! BaseUnit).sprite.position = CGPointMake((rowI*50),(colI*50));
                    (unit as! BaseUnit).sprite.name = String(rowI+colI) + String(NSDate());
                    appendUnitToCoordinate(unit as! BaseUnit);
                }
                else if col == MapCoordUnit.SpearP2 {
                    print("Unit found at: " + String(rowI * 50) + " " + String(colI * 50));
                    var unit = col.Unit;
                    (unit as! BaseUnit).sprite.position = CGPointMake((rowI*50),(colI*50));
                    (unit as! BaseUnit).sprite.name = String(rowI+colI) + String(NSDate());
                    appendUnitToCoordinate(unit as! BaseUnit);
                }
                else if col == MapCoordUnit.OrcHutP2 {
                    print("Unit found at: " + String(rowI * 50) + " " + String(colI * 50));
                    var unit = col.Unit;
                    (unit as! BaseStructure).sprite.position = CGPointMake((rowI*50),(colI*50));
                    (unit as! BaseStructure).sprite.name = String(rowI+colI) + String(NSDate());
                    appendUnitToCoordinate(unit as! BaseStructure);
                }
                else if col == MapCoordUnit.GreatHallP2 {
                    print("Unit found at: " + String(rowI * 50) + " " + String(colI * 50));
                    var unit = col.Unit;
                    (unit as! BaseStructure).sprite.position = CGPointMake((rowI*50),(colI*50));
                    (unit as! BaseStructure).sprite.name = String(rowI+colI) + String(NSDate());
                    appendUnitToCoordinate(unit as! BaseStructure);
                }
                
                colI += 1;
            }
            rowI += 1;
        }
    }
    
    
    func appendUnitToCoordinate(unit: Any) {
        UnitsInMap.append(unit)
    }
    
    
    
    
    
    
    
    
    func generateGameTilesetSceneBasedFromMap() {
        
        let rows = getDefaultTileMap()
        
        
        var rowI: CGFloat = 0;
        for row in rows {
            
            var colI: CGFloat = 0;
            for col in row {
                
                if col == MapCoordTile.Grass {
                    print("Unit found at: " + String(rowI * 50) + " " + String(colI * 50));
                    let sprite = col.Tile.sprite
                    sprite.position = CGPoint(x:(rowI * 50), y:(colI * 50))
                    appendTileToCoordinate(sprite);
                }
                
                if col == MapCoordTile.Stone {
                    print("Unit found at: " + String(rowI * 50) + " " + String(colI * 50));
                    let sprite = col.Tile.sprite
                    sprite.position = CGPoint(x:(rowI * 50), y:(colI * 50))
                    appendTileToCoordinate(sprite);
                }
                
                if col == MapCoordTile.Tree {
                    print("Unit found at: " + String(rowI * 50) + " " + String(colI * 50));
                    let sprite = col.Tile.sprite
                    sprite.position = CGPoint(x:(rowI * 50), y:(colI * 50))
                    appendTileToCoordinate(sprite);
                }
                
                colI += 1;
            }
            rowI += 1;
        }
    }
    
    
    func appendTileToCoordinate(unit: SKSpriteNode) {
        TilesInMap.append(unit)
    }
}



class PlayableUnit {
    
}


/*
 // can't get this shit to work, flip this grid
 //          TOP_RIGHT                                                                                  BOTTOM_RIGHT
 let row01 = [🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃];
 let row02 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row03 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row04 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row05 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row06 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row07 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row08 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row09 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row10 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🔆,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row11 = [🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃];
 let row12 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row13 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row14 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row15 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row16 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row17 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row18 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row19 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row20 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row21 = [🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃];
 let row22 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row23 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row24 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row25 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row26 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row27 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row28 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row29 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row30 = [🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑];
 let row31 = [🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🌑,🍃];
 //          TOP_LEFT                                                                                    BOTTOM_LEFT
 
 let rows = [row31,row30,row29,row28,row27,row26,row25,row24,row23,row22,row21,row20,row19,row18,row17,row16,row15,row14,row13,row12,row11,row10,row09,row08,row07,row06,row05,row04,row03,row02,row01];
 */