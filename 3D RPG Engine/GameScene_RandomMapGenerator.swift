//
//  GameScene_RandomMapGenerator.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 10/27/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


public let MAP_WIDTH = 100
public let MAP_HEIGHT = 150

public let TILESET_OFFSET_X : CGFloat = -2500
public let TILESET_OFFSET_Y : CGFloat = -3500



extension GameScene {
    func playerAddedGrassPlainNode(at: CGPoint) {
        var defaultName = "AG-grass-plain"
        if DIRT_BRUSH_ENABLED == true {
            defaultName = "AG-dirt-plain"
        }
        func roundToTwoFifties(xy : CGFloat) -> CGFloat {
            return CGFloat(250 * Int(round(xy / 250.0)))
        }
        
        let grass0 = SKAmazingGrassTile(imageNamed:defaultName)
        grass0.sprite.position = at
        grass0.sprite.name = "\(defaultName)-n_tile"
        
        grass0.sprite.position.x = roundToTwoFifties(xy: at.x)
        grass0.sprite.position.y = roundToTwoFifties(xy: at.y)
        
        self.addChild(grass0.sprite)
        
        if DIRT_BRUSH_ENABLED == false {
             plainGrassNodes.append(grass0.sprite as! TileSpriteNode)
        }
    }
    
    
    func autoCompletePlainGrassNodes() {
        autoCompletePlainGrassNodes(dominantTile: .grass)
    }
    
    enum DominantTileType {
        case grass, dirt;
    }
    
    func addChiledToCentralDispatcher(_ node: TileSpriteNode) {
        self.nodesForMultiplayerHost.append(node)
        self.addChild(node)
    }
    
    func generateTerrainRandom() {
        let NODE_SIZE: CGFloat = 50
        let TILE_SPACE: CGFloat = 250
        
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        
        var i = 0
        var j = 0
        
        /*
        func rollDice() -> CGFloat
        {
            let MAX : UInt32 = 16
            let MIN : UInt32 = 1
            let random_number = CGFloat(arc4random_uniform(MAX) + MIN)
            return random_number
        }
        
        let masterTile = "coast"
        let slaveTile = "dirt"
        
        
        print(((MAP_WIDTH * 50) * (MAP_HEIGHT * 50)))
        while i <= ((MAP_WIDTH * 1) * (MAP_HEIGHT * 1)) {
            if (x.truncatingRemainder(dividingBy: TILE_SPACE)) == 0 && (y.truncatingRemainder(dividingBy: TILE_SPACE)) == 0 {
                let randomResult = rollDice()
                if randomResult == 2.0 {
                    
                    print("x: (\(x), y: \(y))")
                    let tile = SKAmazingGrassTile(imageNamed:"AG-\(masterTile)-plain")
                    tile.sprite.name = "AG-\(masterTile)-plain-n_tile"//"AG-grass-plain-n_tile"
                    tile.sprite.position = CGPoint(x: x + TILESET_OFFSET_X, y: y + TILESET_OFFSET_Y)
                    self.addChiledToCentralDispatcher(tile.sprite as! TileSpriteNode)
                    plainGrassNodes.append(tile.sprite as! TileSpriteNode)
                    
                } else {
                    let tile = SKAmazingGrassTile(imageNamed:"AG-\(slaveTile)-plain")
                    tile.sprite.name = "AG-\(slaveTile)-plain-n_tile"
                    tile.sprite.position = CGPoint(x: x + TILESET_OFFSET_X, y: y + TILESET_OFFSET_Y)
                    plainDirtNodes.append(tile.sprite as! TileSpriteNode)
                }
            }
            
            
            if j == (MAP_WIDTH * 50) {
                j = 0
                x = 0
                    y += 50
            }
                x += 50
                i += 1
                j += 50
        }
        
        
        for pdtile in plainDirtNodes {
            self.addChiledToCentralDispatcher(pdtile)
        }
        autoCompletePlainGrassNodes(dominantTile: .dirt)
        
        */
        generateTerrainRandom2(i_: i, j_: j, x_: x, y_: y)
        transitionalMapSectionsLeft = 10
    }
    
