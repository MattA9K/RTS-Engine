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
    
    var UnitsInMap = [BaseUnit]()
    
    
    func generateGameSceneBasedFromMap() {
        
        let unit1 = MapCoordUnit.FtmanP1;
        let unit2 = MapCoordUnit.GruntP2;
        let void_ = MapCoordUnit.Void;
        
        
        
        let row5 = [unit2,void_,void_,void_,void_];
        
        
        let row4 = [void_,void_,void_,void_,void_];
        
        
        let row3 = [void_,void_,void_,void_,void_];
        
        
        let row2 = [void_,void_,void_,void_,void_];
        
        
        let row1 = [unit2,void_,void_,unit2,void_];
        
        
        
        let rows = [row1,row2,row3,row4,row5];
        
        
        
        
        var rowI: CGFloat = 0;
        for row in rows {
            
            var colI: CGFloat = 0;
            for col in row {
                
                if col == MapCoordUnit.GruntP2 {
                    print("Unit found at: " + String(rowI * 50) + " " + String(colI * 50));
                    var unit = col.Unit;
                    unit.sprite.position = CGPointMake((rowI*50),(colI*50));
                    unit.sprite.name = String(rowI+colI) + String(NSDate());
                    appendUnitToCoordinate(unit);
                }
                
                colI += 1;
            }
            rowI += 1;
        }
    }
    
    
    func appendUnitToCoordinate(unit: BaseUnit) {
        UnitsInMap.append(unit)
    }
}



class PlayableUnit {
    
}