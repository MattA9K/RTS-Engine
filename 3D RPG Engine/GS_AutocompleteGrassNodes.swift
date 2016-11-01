//
//  GS_AutocompleteGrassNodes.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 10/31/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


extension GameScene {
    
    func autoCompletePlainGrassNodes(dominantTile: DominantTileType) {
        
        let totalPlain = plainGrassNodes.count
        var counter = 0
        
        
        for grassPlainPrePlaced in plainGrassNodes {
            // check left side:
            grassPlainPrePlaced.alpha = 0.5
            
            print("FINISHED: \(counter) / \(totalPlain) ")
            counter += 1
            
            var dominantTileName = "grass"
            
            // ⚪️ UP
            var upPoint = grassPlainPrePlaced.position
            upPoint.y += 250
            let prePlacedNodeUp = self.atPoint(upPoint)
            if prePlacedNodeUp.name == nil {
                
                let grassUp = SKAmazingGrassTile(imageNamed:"AG-dirt_grass")
                grassUp.sprite.position = upPoint
                grassUp.sprite.name = "AG-dirt_grass-n"
                self.addChild(grassUp.sprite)
                self.autoCompleteGrassNodes.append(grassUp.sprite)
            } else {
                print(prePlacedNodeUp.name)
                print("sdfg")
                if prePlacedNodeUp.name == "AG-dirt-grassDL-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt_grass")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-dirt_grass-n"
                }
                else if prePlacedNodeUp.name == "AG-dirt-plain-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt_grass")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-dirt_grass-n"
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)_dirt-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (prePlacedNodeUp as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                }
                else if prePlacedNodeUp.name == "AG-dirt-grassDR-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt_grass")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-dirt_grass-n"
                }
                else if prePlacedNodeUp.name == "AG-grass|dirt-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUR")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-grass-dirtUR-n"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeUp)
                }
                else if prePlacedNodeUp.name == "AG-dirt|grass-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUL")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-grass-dirtUL-n"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeUp)
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)_dirt-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (prePlacedNodeUp as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                }
                else if prePlacedNodeUp.name == "AG-grass-dirtDL-n" {
                    
                    var farUpPoint = upPoint
                    farUpPoint.y += 250
                    let prePlacedNodeFarUp = self.atPoint(farUpPoint)
                    if prePlacedNodeFarUp.name == "AG-grass-plain" {
                        (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                        (prePlacedNodeUp as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                    }
                }
            }
            
            
            
            // ⚪️ DOWN
            var downPoint = grassPlainPrePlaced.position
            downPoint.y -= 250
            let prePlacedNodeDown = self.atPoint(downPoint)
            if prePlacedNodeDown.name == nil {
                
                //                var farDownPoint = downPoint
                //                farDownPoint.y -= 250
                //                let farDownNode = self.atPoint(farDownPoint)
                //
                //                if farDownNode.name == "grass-plain" {
                //                    let grass = SKAmazingGrassTile(imageNamed:"AG-grass-plain")
                //                    grass.sprite.position = downPoint
                //                    grass.sprite.name = "grass-plain"
                //                    self.addChild(grass.sprite)
                //                    self.autoCompleteGrassNodes.append(grass.sprite)
                //                } else {
                let grassDown = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)_dirt")
                grassDown.sprite.position = downPoint
                grassDown.sprite.name = "AG-\(dominantTileName)_dirt-n"
                self.addChild(grassDown.sprite)
                self.autoCompleteGrassNodes.append(grassDown.sprite)
                //                }
                
            } else {
                print("node: \(prePlacedNodeDown.name)")
                if prePlacedNodeDown.name == "AG-dirt|grass-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDL")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-grass-dirtDL-n"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeDown)
                }
                else if prePlacedNodeDown.name == "AG-dirt-plain-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_dirt")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)_dirt-n"
                }
                else if prePlacedNodeDown.name == "AG-grass|dirt-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDR")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-grass-dirtDR-n"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeDown)
                }
                else if prePlacedNodeDown.name == "AG-dirt_grass-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                }
                else if prePlacedNodeDown.name == "AG-dirt-grassUL-n" || prePlacedNodeDown.name == "AG-dirt-grassUR-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_dirt")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)_dirt-n"
                }
                else if prePlacedNodeDown.name == "AG-dirt-grassDL-n" {
                    
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    print("D123: \(prePlacedNodeFarDown.name)")
                    if prePlacedNodeFarDown.name == "AG-grass-dirtDR-n" { // might be useless:
                        (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass|dirt")
                        (prePlacedNodeDown as! SKSpriteNode).name = "AG-grass|dirt-n"
                    } else {
                        (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDR")
                        (prePlacedNodeDown as! SKSpriteNode).name = "AG-grass-dirtDR-n"
                    }
                    
                }
                else if prePlacedNodeDown.name == "AG-dirt-grassDR-n" { // new 2
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDL")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-grass-dirtDL-n"
                }
                else if prePlacedNodeDown.name == "AG-grass-dirtUR-n" { // new
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                }
                else if prePlacedNodeDown.name == "AG-grass-dirtUL-n" { // new 3
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                }
                else if prePlacedNodeDown.name == "AG-grass-dirtUL-n" {
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    if prePlacedNodeFarDown.name == "AG-grass-plain" {
                        (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                        (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                    }
                }
            }
            
            
            
            // ⚪️ LEFT
            var leftPoint = grassPlainPrePlaced.position
            leftPoint.x -= 250
            let leftNode = self.atPoint(leftPoint)
            if leftNode.name == nil {
                
                //                var farLeftPoint = leftPoint
                //                farLeftPoint.x -= 250
                //                let farLeftNode = self.atPoint(farLeftPoint)
                //
                //                if farLeftNode.name == "grass-plain" {
                //                    let grassT = SKAmazingGrassTile(imageNamed:"AG-grass-plain")
                //                    grassT.sprite.position = rightPoint
                //                    grassT.sprite.name = "grass-plain"
                //                    self.addChild(grassT.sprite)
                //                    self.autoCompleteGrassNodes.append(grassT.sprite)
                //                } else {
                let grassLeft = SKAmazingGrassTile(imageNamed:"AG-dirt|grass")
                grassLeft.sprite.position = leftPoint
                grassLeft.sprite.name = "AG-dirt|grass-n"
                self.addChild(grassLeft.sprite)
                self.autoCompleteGrassNodes.append(grassLeft.sprite)
                //                }
                
            } else {
                
                print(leftNode.name)
                
                if leftNode.name == "AG-dirt-grassUR-n" || leftNode.name == "AG-dirt-grassDR-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt|grass")
                    (leftNode as! SKSpriteNode).name = "AG-dirt|grass-n"
                }
                else if leftNode.name == "AG-dirt-plain-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt|grass")
                    (leftNode as! SKSpriteNode).name = "AG-dirt|grass-n"
                }
                else if leftNode.name == "AG-dirt-grassDR-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUL")
                    (leftNode as! SKSpriteNode).name = "AG-grass-dirtUL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-dirt|grass-n" {
                    //thisone?
                    //                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDL")
                    //                    (leftNode as! SKSpriteNode).name = "AG-grass-dirtDL-n"
                    //                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(dominantTileName)_dirt-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDL")
                    (leftNode as! SKSpriteNode).name = "AG-grass-dirtDL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-dirt_grass-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUL")
                    (leftNode as! SKSpriteNode).name = "AG-grass-dirtUL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-grass|dirt-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (leftNode as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                }
                else if leftNode.name == "AG-dirt-grassUL-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDL")
                    (leftNode as! SKSpriteNode).name = "AG-grass-dirtDL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-dirt-grassDL-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUL")
                    (leftNode as! SKSpriteNode).name = "AG-grass-dirtUL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-grass-dirtDR-n" {
                    // might break tile engine
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (leftNode as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                }
                else if leftNode.name == "AG-dirt-grassUR-n" {
                    // grass corner up right needs to be replaced:
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt|grass")
                    (leftNode as! SKSpriteNode).name = "AG-dirt|grass-n"
                }
                else if leftNode.name == "AG-grass-dirtUR-n" {
                    // grass corner up right needs to be replaced:
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (leftNode as! SKSpriteNode).name = "AG-grass-plain-n"
                }
                else if leftNode.name == "AG-grass-dirtUR-n" {
                    var farLeftPoint = leftPoint
                    farLeftPoint.x -= 250
                    let farLeftNode = self.atPoint(farLeftPoint)
                    if farLeftNode.name == "AG-grass-plain" {
                        (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                        (leftNode as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                    }
                }
            }
            
            
            
            // ⚪️ RIGHT
            var rightPoint = grassPlainPrePlaced.position
            rightPoint.x += 250
            let node1 = self.atPoint(rightPoint)
            if node1.name == nil {
                
                //                var farRightPoint = rightPoint
                //                farRightPoint.x += 250
                //                let farRightNode = self.atPoint(farRightPoint)
                //
                //                if farRightNode.name == "grass-plain" {
                //                    let grassRight = SKAmazingGrassTile(imageNamed:"AG-grass-plain")
                //                    grassRight.sprite.position = rightPoint
                //                    grassRight.sprite.name = "grass-plain"
                //                    self.addChild(grassRight.sprite)
                //                    self.autoCompleteGrassNodes.append(grassRight.sprite)
                //                } else {
                let grassRight = SKAmazingGrassTile(imageNamed:"AG-grass|dirt")
                grassRight.sprite.position = rightPoint
                grassRight.sprite.name = "AG-grass|dirt-n"
                self.addChild(grassRight.sprite)
                self.autoCompleteGrassNodes.append(grassRight.sprite)
                //                }
                
            } else {
                
                print(node1.name!)
                print("RIGHT")
                
                if  node1.name! == "AG-dirt-grassDL-n" {
                    print((node1 as! SKSpriteNode).name)
                    (node1 as! SKSpriteNode).alpha = 1
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass|dirt")
                    (node1 as! SKSpriteNode).name = "AG-grass|dirt-n"
                }
                else if node1.name == "AG-dirt-plain-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass|dirt")
                    (node1 as! SKSpriteNode).name = "AG-grass|dirt-n"
                }
                else if node1.name! == "AG-dirt_grass-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUR")
                    (node1 as! SKSpriteNode).name = "AG-grass-dirtUR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name! == "AG-dirt|grass-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (node1 as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                }
                else if node1.name == "AG-\(dominantTileName)_dirt-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDR")
                    (node1 as! SKSpriteNode).name = "AG-grass-dirtDR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name == "AG-dirt-grassDR-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUR")
                    (node1 as! SKSpriteNode).name = "AG-grass-dirtUR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name! == "AG-dirt-grassUL-n" {
                    //                    (node1 as! SKSpriteNode).alpha = 0.85
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass|dirt")
                    (node1 as! SKSpriteNode).name = "AG-grass|dirt-n"
                }
                else if node1.name! == "AG-\(dominantTileName)_dirt-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDR")
                    (node1 as! SKSpriteNode).name = "AG-grass-dirtDR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name! == "AG-grass-dirtDL-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (node1 as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                }
                else if node1.name == "AG-grass-dirtUL-n" {
                    var farRightPoint = rightPoint
                    farRightPoint.x += 250
                    let farRightNode = self.atPoint(farRightPoint)
                    
                    if farRightNode.name == "AG-grass-plain" {
                        (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                        (node1 as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                    }
                }
                else if node1.name == "AG-dirt-grassUR-n" {
                    var farRightPoint = rightPoint
                    farRightPoint.x += 250
                    let farRightNode = self.atPoint(farRightPoint)
                    
                    if farRightNode.name == "AG-\(dominantTileName)_dirt-n" {
                        (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDR")
                        (node1 as! SKSpriteNode).name = "AG-grass-dirtDR-n"
                        autoCompletedGrassCornerNodes.append(node1)
                    }
                }
            }
            
            
            
            
            var ULPoint = grassPlainPrePlaced.position
            ULPoint.x -= 250
            ULPoint.y += 250
            let nodeUL = self.atPoint(ULPoint)
            print(nodeUL.name)
            if nodeUL.name == nil {
                let grassLeft = SKAmazingGrassTile(imageNamed:"AG-dirt-grassDR")
                grassLeft.sprite.position = ULPoint
                grassLeft.sprite.name = "AG-dirt-grassDR-n"
                self.addChild(grassLeft.sprite)
                autoCompletedGrassCornerNodes.append(grassLeft.sprite)
                self.autoCompleteGrassNodes.append(grassLeft.sprite)
            } else {
                if nodeUL.name == "AG-dirt-grassUR-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt|grass")
                    (nodeUL as! SKSpriteNode).name = "AG-dirt|grass-n"
                }
                else if nodeUL.name == "AG-dirt-plain-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassDR")
                    (nodeUL as! SKSpriteNode).name = "AG-dirt-grassDR-n"
                    autoCompletedGrassCornerNodes.append(nodeUL)
                }
                else if nodeUL.name == "AG-dirt-grassDL-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt_grass")
                    (nodeUL as! SKSpriteNode).name = "AG-dirt_grass-n"
                }
                else if nodeUL.name == "AG-grass|dirt-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUR")
                    (nodeUL as! SKSpriteNode).name = "AG-grass-dirtUR-n"
                    autoCompletedGrassCornerNodes.append(nodeUL)
                }
                else if nodeUL.name == "AG-dirt-grassUL-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-grass-dirtUL")
                    grassPlainPrePlaced.name = "AG-grass-dirtUL-n"
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var leftPoint = grassPlainPrePlaced.position
                    leftPoint.x -= 250
                    let leftNode = self.atPoint(leftPoint)
                    
                    var upPoint = grassPlainPrePlaced.position
                    upPoint.y += 250
                    let upNode = self.atPoint(upPoint)
                    
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassDR")
                    (leftNode as! SKSpriteNode).name = "AG-dirt-grassDR-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    
                    (upNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassDR")
                    (upNode as! SKSpriteNode).name = "AG-dirt-grassDR-n"
                    autoCompletedGrassCornerNodes.append(upNode)
                }
            }
            
            
            
            var URPoint = grassPlainPrePlaced.position
            URPoint.x += 250
            URPoint.y += 250
            let nodeUR = self.atPoint(URPoint)
            print(nodeUR.name)
            if nodeUR.name == nil {
                
                //                var farRightPoint = rightPoint
                //                farRightPoint.x += 250
                //                let farRightNode = self.atPoint(farRightPoint)
                //
                //                if farRightNode.name == "grass-plain" {
                //                    let grassUp = SKAmazingGrassTile(imageNamed:"AG-dirt_grass")
                //                    grassUp.sprite.position = URPoint
                //                    grassUp.sprite.name = "grass-down"
                //                    self.addChild(grassUp.sprite)
                //                    self.autoCompleteGrassNodes.append(grassUp.sprite)
                //                } else {
                let grassLeft = SKAmazingGrassTile(imageNamed:"AG-dirt-grassDL")
                grassLeft.sprite.position = URPoint
                grassLeft.sprite.name = "AG-dirt-grassDL-n"
                self.addChild(grassLeft.sprite)
                self.autoCompleteGrassNodes.append(grassLeft.sprite)
                autoCompletedGrassCornerNodes.append(grassLeft.sprite)
                //                }
                
                
            } else {
                if nodeUR.name == "AG-dirt-grassUL-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass|dirt")
                    (nodeUR as! SKSpriteNode).name = "AG-grass|dirt-n"
                }
                else if nodeUR.name == "AG-dirt-plain-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassDL")
                    (nodeUR as! SKSpriteNode).name = "AG-dirt-grassDL-n"
                }
                else if nodeUR.name == "AG-dirt-grassDR-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt_grass")
                    (nodeUR as! SKSpriteNode).name = "AG-dirt_grass-n"
                }
                else if nodeUR.name == "AG-grass-dirtDL-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (nodeUR as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                }
                else if nodeUR.name == "AG-grass|dirt-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDR")
                    (nodeUR as! SKSpriteNode).name = "AG-grass-dirtDR-n"
                    //                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt|grass")
                    //                    (nodeUR as! SKSpriteNode).name = "AG-dirt|grass-n"
                }
                    //                else if nodeUR.name == "AG-dirt|grass-n" {
                    //                    if prePlacedNodeUp.name == "AG-grass-plain" {
                    //                    } else {
                    //                        (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUL")
                    //                        (nodeUR as! SKSpriteNode).name = "AG-grass-dirtUL-n"
                    //                    }
                    //                }
                else if nodeUR.name == "AG-dirt-grassUR-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-grass-dirtUR")
                    grassPlainPrePlaced.name = "AG-grass-dirtUR-n"
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var rightPoint = grassPlainPrePlaced.position
                    rightPoint.x += 250
                    let rightNode = self.atPoint(rightPoint)
                    
                    var upPoint = grassPlainPrePlaced.position
                    upPoint.y += 250
                    let upNode = self.atPoint(upPoint)
                    
                    (rightNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassDL")
                    (rightNode as! SKSpriteNode).name = "AG-dirt-grassDL-n"
                    autoCompletedGrassCornerNodes.append(rightNode)
                    
                    (upNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassDL")
                    (upNode as! SKSpriteNode).name = "AG-dirt-grassDL-n"
                    autoCompletedGrassCornerNodes.append(upNode)
                }
            }
            
            
            
            var DLPoint = grassPlainPrePlaced.position
            DLPoint.x -= 250
            DLPoint.y -= 250
            let nodeDL = self.atPoint(DLPoint)
            print(nodeDL.name)
            if nodeDL.name == nil {
                let grassUR = SKAmazingGrassTile(imageNamed:"AG-dirt-grassUR")
                grassUR.sprite.position = DLPoint
                grassUR.sprite.name = "AG-dirt-grassUR-n"
                self.addChild(grassUR.sprite)
                self.autoCompleteGrassNodes.append(grassUR.sprite)
                autoCompletedGrassCornerNodes.append(grassUR.sprite)
            } else {
                if nodeDL.name == "AG-dirt-grassDR-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt|grass")
                    (nodeDL as! SKSpriteNode).name = "AG-dirt|grass-n"
                }
                else if nodeDL.name == "AG-dirt-plain-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassUR")
                    (nodeDL as! SKSpriteNode).name = "AG-dirt-grassUR-n"
                    autoCompletedGrassCornerNodes.append(nodeDL)
                }
                else if nodeDL.name == "AG-dirt-grassUL-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_dirt")
                    (nodeDL as! SKSpriteNode).name = "AG-\(dominantTileName)_dirt-n"
                }
                else if nodeDL.name == "AG-grass|dirt-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDR")
                    (nodeDL as! SKSpriteNode).name = "AG-grass-dirtDR-n"
                    autoCompletedGrassCornerNodes.append(nodeDL)
                }
                else if nodeDL.name == "AG-dirt_grass-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUL")
                    (nodeDL as! SKSpriteNode).name = "AG-grass-dirtUL-n"
                }
                else if nodeDL.name == "AG-dirt-grassUL-n" { // HMMMM ???
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_dirt")
                    (nodeDL as! SKSpriteNode).name = "AG-\(dominantTileName)_dirt-n"
                    print("BUG FIX HMMMM??? JUST EXECUTED!!!")
                }
                else if nodeDL.name == "AG-grass-dirtUR-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (nodeDL as! SKSpriteNode).name = "AG-grass-plain-n"
                }
                else if nodeDL.name == "AG-dirt-grassDL-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-grass-dirtDL")
                    grassPlainPrePlaced.name = "AG-grass-dirtDL-n"
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var leftPoint = grassPlainPrePlaced.position
                    leftPoint.x -= 250
                    let leftNode = self.atPoint(leftPoint)
                    
                    var downPoint = grassPlainPrePlaced.position
                    downPoint.y -= 250
                    let downNode = self.atPoint(downPoint)
                    
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassUR")
                    (leftNode as! SKSpriteNode).name = "AG-dirt-grassUR-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    
                    print("downNode Name: \(downNode.name)")
                    print("")
                    
                    if downNode.name == "AG-\(dominantTileName)_dirt-n" { // "AG-dirt-grassDL-n" {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassUR")
                        (downNode as! SKSpriteNode).name = "AG-dirt-grassUR-n"
                    }
                    else if downNode.name == "AG-grass-dirtDL-n" {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt|grass")
                        (downNode as! SKSpriteNode).name = "AG-dirt|grass-n"
                    }
                    else {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass|dirt")
                        (downNode as! SKSpriteNode).name = "AG-grass|dirt-n"
                        //                        autoCompletedGrassCornerNodes.append(downNode)
                    }
                }
            }
            
            
            
            
            var DRPoint = grassPlainPrePlaced.position
            DRPoint.x += 250
            DRPoint.y -= 250
            let nodeDR = self.atPoint(DRPoint)
            print(nodeDR.name)
            if nodeDR.name == nil {
                
                //                var farRightPoint = rightPoint
                //                farRightPoint.x += 250
                //                let farRightNode = self.atPoint(farRightPoint)
                //
                //                if farRightNode.name == "grass-plain" {
                //                    let grassDown = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)_dirt")
                //                    grassDown.sprite.position = DRPoint
                //                    grassDown.sprite.name = "grass-up"
                //                    self.addChild(grassDown.sprite)
                //                    self.autoCompleteGrassNodes.append(grassDown.sprite)
                //                } else {
                let grassUL = SKAmazingGrassTile(imageNamed:"AG-dirt-grassUL")
                grassUL.sprite.position = DRPoint
                grassUL.sprite.name = "AG-dirt-grassUL-n"
                
                autoCompletedGrassCornerNodes.append(grassUL.sprite)
                self.addChild(grassUL.sprite)
                self.autoCompleteGrassNodes.append(grassUL.sprite)
                //                }
                
            } else {
                if nodeDR.name == "AG-dirt-grassUR-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_dirt")
                    (nodeDR as! SKSpriteNode).name = "AG-\(dominantTileName)_dirt-n"
                }
                else if nodeDR.name == "AG-dirt-plain-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassUL")
                    (nodeDR as! SKSpriteNode).name = "AG-dirt-grassUL-n"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-dirt-grassDL-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass|dirt")
                    (nodeDR as! SKSpriteNode).name = "AG-grass|dirt-n"
                }
                else if nodeDR.name == "AG-dirt|grass-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtDL")
                    (nodeDR as! SKSpriteNode).name = "AG-grass-dirtDL-n"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-dirt_grass-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-dirtUR")
                    (nodeDR as! SKSpriteNode).name = "AG-grass-dirtUR-n"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-grass-dirtUL-n" { // new
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass-plain")
                    (nodeDR as! SKSpriteNode).name = "xxAG-grass-plain-nxx"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-dirt-grassDR-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-grass-dirtDR")
                    grassPlainPrePlaced.name = "AG-grass-dirtDR-n"
                    
                    var rightPoint = grassPlainPrePlaced.position
                    rightPoint.x += 250
                    let rightNode = self.atPoint(rightPoint)
                    
                    var downPoint = grassPlainPrePlaced.position
                    downPoint.y -= 250
                    let downNode = self.atPoint(downPoint)
                    
                    (rightNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassUL")
                    (rightNode as! SKSpriteNode).name = "AG-dirt-grassUL-n"
                    autoCompletedGrassCornerNodes.append(rightNode)
                    
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    print("D123: \(prePlacedNodeFarDown.name)")
                    if prePlacedNodeFarDown.name == "AG-grass|dirt-n" { // might be useless:
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-grass|dirt")
                        (downNode as! SKSpriteNode).name = "AG-grass|dirt-n"
                    } else {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-dirt-grassUL")
                        (downNode as! SKSpriteNode).name = "AG-dirt-grassUL-n"
                        autoCompletedGrassCornerNodes.append(downNode)
                    }
                }
            }
            
            
            
            
            
        }
    }
}
