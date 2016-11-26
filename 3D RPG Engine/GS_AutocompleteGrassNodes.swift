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
    
    // always do this before blocking tile paths:
    func unblockAllPaths(coordinates: CGPoint) {
        self.PathsBlocked[String(describing: coordinates)] = false
        
        let up = CGPoint(x: coordinates.x, y: coordinates.y + 50)
        let down = CGPoint(x: coordinates.x, y: coordinates.y - 50)
        let farUp = CGPoint(x: coordinates.x, y: coordinates.y + 100)
        let farDown = CGPoint(x: coordinates.x, y: coordinates.y - 100)
        
        let left = CGPoint(x: coordinates.x - 50, y: coordinates.y)
        let right = CGPoint(x: coordinates.x + 50, y: coordinates.y)
        let farLeft = CGPoint(x: coordinates.x - 50, y: coordinates.y)
        let farRight = CGPoint(x: coordinates.x + 50, y: coordinates.y)
        
        self.PathsBlocked[String(describing: up)] = false
        self.PathsBlocked[String(describing: down)] = false
        self.PathsBlocked[String(describing: farUp)] = false
        self.PathsBlocked[String(describing: farDown)] = false
        
        self.PathsBlocked[String(describing: left)] = false
        self.PathsBlocked[String(describing: right)] = false
        self.PathsBlocked[String(describing: farLeft)] = false
        self.PathsBlocked[String(describing: farRight)] = false
    }
    
    func blockVerticalPath(coordinates: CGPoint) {
        unblockAllPaths(coordinates: coordinates)
        self.PathsBlocked[String(describing: coordinates)] = true
        
        let up = CGPoint(x: coordinates.x, y: coordinates.y + 50)
        let down = CGPoint(x: coordinates.x, y: coordinates.y - 50)
        
        let farUp = CGPoint(x: coordinates.x, y: coordinates.y + 100)
        let farDown = CGPoint(x: coordinates.x, y: coordinates.y - 100)
        
        self.PathsBlocked[String(describing: up)] = true
        self.PathsBlocked[String(describing: down)] = true
        self.PathsBlocked[String(describing: farUp)] = true
        self.PathsBlocked[String(describing: farDown)] = true
    }
    
    func blockHorizontalPath(coordinates: CGPoint) {
        unblockAllPaths(coordinates: coordinates)
        self.PathsBlocked[String(describing: coordinates)] = true

        let left = CGPoint(x: coordinates.x - 50, y: coordinates.y)
        let right = CGPoint(x: coordinates.x + 50, y: coordinates.y)
        
        let farLeft = CGPoint(x: coordinates.x - 100, y: coordinates.y)
        let farRight = CGPoint(x: coordinates.x + 100, y: coordinates.y)
        
        self.PathsBlocked[String(describing: left)] = true
        self.PathsBlocked[String(describing: right)] = true
        self.PathsBlocked[String(describing: farLeft)] = true
        self.PathsBlocked[String(describing: farRight)] = true
    }
    
    func blockULPath(coordinates: CGPoint) {
        unblockAllPaths(coordinates: coordinates)
        self.PathsBlocked[String(describing: coordinates)] = true
        
        let up = CGPoint(x: coordinates.x, y: coordinates.y + 50)

        let farUp = CGPoint(x: coordinates.x, y: coordinates.y + 100)

        
        let left = CGPoint(x: coordinates.x - 50, y: coordinates.y)
        let farLeft = CGPoint(x: coordinates.x - 100, y: coordinates.y)
        
        self.PathsBlocked[String(describing: up)] = true
        self.PathsBlocked[String(describing: farUp)] = true
        self.PathsBlocked[String(describing: left)] = true
        self.PathsBlocked[String(describing: farLeft)] = true

    }
    
    func blockDLPath(coordinates: CGPoint) {
        unblockAllPaths(coordinates: coordinates)
        self.PathsBlocked[String(describing: coordinates)] = true
        
        let down = CGPoint(x: coordinates.x, y: coordinates.y - 50)
        let farDown = CGPoint(x: coordinates.x, y: coordinates.y - 100)
        
        let left = CGPoint(x: coordinates.x - 50, y: coordinates.y)
        let farLeft = CGPoint(x: coordinates.x - 100, y: coordinates.y)
        
        self.PathsBlocked[String(describing: down)] = true
        self.PathsBlocked[String(describing: farDown)] = true
        
        self.PathsBlocked[String(describing: left)] = true
        self.PathsBlocked[String(describing: farLeft)] = true
    }
    
    func blockURPath(coordinates: CGPoint) {
        unblockAllPaths(coordinates: coordinates)
        self.PathsBlocked[String(describing: coordinates)] = true
        
        let up = CGPoint(x: coordinates.x, y: coordinates.y + 50)
        let farUp = CGPoint(x: coordinates.x, y: coordinates.y + 100)
        
        let right = CGPoint(x: coordinates.x + 50, y: coordinates.y)
        let farRight = CGPoint(x: coordinates.x + 100, y: coordinates.y)
        
        self.PathsBlocked[String(describing: up)] = true
        self.PathsBlocked[String(describing: farUp)] = true
        self.PathsBlocked[String(describing: right)] = true
        self.PathsBlocked[String(describing: farRight)] = true
    }
    
    func blockDRPath(coordinates: CGPoint) {
        unblockAllPaths(coordinates: coordinates)
        self.PathsBlocked[String(describing: coordinates)] = true
        
        let down = CGPoint(x: coordinates.x, y: coordinates.y - 50)
        let farDown = CGPoint(x: coordinates.x, y: coordinates.y - 100)
        
        let right = CGPoint(x: coordinates.x + 50, y: coordinates.y)
        let farRight = CGPoint(x: coordinates.x + 100, y: coordinates.y)
        
        self.PathsBlocked[String(describing: down)] = true
        self.PathsBlocked[String(describing: farDown)] = true
        
        self.PathsBlocked[String(describing: right)] = true
        self.PathsBlocked[String(describing: farRight)] = true
    }
    
    
    
    func autoCompleteSlaveNodes(slaveTile: String, masterTile: String) {
        for slave in plainDirtNodes {
            // ⚪️ UP
            var upPoint = slave.position
            upPoint.y += 250
            let nodeUp = self.atPoint(upPoint)
            // ⚪️ DOWN
            var downPoint = slave.position
            downPoint.y -= 250
            let nodeDown = self.atPoint(downPoint)
            // ⚪️ LEFT
            var leftPoint = slave.position
            leftPoint.x -= 250
            let nodeLeft = self.atPoint(leftPoint)
            // ⚪️ RIGHT
            var rightPoint = slave.position
            rightPoint.x += 250
            let nodeRight = self.atPoint(rightPoint)
            // ⚪️ UL
            var ULPoint = slave.position
            ULPoint.x -= 250
            ULPoint.y += 250
            let nodeUL = self.atPoint(ULPoint)
            // ⚪️ UR
            var URPoint = slave.position
            URPoint.x += 250
            URPoint.y += 250
            let nodeUR = self.atPoint(URPoint)
            // ⚪️ DL
            var DLPoint = slave.position
            DLPoint.x -= 250
            DLPoint.y -= 250
            let nodeDL = self.atPoint(DLPoint)
            // ⚪️ DR
            var DRPoint = slave.position
            DRPoint.x += 250
            DRPoint.y -= 250
            let nodeDR = self.atPoint(DRPoint)
            
            
            if nodeUp.name == "AG-\(slaveTile)-plain-n_tile" &&
                nodeDown.name == "AG-\(slaveTile)-plain-n_tile" &&
                nodeLeft.name == "AG-\(slaveTile)-plain-n_tile" &&
                nodeRight.name == "AG-\(slaveTile)-plain-n_tile" &&
                nodeUL.name == "AG-\(slaveTile)-plain-n_tile" &&
                nodeUR.name == "AG-\(slaveTile)-plain-n_tile" &&
                nodeDL.name == "AG-\(slaveTile)-plain-n_tile" &&
                nodeDR.name == "AG-\(slaveTile)-plain-n_tile" {
                
                (nodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)_\(masterTile)")
                nodeUp.name = "AG-\(slaveTile)_\(masterTile)-n_tile"

                (nodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(masterTile)_\(slaveTile)")
                nodeDown.name = "AG-\(masterTile)_\(slaveTile)-n_tile"
                
                (nodeLeft as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)|\(masterTile)")
                nodeLeft.name = "AG-\(masterTile)|\(slaveTile)-n_tile"

                (nodeRight as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(masterTile)|\(slaveTile)")
                nodeRight.name = "AG-\(slaveTile)|\(masterTile)-n_tile"
                
                (nodeUL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)-\(masterTile)DR")
                nodeUL.name = "AG-\(slaveTile)-\(masterTile)DR-n_tile"

                (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)-\(masterTile)DL")
                nodeUR.name = "AG-\(slaveTile)-\(masterTile)DL-n_tile"

                (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)-\(masterTile)UR")
                nodeDL.name = "AG-\(slaveTile)-\(masterTile)UR-n_tile"
                
                (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)-\(masterTile)UL")
                nodeDR.name = "AG-\(slaveTile)-\(masterTile)UL-n_tile"
                
                slave.texture = SKTexture(imageNamed: "AG-\(masterTile)-plain")
                slave.name = "xxAG-\(masterTile)-plain-n_tilexx"
            }
            
        }
    }
    
    
    
    func autoCompletePlainGrassNodes(dominantTile: DominantTileType) {
        
        let totalPlain = plainGrassNodes.count
        var counter = 0
        
        
        for grassPlainPrePlaced in plainGrassNodes {
            // check left side:
//            grassPlainPrePlaced.alpha = 0.5
            
            logtile("FINISHED: \(counter) / \(totalPlain) ")
            counter += 1
            
            var dominantTileName = "coast"
            var subTileName = "dirt"
            
            // ⚪️ UP
            var upPoint = grassPlainPrePlaced.position
            upPoint.y += 250
            let prePlacedNodeUp = self.atPoint(upPoint)
            if prePlacedNodeUp.name == nil {
                
                let grassUp = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)_\(dominantTileName)")
                grassUp.sprite.position = upPoint
                grassUp.sprite.name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                self.addChild(grassUp.sprite)
                self.autoCompleteGrassNodes.append(grassUp.sprite as! TileSpriteNode)
                blockHorizontalPath(coordinates: upPoint)
                
            } else {
                logtile(prePlacedNodeUp.name)
                logtile("sdfg")
                if prePlacedNodeUp.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! TileSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                    blockHorizontalPath(coordinates: prePlacedNodeUp.position)
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)-plain-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! TileSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                    blockHorizontalPath(coordinates: prePlacedNodeUp.position)
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeUp as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: prePlacedNodeUp.position)
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! TileSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                    blockHorizontalPath(coordinates: prePlacedNodeUp.position)
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (prePlacedNodeUp as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    blockURPath(coordinates: prePlacedNodeUp.position)
                    autoCompletedGrassCornerNodes.append(prePlacedNodeUp)
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (prePlacedNodeUp as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    blockULPath(coordinates: prePlacedNodeUp.position)
                    autoCompletedGrassCornerNodes.append(prePlacedNodeUp)
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeUp as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: prePlacedNodeUp.position)
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)-\(subTileName)DL-n_tile" {
                    
                    var farUpPoint = upPoint
                    farUpPoint.y += 250
                    let prePlacedNodeFarUp = self.atPoint(farUpPoint)
                    if prePlacedNodeFarUp.name == "AG-\(dominantTileName)-plain" {
                        (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (prePlacedNodeUp as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                        unblockAllPaths(coordinates: prePlacedNodeUp.position)
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
                //                    let grass = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)-plain")
                //                    grass.sprite.position = downPoint
                //                    grass.sprite.name = "grass-plain"
                //                    self.addChild(grass.sprite)
                //                    self.autoCompleteGrassNodes.append(grass.sprite)
                //                } else {
                let grassDown = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)_\(subTileName)")
                grassDown.sprite.position = downPoint
                grassDown.sprite.name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                self.addChild(grassDown.sprite)
                self.autoCompleteGrassNodes.append(grassDown.sprite as! TileSpriteNode)
                //                }
                
            } else {
                logtile("node: \(prePlacedNodeDown.name)")
                let ps = prePlacedNodeDown.position
                
                if prePlacedNodeDown.name == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeDown)
                    blockDLPath(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-plain-n_tile" {
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                    unblockAllPaths(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeDown)
                    blockDRPath(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)_\(dominantTileName)-n_tile" {
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" || prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                    blockHorizontalPath(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    logtile("D123: \(prePlacedNodeFarDown.name)")
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)-\(subTileName)DR-n_tile" { // might be useless:
                        (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                        blockVerticalPath(coordinates: ps)
                    } else {
                        (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                        (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                        blockDRPath(coordinates: ps)
                    }
                    
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" { // new 2
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    blockDLPath(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UR-n_tile" { // new
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UL-n_tile" { // new 3
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UL-n_tile" {
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)-plain" {
                        (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (prePlacedNodeDown as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                        unblockAllPaths(coordinates: ps)
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
                //                    let grassT = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)-plain")
                //                    grassT.sprite.position = rightPoint
                //                    grassT.sprite.name = "grass-plain"
                //                    self.addChild(grassT.sprite)
                //                    self.autoCompleteGrassNodes.append(grassT.sprite)
                //                } else {
                let grassLeft = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)|\(dominantTileName)")
                grassLeft.sprite.position = leftPoint
                grassLeft.sprite.name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                self.addChild(grassLeft.sprite)
                self.autoCompleteGrassNodes.append(grassLeft.sprite as! TileSpriteNode)
                //                }
                
            } else {
                
                logtile(leftNode.name)
                let ps = leftNode.position
                
                if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" || leftNode.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                    blockVerticalPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)-plain-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                    blockVerticalPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    blockULPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    //thisone?
                    //                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    //                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    //                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    blockDLPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)_\(dominantTileName)-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    blockULPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    blockDLPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    blockULPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)DR-n_tile" {
                    // might break tile engine
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    // grass corner up right needs to be replaced:
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                    blockVerticalPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)UR-n_tile" {
                    // grass corner up right needs to be replaced:
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: ps)
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)UR-n_tile" {
                    var farLeftPoint = leftPoint
                    farLeftPoint.x -= 250
                    let farLeftNode = self.atPoint(farLeftPoint)
                    if farLeftNode.name == "AG-\(dominantTileName)-plain" {
                        (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (leftNode as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                        unblockAllPaths(coordinates: ps)
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
                //                    let grassRight = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)-plain")
                //                    grassRight.sprite.position = rightPoint
                //                    grassRight.sprite.name = "grass-plain"
                //                    self.addChild(grassRight.sprite)
                //                    self.autoCompleteGrassNodes.append(grassRight.sprite)
                //                } else {
                let grassRight = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)|\(subTileName)")
                grassRight.sprite.position = rightPoint
                grassRight.sprite.name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                self.addChild(grassRight.sprite)
                self.autoCompleteGrassNodes.append(grassRight.sprite as! TileSpriteNode)
                //                }
                
            } else {
                
                logtile(node1.name!)
                logtile("RIGHT")
                let ps = node1.position
                
                if  node1.name! == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    logtile((node1 as! TileSpriteNode).name)
                    (node1 as! TileSpriteNode).alpha = 1
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                    blockVerticalPath(coordinates: ps)
                }
                else if node1.name == "AG-\(subTileName)-plain-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                    blockVerticalPath(coordinates: ps)
                }
                else if node1.name! == "AG-\(subTileName)_\(dominantTileName)-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(node1)
                    blockURPath(coordinates: ps)
                }
                else if node1.name! == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (node1 as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: ps)
                }
                else if node1.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    autoCompletedGrassCornerNodes.append(node1)
                    blockDRPath(coordinates: ps)
                }
                else if node1.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(node1)
                    blockURPath(coordinates: ps)
                }
                else if node1.name! == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" {
                    //                    (node1 as! TileSpriteNode).alpha = 0.85
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                    blockVerticalPath(coordinates: ps)
                }
                else if node1.name! == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    autoCompletedGrassCornerNodes.append(node1)
                    blockDRPath(coordinates: ps)
                }
                else if node1.name! == "AG-\(dominantTileName)-\(subTileName)DL-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (node1 as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: ps)
                }
                else if node1.name == "AG-\(dominantTileName)-\(subTileName)UL-n_tile" {
                    var farRightPoint = rightPoint
                    farRightPoint.x += 250
                    let farRightNode = self.atPoint(farRightPoint)
                    
                    if farRightNode.name == "AG-\(dominantTileName)-plain" {
                        (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (node1 as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                        unblockAllPaths(coordinates: ps)
                    }
                }
                else if node1.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    var farRightPoint = rightPoint
                    farRightPoint.x += 250
                    let farRightNode = self.atPoint(farRightPoint)
                    
                    if farRightNode.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                        (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                        (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                        blockDRPath(coordinates: ps)
                        autoCompletedGrassCornerNodes.append(node1)
                    }
                }
            }
            
            
            
            // ⚪️ UL
            var ULPoint = grassPlainPrePlaced.position
            ULPoint.x -= 250
            ULPoint.y += 250
            let nodeUL = self.atPoint(ULPoint)
            logtile(nodeUL.name)
            if nodeUL.name == nil {
                let grassUL = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)-\(dominantTileName)DR")
                grassUL.sprite.position = ULPoint
                grassUL.sprite.name = "AG-\(subTileName)-\(dominantTileName)DR-n_tile"
                self.addChild(grassUL.sprite)
                autoCompletedGrassCornerNodes.append(grassUL.sprite)
                self.autoCompleteGrassNodes.append(grassUL.sprite as! TileSpriteNode)
            } else {
                
                let ps = nodeUL.position
                
                if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    (nodeUL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (nodeUL as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                    blockVerticalPath(coordinates: ps)
                }
                else if nodeUL.name == "AG-\(subTileName)-plain-n_tile" {
                    (nodeUL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (nodeUL as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n_tile"
                    blockDRPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeUL)
                }
                else if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    (nodeUL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (nodeUL as! TileSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                    blockHorizontalPath(coordinates: ps)
                }
                else if nodeUL.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (nodeUL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (nodeUL as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    blockURPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeUL)
                }
                else if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    blockULPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var leftPoint = grassPlainPrePlaced.position
                    leftPoint.x -= 250
                    let leftNode = self.atPoint(leftPoint)
                    
                    var upPoint = grassPlainPrePlaced.position
                    upPoint.y += 250
                    let upNode = self.atPoint(upPoint)
                    
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (leftNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n_tile"
                    blockDRPath(coordinates: leftNode.position)
                    autoCompletedGrassCornerNodes.append(leftNode)
                    
                    (upNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (upNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n_tile"
                    blockDRPath(coordinates: upNode.position)
                    autoCompletedGrassCornerNodes.append(upNode)
                }
            }
            
            
            // ⚪️ UR
            var URPoint = grassPlainPrePlaced.position
            URPoint.x += 250
            URPoint.y += 250
            let nodeUR = self.atPoint(URPoint)
            logtile(nodeUR.name)
            if nodeUR.name == nil {
                
                //                var farRightPoint = rightPoint
                //                farRightPoint.x += 250
                //                let farRightNode = self.atPoint(farRightPoint)
                //
                //                if farRightNode.name == "grass-plain" {
                //                    let grassUp = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)_\(dominantTileName)")
                //                    grassUp.sprite.position = URPoint
                //                    grassUp.sprite.name = "grass-down"
                //                    self.addChild(grassUp.sprite)
                //                    self.autoCompleteGrassNodes.append(grassUp.sprite)
                //                } else {
                let grassUR = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)-\(dominantTileName)DL")
                grassUR.sprite.position = URPoint
                grassUR.sprite.name = "AG-\(subTileName)-\(dominantTileName)DL-n_tile"
                self.addChild(grassUR.sprite)
                self.autoCompleteGrassNodes.append(grassUR.sprite as! TileSpriteNode)
                autoCompletedGrassCornerNodes.append(grassUR.sprite)
                //                }
                
                
            } else {
                
                let ps = nodeUR.position
                
                if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" {
                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (nodeUR as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                    blockVerticalPath(coordinates: ps)
                }
                else if nodeUR.name == "AG-\(subTileName)-plain-n_tile" {
                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (nodeUR as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n_tile"
                    blockDLPath(coordinates: ps)
                }
                else if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (nodeUR as! TileSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                    blockHorizontalPath(coordinates: ps)
                }
                else if nodeUR.name == "AG-\(dominantTileName)-\(subTileName)DL-n_tile" {
                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeUR as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: ps)
                }
                else if nodeUR.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (nodeUR as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    blockDRPath(coordinates: ps)
                    //                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    //                    (nodeUR as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                }
                    //                else if nodeUR.name == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    //                    if prePlacedNodeUp.name == "AG-\(dominantTileName)-plain" {
                    //                    } else {
                    //                        (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    //                        (nodeUR as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    //                    }
                    //                }
                else if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    blockURPath(coordinates: ps)
                    
                    var rightPoint = grassPlainPrePlaced.position
                    rightPoint.x += 250
                    let rightNode = self.atPoint(rightPoint)
                    
                    var upPoint = grassPlainPrePlaced.position
                    upPoint.y += 250
                    let upNode = self.atPoint(upPoint)
                    
                    (rightNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (rightNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n_tile"
                    blockDLPath(coordinates: rightNode.position)
                    autoCompletedGrassCornerNodes.append(rightNode)
                    
                    (upNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (upNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n_tile"
                    blockDLPath(coordinates: upNode.position)
                    autoCompletedGrassCornerNodes.append(upNode)
                }
            }
            
            
            // ⚪️ DL
            var DLPoint = grassPlainPrePlaced.position
            DLPoint.x -= 250
            DLPoint.y -= 250
            let nodeDL = self.atPoint(DLPoint)
            logtile(nodeDL.name)
            if nodeDL.name == nil {
                let grassDL = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)-\(dominantTileName)UR")
                grassDL.sprite.position = DLPoint
                grassDL.sprite.name = "AG-\(subTileName)-\(dominantTileName)UR-n_tile"
                self.addChild(grassDL.sprite)
                self.autoCompleteGrassNodes.append(grassDL.sprite as! TileSpriteNode)
                autoCompletedGrassCornerNodes.append(grassDL.sprite)
            } else {
                let ps = nodeDL.position
                if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (nodeDL as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                    blockVerticalPath(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(subTileName)-plain-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                    (nodeDL as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(nodeDL)
                    blockURPath(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDL as! TileSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                    blockHorizontalPath(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (nodeDL as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    autoCompletedGrassCornerNodes.append(nodeDL)
                    blockDRPath(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(subTileName)_\(dominantTileName)-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (nodeDL as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    blockULPath(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" { // HMMMM ???
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDL as! TileSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                    blockHorizontalPath(coordinates: ps)
                    logtile("BUG FIX HMMMM??? JUST EXECUTED!!!")
                }
                else if nodeDL.name == "AG-\(dominantTileName)-\(subTileName)UR-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeDL as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    blockDLPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var leftPoint = grassPlainPrePlaced.position
                    leftPoint.x -= 250
                    let leftNode = self.atPoint(leftPoint)
                    
                    var downPoint = grassPlainPrePlaced.position
                    downPoint.y -= 250
                    let downNode = self.atPoint(downPoint)
                    
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                    (leftNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n_tile"
                    blockURPath(coordinates: leftNode.position)
                    autoCompletedGrassCornerNodes.append(leftNode)
                    
                    logtile("downNode Name: \(downNode.name)")
                    logtile("")
                    
                    if downNode.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" { // "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                        (downNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                        (downNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n_tile"
                        blockURPath(coordinates: downNode.position)
                    }
                    else if downNode.name == "AG-\(dominantTileName)-\(subTileName)DL-n_tile" {
                        (downNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                        (downNode as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                        blockVerticalPath(coordinates: downNode.position)
                    }
                    else {
                        (downNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (downNode as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                        blockVerticalPath(coordinates: downNode.position)
                        //                        autoCompletedGrassCornerNodes.append(downNode)
                    }
                }
            }
            
            
            
            // ⚪️ DR
            var DRPoint = grassPlainPrePlaced.position
            DRPoint.x += 250
            DRPoint.y -= 250
            let nodeDR = self.atPoint(DRPoint)
            logtile(nodeDR.name)
            if nodeDR.name == nil {
                
                //                var farRightPoint = rightPoint
                //                farRightPoint.x += 250
                //                let farRightNode = self.atPoint(farRightPoint)
                //
                //                if farRightNode.name == "grass-plain" {
                //                    let grassDown = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)_\(subTileName)")
                //                    grassDown.sprite.position = DRPoint
                //                    grassDown.sprite.name = "grass-up"
                //                    self.addChild(grassDown.sprite)
                //                    self.autoCompleteGrassNodes.append(grassDown.sprite)
                //                } else {
                let grassDR = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)-\(dominantTileName)UL")
                grassDR.sprite.position = DRPoint
                grassDR.sprite.name = "AG-\(subTileName)-\(dominantTileName)UL-n_tile"
                autoCompletedGrassCornerNodes.append(grassDR.sprite)
                self.addChild(grassDR.sprite)
                self.autoCompleteGrassNodes.append(grassDR.sprite as! TileSpriteNode)
                //                }
                
            } else {
                
                let ps = nodeDR.position
                
                if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDR as! TileSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                    blockHorizontalPath(coordinates: ps)
                }
                else if nodeDR.name == "AG-\(subTileName)-plain-n_tile" {
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                    (nodeDR as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n_tile"
                    blockULPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (nodeDR as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                    blockVerticalPath(coordinates: ps)
                }
                else if nodeDR.name == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (nodeDR as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    blockDLPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)_\(dominantTileName)-n_tile" {
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (nodeDR as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    blockURPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(dominantTileName)-\(subTileName)UL-n_tile" { // new
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeDR as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    unblockAllPaths(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    blockDRPath(coordinates: grassPlainPrePlaced.position)
                    
                    var rightPoint = grassPlainPrePlaced.position
                    rightPoint.x += 250
                    let rightNode = self.atPoint(rightPoint)
                    
                    var downPoint = grassPlainPrePlaced.position
                    downPoint.y -= 250
                    let downNode = self.atPoint(downPoint)
                    
                    (rightNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                    (rightNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n_tile"
                    blockULPath(coordinates: rightNode.position)
                    autoCompletedGrassCornerNodes.append(rightNode)
                    
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    logtile("D123: \(prePlacedNodeFarDown.name)")
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" { // might be useless:
                        (downNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (downNode as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                        blockVerticalPath(coordinates: downNode.position)
                    } else {
                        (downNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                        (downNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n_tile"
                        blockULPath(coordinates: downNode.position)
                        autoCompletedGrassCornerNodes.append(downNode)
                    }
                }
            }
            
            
            
            
            
        }
    }
    
    // _____________________________________________________________________________________________
    
    func autoCompleteLayer2(dominantTile: DominantTileType) {
        
        let totalPlain = plainGrassNodesLayer2.count
        var counter = 0
        
        
        for grassPlainPrePlaced in plainGrassNodesLayer2 {
            // check left side:
            //            grassPlainPrePlaced.alpha = 0.5
            
            logtile("FINISHED: \(counter) / \(totalPlain) ")
            counter += 1
            
            var dominantTileName = "grass"
            var subTileName = "dirt"
            
            // ⚪️ UP
            var upPoint = grassPlainPrePlaced.position
            upPoint.y += 250
            let prePlacedNodeUp = self.atPoint(upPoint)
            if prePlacedNodeUp.name == nil {
                
                let grassUp = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)_\(dominantTileName)")
                grassUp.sprite.position = upPoint
                grassUp.sprite.name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                self.addChild(grassUp.sprite)
                self.autoCompleteGrassNodes.append(grassUp.sprite as! TileSpriteNode)
            } else {
                logtile(prePlacedNodeUp.name)
                logtile("sdfg")
                if prePlacedNodeUp.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! TileSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)-plain-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! TileSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeUp as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! TileSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (prePlacedNodeUp as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeUp)
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (prePlacedNodeUp as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeUp)
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                    (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeUp as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)-\(subTileName)DL-n_tile" {
                    
                    var farUpPoint = upPoint
                    farUpPoint.y += 250
                    let prePlacedNodeFarUp = self.atPoint(farUpPoint)
                    if prePlacedNodeFarUp.name == "AG-\(dominantTileName)-plain" {
                        (prePlacedNodeUp as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (prePlacedNodeUp as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
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
                //                    let grass = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)-plain")
                //                    grass.sprite.position = downPoint
                //                    grass.sprite.name = "grass-plain"
                //                    self.addChild(grass.sprite)
                //                    self.autoCompleteGrassNodes.append(grass.sprite)
                //                } else {
                let grassDown = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)_\(subTileName)")
                grassDown.sprite.position = downPoint
                grassDown.sprite.name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                self.addChild(grassDown.sprite)
                self.autoCompleteGrassNodes.append(grassDown.sprite as! TileSpriteNode)
                //                }
                
            } else {
                logtile("node: \(prePlacedNodeDown.name)")
                if prePlacedNodeDown.name == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeDown)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-plain-n_tile" {
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeDown)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)_\(dominantTileName)-n_tile" {
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" || prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    logtile("D123: \(prePlacedNodeFarDown.name)")
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)-\(subTileName)DR-n_tile" { // might be useless:
                        (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                    } else {
                        (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                        (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    }
                    
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" { // new 2
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (prePlacedNodeDown as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UR-n_tile" { // new
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UL-n_tile" { // new 3
                    (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UL-n_tile" {
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)-plain" {
                        (prePlacedNodeDown as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (prePlacedNodeDown as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
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
                //                    let grassT = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)-plain")
                //                    grassT.sprite.position = rightPoint
                //                    grassT.sprite.name = "grass-plain"
                //                    self.addChild(grassT.sprite)
                //                    self.autoCompleteGrassNodes.append(grassT.sprite)
                //                } else {
                let grassLeft = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)|\(dominantTileName)")
                grassLeft.sprite.position = leftPoint
                grassLeft.sprite.name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                self.addChild(grassLeft.sprite)
                self.autoCompleteGrassNodes.append(grassLeft.sprite as! TileSpriteNode)
                //                }
                
            } else {
                
                logtile(leftNode.name)
                
                if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" || leftNode.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                }
                else if leftNode.name == "AG-\(subTileName)-plain-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    //thisone?
                    //                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    //                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    //                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(subTileName)_\(dominantTileName)-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)DR-n_tile" {
                    // might break tile engine
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    // grass corner up right needs to be replaced:
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)UR-n_tile" {
                    // grass corner up right needs to be replaced:
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! TileSpriteNode).name = "AG-\(dominantTileName)-plain-n_tile"
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)UR-n_tile" {
                    var farLeftPoint = leftPoint
                    farLeftPoint.x -= 250
                    let farLeftNode = self.atPoint(farLeftPoint)
                    if farLeftNode.name == "AG-\(dominantTileName)-plain" {
                        (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (leftNode as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
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
                //                    let grassRight = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)-plain")
                //                    grassRight.sprite.position = rightPoint
                //                    grassRight.sprite.name = "grass-plain"
                //                    self.addChild(grassRight.sprite)
                //                    self.autoCompleteGrassNodes.append(grassRight.sprite)
                //                } else {
                let grassRight = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)|\(subTileName)")
                grassRight.sprite.position = rightPoint
                grassRight.sprite.name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                self.addChild(grassRight.sprite)
                self.autoCompleteGrassNodes.append(grassRight.sprite as! TileSpriteNode)
                //                }
                
            } else {
                
                logtile(node1.name!)
                logtile("RIGHT")
                
                if  node1.name! == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    logtile((node1 as! TileSpriteNode).name)
                    (node1 as! TileSpriteNode).alpha = 1
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                }
                else if node1.name == "AG-\(subTileName)-plain-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                }
                else if node1.name! == "AG-\(subTileName)_\(dominantTileName)-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name! == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (node1 as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                }
                else if node1.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name! == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" {
                    //                    (node1 as! TileSpriteNode).alpha = 0.85
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                }
                else if node1.name! == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name! == "AG-\(dominantTileName)-\(subTileName)DL-n_tile" {
                    (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (node1 as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                }
                else if node1.name == "AG-\(dominantTileName)-\(subTileName)UL-n_tile" {
                    var farRightPoint = rightPoint
                    farRightPoint.x += 250
                    let farRightNode = self.atPoint(farRightPoint)
                    
                    if farRightNode.name == "AG-\(dominantTileName)-plain" {
                        (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (node1 as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    }
                }
                else if node1.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    var farRightPoint = rightPoint
                    farRightPoint.x += 250
                    let farRightNode = self.atPoint(farRightPoint)
                    
                    if farRightNode.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" {
                        (node1 as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                        (node1 as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                        autoCompletedGrassCornerNodes.append(node1)
                    }
                }
            }
            
            
            
            
            var ULPoint = grassPlainPrePlaced.position
            ULPoint.x -= 250
            ULPoint.y += 250
            let nodeUL = self.atPoint(ULPoint)
            logtile(nodeUL.name)
            if nodeUL.name == nil {
                let grassLeft = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)-\(dominantTileName)DR")
                grassLeft.sprite.position = ULPoint
                grassLeft.sprite.name = "AG-\(subTileName)-\(dominantTileName)DR-n_tile"
                self.addChild(grassLeft.sprite)
                autoCompletedGrassCornerNodes.append(grassLeft.sprite)
                self.autoCompleteGrassNodes.append(grassLeft.sprite as! TileSpriteNode)
            } else {
                if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    (nodeUL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (nodeUL as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                }
                else if nodeUL.name == "AG-\(subTileName)-plain-n_tile" {
                    (nodeUL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (nodeUL as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n_tile"
                    autoCompletedGrassCornerNodes.append(nodeUL)
                }
                else if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    (nodeUL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (nodeUL as! TileSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                }
                else if nodeUL.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (nodeUL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (nodeUL as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(nodeUL)
                }
                else if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var leftPoint = grassPlainPrePlaced.position
                    leftPoint.x -= 250
                    let leftNode = self.atPoint(leftPoint)
                    
                    var upPoint = grassPlainPrePlaced.position
                    upPoint.y += 250
                    let upNode = self.atPoint(upPoint)
                    
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (leftNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    
                    (upNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (upNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n_tile"
                    autoCompletedGrassCornerNodes.append(upNode)
                }
            }
            
            
            
            var URPoint = grassPlainPrePlaced.position
            URPoint.x += 250
            URPoint.y += 250
            let nodeUR = self.atPoint(URPoint)
            logtile(nodeUR.name)
            if nodeUR.name == nil {
                
                //                var farRightPoint = rightPoint
                //                farRightPoint.x += 250
                //                let farRightNode = self.atPoint(farRightPoint)
                //
                //                if farRightNode.name == "grass-plain" {
                //                    let grassUp = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)_\(dominantTileName)")
                //                    grassUp.sprite.position = URPoint
                //                    grassUp.sprite.name = "grass-down"
                //                    self.addChild(grassUp.sprite)
                //                    self.autoCompleteGrassNodes.append(grassUp.sprite)
                //                } else {
                let grassLeft = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)-\(dominantTileName)DL")
                grassLeft.sprite.position = URPoint
                grassLeft.sprite.name = "AG-\(subTileName)-\(dominantTileName)DL-n_tile"
                self.addChild(grassLeft.sprite)
                self.autoCompleteGrassNodes.append(grassLeft.sprite as! TileSpriteNode)
                autoCompletedGrassCornerNodes.append(grassLeft.sprite)
                //                }
                
                
            } else {
                if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" {
                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (nodeUR as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                }
                else if nodeUR.name == "AG-\(subTileName)-plain-n_tile" {
                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (nodeUR as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n_tile"
                }
                else if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (nodeUR as! TileSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n_tile"
                }
                else if nodeUR.name == "AG-\(dominantTileName)-\(subTileName)DL-n_tile" {
                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeUR as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                }
                else if nodeUR.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (nodeUR as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    //                    (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    //                    (nodeUR as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                }
                    //                else if nodeUR.name == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    //                    if prePlacedNodeUp.name == "AG-\(dominantTileName)-plain" {
                    //                    } else {
                    //                        (nodeUR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    //                        (nodeUR as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                    //                    }
                    //                }
                else if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var rightPoint = grassPlainPrePlaced.position
                    rightPoint.x += 250
                    let rightNode = self.atPoint(rightPoint)
                    
                    var upPoint = grassPlainPrePlaced.position
                    upPoint.y += 250
                    let upNode = self.atPoint(upPoint)
                    
                    (rightNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (rightNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n_tile"
                    autoCompletedGrassCornerNodes.append(rightNode)
                    
                    (upNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (upNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n_tile"
                    autoCompletedGrassCornerNodes.append(upNode)
                }
            }
            
            
            
            var DLPoint = grassPlainPrePlaced.position
            DLPoint.x -= 250
            DLPoint.y -= 250
            let nodeDL = self.atPoint(DLPoint)
            logtile(nodeDL.name)
            if nodeDL.name == nil {
                let grassUR = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)-\(dominantTileName)UR")
                grassUR.sprite.position = DLPoint
                grassUR.sprite.name = "AG-\(subTileName)-\(dominantTileName)UR-n_tile"
                self.addChild(grassUR.sprite)
                self.autoCompleteGrassNodes.append(grassUR.sprite as! TileSpriteNode)
                autoCompletedGrassCornerNodes.append(grassUR.sprite)
            } else {
                if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (nodeDL as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                }
                else if nodeDL.name == "AG-\(subTileName)-plain-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                    (nodeDL as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(nodeDL)
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDL as! TileSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                }
                else if nodeDL.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (nodeDL as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    autoCompletedGrassCornerNodes.append(nodeDL)
                }
                else if nodeDL.name == "AG-\(subTileName)_\(dominantTileName)-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (nodeDL as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n_tile"
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)UL-n_tile" { // HMMMM ???
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDL as! TileSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                    logtile("BUG FIX HMMMM??? JUST EXECUTED!!!")
                }
                else if nodeDL.name == "AG-\(dominantTileName)-\(subTileName)UR-n_tile" {
                    (nodeDL as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeDL as! TileSpriteNode).name = "AG-\(dominantTileName)-plain-n_tile"
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var leftPoint = grassPlainPrePlaced.position
                    leftPoint.x -= 250
                    let leftNode = self.atPoint(leftPoint)
                    
                    var downPoint = grassPlainPrePlaced.position
                    downPoint.y -= 250
                    let downNode = self.atPoint(downPoint)
                    
                    (leftNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                    (leftNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    
                    logtile("downNode Name: \(downNode.name)")
                    logtile("")
                    
                    if downNode.name == "AG-\(dominantTileName)_\(subTileName)-n_tile" { // "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                        (downNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                        (downNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n_tile"
                    }
                    else if downNode.name == "AG-\(dominantTileName)-\(subTileName)DL-n_tile" {
                        (downNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                        (downNode as! TileSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n_tile"
                    }
                    else {
                        (downNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (downNode as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                        //                        autoCompletedGrassCornerNodes.append(downNode)
                    }
                }
            }
            
            
            
            
            var DRPoint = grassPlainPrePlaced.position
            DRPoint.x += 250
            DRPoint.y -= 250
            let nodeDR = self.atPoint(DRPoint)
            logtile(nodeDR.name)
            if nodeDR.name == nil {
                
                //                var farRightPoint = rightPoint
                //                farRightPoint.x += 250
                //                let farRightNode = self.atPoint(farRightPoint)
                //
                //                if farRightNode.name == "grass-plain" {
                //                    let grassDown = SKAmazingGrassTile(imageNamed:"AG-\(dominantTileName)_\(subTileName)")
                //                    grassDown.sprite.position = DRPoint
                //                    grassDown.sprite.name = "grass-up"
                //                    self.addChild(grassDown.sprite)
                //                    self.autoCompleteGrassNodes.append(grassDown.sprite)
                //                } else {
                let grassUL = SKAmazingGrassTile(imageNamed:"AG-\(subTileName)-\(dominantTileName)UL")
                grassUL.sprite.position = DRPoint
                grassUL.sprite.name = "AG-\(subTileName)-\(dominantTileName)UL-n_tile"
                
                autoCompletedGrassCornerNodes.append(grassUL.sprite)
                self.addChild(grassUL.sprite)
                self.autoCompleteGrassNodes.append(grassUL.sprite as! TileSpriteNode)
                //                }
                
            } else {
                if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)UR-n_tile" {
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDR as! TileSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n_tile"
                }
                else if nodeDR.name == "AG-\(subTileName)-plain-n_tile" {
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                    (nodeDR as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n_tile"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)DL-n_tile" {
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (nodeDR as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                }
                else if nodeDR.name == "AG-\(subTileName)|\(dominantTileName)-n_tile" {
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (nodeDR as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n_tile"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)_\(dominantTileName)-n_tile" {
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (nodeDR as! TileSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n_tile"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(dominantTileName)-\(subTileName)UL-n_tile" { // new
                    (nodeDR as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeDR as! TileSpriteNode).name = "xxAG-\(dominantTileName)-plain-n_tilexx"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)DR-n_tile" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)DR-n_tile"
                    
                    var rightPoint = grassPlainPrePlaced.position
                    rightPoint.x += 250
                    let rightNode = self.atPoint(rightPoint)
                    
                    var downPoint = grassPlainPrePlaced.position
                    downPoint.y -= 250
                    let downNode = self.atPoint(downPoint)
                    
                    (rightNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                    (rightNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n_tile"
                    autoCompletedGrassCornerNodes.append(rightNode)
                    
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    logtile("D123: \(prePlacedNodeFarDown.name)")
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)|\(subTileName)-n_tile" { // might be useless:
                        (downNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (downNode as! TileSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n_tile"
                    } else {
                        (downNode as! TileSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                        (downNode as! TileSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n_tile"
                        autoCompletedGrassCornerNodes.append(downNode)
                    }
                }
            }
            
            
            
            
            
        }
    }

    
}


public func logtile(_ line: Any) {
//    print(line)
}
