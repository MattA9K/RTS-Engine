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
    
    var UnitsInMap = [AbstractUnit]()
    var TilesInMap = [SKSpriteNode]()

    
    
    func GetUnitsFromMap(mapName: String) -> [AbstractUnit] {
        let rows = MapFileInterpreter().getMapUnits(mapName)
        let MAP_HEIGHT = rows.count
        let MAP_WIDTH = rows[0].count
        var returnValue = [AbstractUnit]()
        
        var y = 1
        for entireRow in rows {
            var heightLevel: CGFloat = CGFloat(MAP_HEIGHT - y)
            
            var x = MAP_WIDTH
            for column in entireRow {
                var widthLevel: CGFloat = CGFloat(MAP_WIDTH - x)
                
                if column == MapCoordUnit.Void  {
                    
                }
                else {
                    let unit = column.Unit;
                    let startLocation = CGPointMake((widthLevel * 50), (heightLevel * 50));
                    (unit).sprite.position = startLocation
                    unit.positionLogical = startLocation
                    returnValue.append(unit)
                }
                x -= 1
            }
            print("")
            y += 1
        }
        return returnValue
    }
    
    
    func generateGameSceneBasedFromMap(mapName: String) -> [AbstractUnit] {
        
        return GetUnitsFromMap(mapName)

    }
    
    

    
    func generateGameTilesetForMap(mapName: String) {
        let rows = MapFileInterpreter().getMapTiles(mapName)
        let MAP_HEIGHT = rows.count
        let MAP_WIDTH = rows[0].count
        
        var y = 1
        for entireRow in rows {
            var heightLevel: CGFloat = CGFloat(MAP_HEIGHT - y)
            
            var x = MAP_WIDTH
            for column in entireRow {
                var widthLevel: CGFloat = CGFloat(MAP_WIDTH - x)
                
                
                if column == MapCoordTile.Void  {
                    
                }
                else {
                    let sprite = column.Tile.sprite
                    sprite.position = CGPointMake((widthLevel * 50), (heightLevel * 50));
                    appendTileToCoordinate(sprite);
                }
                
                
                x -= 1
            }
            print("")
            
            y += 1
        }
    }
    
    
    func appendTileToCoordinate(unit: SKSpriteNode) {
        TilesInMap.append(unit)
    }
}
