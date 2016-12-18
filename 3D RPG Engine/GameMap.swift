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

    var allUnitGuids = [UUID]()
    
    func GetUnitsFromMap(_ mapName: String) -> [UUID:AbstractUnit] {
        let rows = MapFileInterpreter().getMapUnits(mapName)
        let MAP_HEIGHT = rows.count
        let MAP_WIDTH = rows[0].count
        var returnValue = [UUID:AbstractUnit]()
        
        var y = 1
        for entireRow in rows {
            var heightLevel: CGFloat = CGFloat(MAP_HEIGHT - y)
            
            var x = MAP_WIDTH
            for column in entireRow {
                var widthLevel: CGFloat = CGFloat(MAP_WIDTH - x)
                
                if column == MapCoordUnit.void  {
                    
                }
                else {
                    let unit = column.Unit;
                    let startLocation = CGPoint(x: (widthLevel * 50), y: (heightLevel * 50));
                    (unit).sprite.position = startLocation
                    unit.positionLogical = startLocation
                    unit.initMovementBlocker()
                    returnValue[unit.uuid] = unit
                    allUnitGuids.append(unit.uuid)
                }
                x -= 1
            }
            print("")
            y += 1
        }
        return returnValue
    }
    
    
    func generateGameSceneBasedFromMap(_ mapName: String) -> [UUID:AbstractUnit] {
        
        return GetUnitsFromMap(mapName)

    }
    
    

    
    func generateGameTilesetForMap(_ mapName: String) {
        let rows = MapFileInterpreter().getMapTiles(mapName)
        let MAP_HEIGHT = rows.count
        let MAP_WIDTH = rows[0].count
        
        var y = 1
        for entireRow in rows {
            var heightLevel: CGFloat = CGFloat(MAP_HEIGHT - y)
            var x = MAP_WIDTH
            for column in entireRow {
                var widthLevel: CGFloat = CGFloat(MAP_WIDTH - x)
                
                if column == MapCoordTile.void  {
                    
                }
                else {
                    let sprite = column.Tile.sprite
                    sprite?.position = CGPoint(x: (widthLevel * 50), y: (heightLevel * 50));
                    appendTileToCoordinate(sprite!);
                }
                x -= 1
            }
            print("")
            y += 1
        }
    }
    
    
    func convertCurrentSceneToMap(_ gameScene: GameScene) {
        let originX: CGFloat = 0
        let originY: CGFloat = 0
        
        
    }
    
    
    func appendTileToCoordinate(_ unit: SKSpriteNode) {
        TilesInMap.append(unit)
    }
}
