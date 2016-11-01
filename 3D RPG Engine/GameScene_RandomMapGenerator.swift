//
//  GameScene_RandomMapGenerator.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 10/27/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


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
        grass0.sprite.name = "\(defaultName)-n"
        
        grass0.sprite.position.x = roundToTwoFifties(xy: at.x)
        grass0.sprite.position.y = roundToTwoFifties(xy: at.y)
        
        self.addChild(grass0.sprite)
        
        if DIRT_BRUSH_ENABLED == false {
             plainGrassNodes.append(grass0.sprite)
        }
    }
    
    
    func autoCompletePlainGrassNodes() {
        
    }
    
    enum DominantTileType {
        case grass, dirt;
    }
    
    
    
    func autoCorrectGrassCornerNodes() {
        /*
        for node in autoCompletedGrassCornerNodes {
            let thisNodePosition = node.position
            
            let rightOfThisNode = CGPoint(x: thisNodePosition.x + 250, y: thisNodePosition.y)
            let nodeToTheRight = self.atPoint(rightOfThisNode)
            
            let leftOfThisNode = CGPoint(x: thisNodePosition.x - 250, y: thisNodePosition.y)
            let nodeToTheLeft = self.atPoint(leftOfThisNode)
            
            let aboveOfThisNode = CGPoint(x: thisNodePosition.x - 250, y: thisNodePosition.y)
            let nodeToTheTop = self.atPoint(aboveOfThisNode)
            
            let belowOfThisNode = CGPoint(x: thisNodePosition.x - 250, y: thisNodePosition.y)
            let nodeToTheBottom = self.atPoint(belowOfThisNode)
            
            
            if node.name == "AG-grass-dirtDR-n" {
                if (nodeToTheRight).name == "AG-grass-plain-n" ||
                    (nodeToTheRight).name == "AG-grass|dirt-n" {
                    if (nodeToTheBottom).name == "AG-grass-plain-n" {
                        (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    }
                    else if (nodeToTheBottom).name == "AG-grass-dirtDL-n" {
                        (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    }
                    else if (nodeToTheBottom).name == "AG-grass-dirtDR-n" {
                        (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    }
                    else if (nodeToTheBottom).name == "AG-grass_dirt-n" {
                        (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    }
                    else if (nodeToTheBottom).name == "AG-dirt_grass-n" {
                        (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUL ")
                    }
                }
//                else if nodeToTheBottom.name == "AG-grass-plain-n" {
//                    (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
//                }
            }
            else if node.name == "AG-grass-dirtDL-n" {
                if (nodeToTheLeft).name == "AG-grass-plain-n" ||
                    (nodeToTheLeft).name == "AG-dirt|grass-n" {
                    if (nodeToTheBottom).name == "AG-grass-plain-n" {
                        (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    }
                    else if (nodeToTheBottom).name == "AG-grass-dirtDL-n" {
                        (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    }
                    else if (nodeToTheBottom).name == "AG-grass-dirtDR-n" {
                        (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    }
                    else if (nodeToTheBottom).name == "AG-grass_dirt-n" {
                        (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    }
                    else if (nodeToTheBottom).name == "AG-dirt_grass-n" {
                        (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUR")
                    }
                }
//                else if nodeToTheBottom.name == "AG-grass-plain-n" {
//                    (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
//                }
            }
            else if node.name == "AG-dirt-grassUL-n" {
                if (nodeToTheLeft).name == "AG-grass-plain-n" && (nodeToTheTop).name == "AG-grass-plain-n" {
                    (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-plain")
                }
            }
            else if node.name == "AG-dirt-grassUR-n" {
                if (nodeToTheRight).name == "AG-grass-plain-n" && (nodeToTheTop).name == "AG-grass-plain-n" {
                    (node as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                }
            }
        }
         */
    }
    
    
    
    func generateTerrainRandom() {
        let NODE_SIZE: CGFloat = 50
        let TILE_SPACE: CGFloat = 250
        
        let MAP_WIDTH = 160
        let MAP_HEIGHT = 165 //241
        
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
                let randomResult = rollDice()
                if randomResult == 1.0 || randomResult == 2.0 {
                    
                    print("x: (\(x), y: \(y))")
                    let tile = SKAmazingGrassTile(imageNamed:"AG-grass-plain")
                    tile.sprite.name = "AG-grass-plain-n"
                    tile.sprite.position = CGPoint(x: x, y: y)
                    self.addChild(tile.sprite)
                    plainGrassNodes.append(tile.sprite)
                    
                } else {
                    let tile = SKAmazingGrassTile(imageNamed:"AG-dirt-plain")
                    tile.sprite.name = "AG-dirt-plain-n"
                    tile.sprite.position = CGPoint(x: x, y: y)
//                    self.addChild(tile.sprite)
                    plainDirtNodes.append(tile.sprite)
                }
            }
            