    func generateTerrainRandom2(i_ : Int, j_: Int, x_: CGFloat, y_: CGFloat) {
        let NODE_SIZE: CGFloat = 50
        let TILE_SPACE: CGFloat = 250
        
        var x: CGFloat! = x_
        var y: CGFloat! = y_
        var i: Int! = i_
        var j: Int! = j_
        
        
        func rollDice() -> CGFloat
        {
            let MAX : UInt32 = 6
            let MIN : UInt32 = 1
            let random_number = CGFloat(arc4random_uniform(MAX) + MIN)
            return random_number
        }
        
        let masterTile = "grass"
        let slaveTile = "dirt"
        
        
        print(((MAP_WIDTH * 50) * (MAP_HEIGHT * 50)))
        while i <= ((MAP_WIDTH * 1) * (MAP_HEIGHT * 1)) {
            if (x.truncatingRemainder(dividingBy: TILE_SPACE)) == 0 && (y.truncatingRemainder(dividingBy: TILE_SPACE)) == 0 {
                
                var randomResult: CGFloat!
                if transitionalMapSectionsLeft > 0 {
                    randomResult = 3
                } else {
                    randomResult = rollDice()
                }
                
                if randomResult == 1.0 || randomResult == 2.0 {
                    print("x: (\(x), y: \(y))")
                    let tile = SKAmazingGrassTile(imageNamed:"AG-\(masterTile)-plain")
                    tile.sprite.name = "AG-\(masterTile)-plain-n_tile"//"AG-grass-plain-n_tile"
                    tile.sprite.position = CGPoint(x: x + TILESET_OFFSET_X, y: y + TILESET_OFFSET_Y)
                    self.addChiledToCentralDispatcher(tile.sprite as! TileSpriteNode)
                    plainGrassNodesLayer2.append(tile.sprite as! TileSpriteNode)
                    
                } else {
                    let tile = SKAmazingGrassTile(imageNamed:"AG-\(slaveTile)-plain")
                    tile.sprite.name = "AG-\(slaveTile)-plain-n_tile"
                    tile.sprite.position = CGPoint(x: x + TILESET_OFFSET_X, y: y + TILESET_OFFSET_Y)
                    tile.sprite.zPosition = SpritePositionZ.tileset.Z + 1
                    plainDirtNodesLayer2.append(tile.sprite as! TileSpriteNode)
                }
            }
            
            if j == (MAP_WIDTH * 50) {
                j = 0
                x = 0
                y = y + 50
                transitionalMapSectionsLeft -= 1
            }

            x = x + 50
            i = i + 1
            j = j + 50

        }

        for pdtile in plainDirtNodesLayer2 {
            self.addChiledToCentralDispatcher(pdtile)
        }
        autoCompleteLayer2(dominantTile: .grass)
        autoCompleteSlaveNodes(slaveTile: "dirt", masterTile: "grass")
    }
    
    
    func generateTerrainRandom(masterTile: String, slaveTile: String) {
        let NODE_SIZE: CGFloat = 50
        let TILE_SPACE: CGFloat = 250
        
        var x: CGFloat = 0.0
        var y: CGFloat = 0.0
        var i = 0
        var j = 0
        
        func rollDice() -> CGFloat
        {
            let MAX : UInt32 = 6
            let MIN : UInt32 = 1
            let random_number = CGFloat(arc4random_uniform(MAX) + MIN)
            return random_number
        }
        
        print(((MAP_WIDTH * 50) * (MAP_HEIGHT * 50)))
        while i <= ((MAP_WIDTH * 1) * (MAP_HEIGHT * 1)) {
            if (x.truncatingRemainder(dividingBy: TILE_SPACE)) == 0 && (y.truncatingRemainder(dividingBy: TILE_SPACE)) == 0 {
                
                var randomResult: CGFloat!
                if transitionalMapSectionsLeft > 0 {
                    randomResult = 3
                } else {
                    randomResult = rollDice()
                }
                
                if randomResult == 1.0 || randomResult == 2.0 {
                    print("x: (\(x), y: \(y))")
                    let tile = SKAmazingGrassTile(imageNamed:"AG-\(masterTile)-plain")
                    tile.sprite.name = "AG-\(masterTile)-plain-n_tile"//"AG-grass-plain-n_tile"
                    tile.sprite.position = CGPoint(x: x + TILESET_OFFSET_X, y: y + TILESET_OFFSET_Y)
                    self.addChiledToCentralDispatcher(tile.sprite as! TileSpriteNode)
                    plainGrassNodesLayer2.append(tile.sprite as! TileSpriteNode)
                    
                } else {
                    let tile = SKAmazingGrassTile(imageNamed:"AG-\(slaveTile)-plain")
                    tile.sprite.name = "AG-\(slaveTile)-plain-n_tile"
                    tile.sprite.position = CGPoint(x: x + TILESET_OFFSET_X, y: y + TILESET_OFFSET_Y)
                    tile.sprite.zPosition = SpritePositionZ.tileset.Z + 1
                    plainDirtNodesLayer2.append(tile.sprite as! TileSpriteNode)
                }
            }
            
            if j == (MAP_WIDTH * 50) {
                j = 0
                x = 0
                y = y + 50
                transitionalMapSectionsLeft -= 1
            }
            
            x = x + 50
            i = i + 1
            j = j + 50
            
        }
        
        for pdtile in plainDirtNodesLayer2 {
            self.addChiledToCentralDispatcher(pdtile)
        }
        autoCompleteLayer2(dominantTile: .grass)
        autoCompleteSlaveNodes(slaveTile: slaveTile, masterTile: masterTile)
    }
    
    
    func autoCorrectGrassCornerNodes() {

    }
}