//            print("j IS: \(j)")
//            print("j WILL STOP AT: \((MAP_WIDTH * 50))")
//            print("y IS CURRENTLY: \(y)")
//            print("")
            
            if j == (MAP_WIDTH * 50) {
                j = 0
                x = 0
//                if Int(y) < (MAP_HEIGHT * i) {
                    y += 50
//                }
            }
//            else {
                x += 50
                i += 1
                j += 50
//            }
        }
        
        for pdtile in plainDirtNodes {
            self.addChild(pdtile)
        }
    }
        /*
        let grass0 = SKAmazingGrassTile(imageNamed:"AG-dirt-plain")
        grass0.sprite.position = CGPoint(x: 1000, y: -500)
        grass0.sprite.name = "AG-dirt-plain-n"
        self.addChild(grass0.sprite)
        
        let grass1 = SKAmazingGrassTile(imageNamed:"AG-dirt-plain")
        grass1.sprite.position = CGPoint(x: 0, y: -500)
        grass1.sprite.name = "AG-dirt-plain-n"
        self.addChild(grass1.sprite)
        
        
        let grass2 = SKAmazingGrassTile(imageNamed:"AG-dirt-plain")
        grass2.sprite.position = CGPoint(x: 500, y: -500)
        grass2.sprite.name = "AG-dirt-plain-n"
        self.addChild(grass2.sprite)
        
        
        let grass3 = SKAmazingGrassTile(imageNamed:"AG-dirt-plain")
        grass3.sprite.position = CGPoint(x: -250, y: 0)
        grass3.sprite.name = "AG-dirt-plain-n"
        self.addChild(grass3.sprite)
        
        
        let grass4 = SKAmazingGrassTile(imageNamed:"AG-dirt-plain")
        grass4.sprite.position = CGPoint(x: -250, y: -250)
        grass4.sprite.name = "AG-dirt-plain-n"
        self.addChild(grass4.sprite)
        
        
        let grass5 = SKAmazingGrassTile(imageNamed:"AG-dirt-plain")
        grass5.sprite.position = CGPoint(x: 1000, y: -250)
        grass5.sprite.name = "AG-dirt-plain-n"
        self.addChild(grass5.sprite)
        
        
        let grass6 = SKAmazingGrassTile(imageNamed:"AG-dirt-plain")
        grass6.sprite.position = CGPoint(x: 0, y: 0)
        grass6.sprite.name = "AG-dirt-plain-n"
//        grass6.sprite.alpha = 1
        self.addChild(grass6.sprite)
        */
        
//        plainGrassNodes.append(grass0.sprite)
//        plainGrassNodes.append(grass1.sprite)
//        plainGrassNodes.append(grass2.sprite)
//        plainGrassNodes.append(grass3.sprite)
//        plainGrassNodes.append(grass4.sprite)
//        plainGrassNodes.append(grass5.sprite)
//        plainGrassNodes.append(grass6.sprite)
        
        
        
        
            
            
            /*
             let grassUp = SKAmazingGrassTile(imageNamed:"AG-dirt_grass")
             grassUp.sprite.position = grassPlainPrePlaced.position
             grassUp.sprite.position.y += 250
             self.addChild(grassUp.sprite)
             
             let grassDown = SKAmazingGrassTile(imageNamed:"AG-grass_dirt")
             grassDown.sprite.position = grassPlainPrePlaced.position
             grassDown.sprite.position.y -= 250
             self.addChild(grassDown.sprite)
             */
        
        
        /*
         while i <= ((MAP_WIDTH * 50) * (MAP_HEIGHT * 50)) {
         
         //    print("x: (\(x), y: \(y))")
         //    print(((x * NODE_SIZE) % TILE_SPACE))
         if ((x).truncatingRemainder(dividingBy: TILE_SPACE)) == 0 {
         //        print("i: (\(i), j: \(j))")
         print(" while \(i) < \(((MAP_WIDTH * 50) * (MAP_HEIGHT * 50)))")
         let tile = SKAmazingGrassTile(imageNamed:"AG-grass-plain")
            tile.sprite.position = CGPoint(x:(x),y: (y))
            tile.sprite.position = CGPoint(x:(x * NODE_SIZE), y:(y * TILE_SPACE))
         self.addChild(tile.sprite)
                 print("Adding tile at: (\(x), \(y))")
         }
             if j == (MAP_WIDTH * 50) {
                 j = 0
                 x = 0
                 y += 50
             } else {
                x += 50
                i += 1
                j += 50
            }
         //            NSThread.sleepForTimeInterval(0.05)
         }
        */
    
    
}
