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
            
            
            if nodeUp.name == "AG-\(slaveTile)-plain-n" &&
                nodeDown.name == "AG-\(slaveTile)-plain-n" &&
                nodeLeft.name == "AG-\(slaveTile)-plain-n" &&
                nodeRight.name == "AG-\(slaveTile)-plain-n" &&
                nodeUL.name == "AG-\(slaveTile)-plain-n" &&
                nodeUR.name == "AG-\(slaveTile)-plain-n" &&
                nodeDL.name == "AG-\(slaveTile)-plain-n" &&
                nodeDR.name == "AG-\(slaveTile)-plain-n" {
                
                (nodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)_\(masterTile)")
                nodeUp.name = "AG-\(slaveTile)_\(masterTile)-n"

                (nodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(masterTile)_\(slaveTile)")
                nodeDown.name = "AG-\(masterTile)_\(slaveTile)-n"
                
                (nodeLeft as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)|\(masterTile)")
                nodeLeft.name = "AG-\(masterTile)|\(slaveTile)-n"

                (nodeRight as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(masterTile)|\(slaveTile)")
                nodeRight.name = "AG-\(slaveTile)|\(masterTile)-n"
                
                (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)-\(masterTile)DR")
                nodeUL.name = "AG-\(slaveTile)-\(masterTile)DR-n"

                (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)-\(masterTile)DL")
                nodeUR.name = "AG-\(slaveTile)-\(masterTile)DL-n"

                (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)-\(masterTile)UR")
                nodeDL.name = "AG-\(slaveTile)-\(masterTile)UR-n"
                
                (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(slaveTile)-\(masterTile)UL")
                nodeDR.name = "AG-\(slaveTile)-\(masterTile)UL-n"
                
                slave.texture = SKTexture(imageNamed: "AG-\(masterTile)-plain")
                slave.name = "xxAG-\(masterTile)-plain-nxx"
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
                grassUp.sprite.name = "AG-\(subTileName)_\(dominantTileName)-n"
                self.addChild(grassUp.sprite)
                self.autoCompleteGrassNodes.append(grassUp.sprite)
                blockHorizontalPath(coordinates: upPoint)
                
            } else {
                logtile(prePlacedNodeUp.name)
                logtile("sdfg")
                if prePlacedNodeUp.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n"
                    blockHorizontalPath(coordinates: prePlacedNodeUp.position)
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)-plain-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n"
                    blockHorizontalPath(coordinates: prePlacedNodeUp.position)
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)_\(subTileName)-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeUp as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: prePlacedNodeUp.position)
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n"
                    blockHorizontalPath(coordinates: prePlacedNodeUp.position)
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    blockURPath(coordinates: prePlacedNodeUp.position)
                    autoCompletedGrassCornerNodes.append(prePlacedNodeUp)
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)|\(dominantTileName)-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    blockULPath(coordinates: prePlacedNodeUp.position)
                    autoCompletedGrassCornerNodes.append(prePlacedNodeUp)
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)_\(subTileName)-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeUp as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: prePlacedNodeUp.position)
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)-\(subTileName)DL-n" {
                    
                    var farUpPoint = upPoint
                    farUpPoint.y += 250
                    let prePlacedNodeFarUp = self.atPoint(farUpPoint)
                    if prePlacedNodeFarUp.name == "AG-\(dominantTileName)-plain" {
                        (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (prePlacedNodeUp as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
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
                grassDown.sprite.name = "AG-\(dominantTileName)_\(subTileName)-n"
                self.addChild(grassDown.sprite)
                self.autoCompleteGrassNodes.append(grassDown.sprite)
                //                }
                
            } else {
                logtile("node: \(prePlacedNodeDown.name)")
                let ps = prePlacedNodeDown.position
                
                if prePlacedNodeDown.name == "AG-\(subTileName)|\(dominantTileName)-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeDown)
                    blockDLPath(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-plain-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n"
                    unblockAllPaths(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeDown)
                    blockDRPath(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)_\(dominantTileName)-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)UL-n" || prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n"
                    blockHorizontalPath(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    logtile("D123: \(prePlacedNodeFarDown.name)")
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)-\(subTileName)DR-n" { // might be useless:
                        (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                        blockVerticalPath(coordinates: ps)
                    } else {
                        (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                        (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                        blockDRPath(coordinates: ps)
                    }
                    
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)DR-n" { // new 2
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    blockDLPath(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UR-n" { // new
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UL-n" { // new 3
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: ps)
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UL-n" {
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)-plain" {
                        (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
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
                grassLeft.sprite.name = "AG-\(subTileName)|\(dominantTileName)-n"
                self.addChild(grassLeft.sprite)
                self.autoCompleteGrassNodes.append(grassLeft.sprite)
                //                }
                
            } else {
                
                logtile(leftNode.name)
                let ps = leftNode.position
                
                if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UR-n" || leftNode.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                    blockVerticalPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)-plain-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                    blockVerticalPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    blockULPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)|\(dominantTileName)-n" {
                    //thisone?
                    //                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    //                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    //                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(dominantTileName)_\(subTileName)-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    blockDLPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)_\(dominantTileName)-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    blockULPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UL-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    blockDLPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    blockULPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)DR-n" {
                    // might break tile engine
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: ps)
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    // grass corner up right needs to be replaced:
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                    blockVerticalPath(coordinates: ps)
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)UR-n" {
                    // grass corner up right needs to be replaced:
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: ps)
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)UR-n" {
                    var farLeftPoint = leftPoint
                    farLeftPoint.x -= 250
                    let farLeftNode = self.atPoint(farLeftPoint)
                    if farLeftNode.name == "AG-\(dominantTileName)-plain" {
                        (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (leftNode as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
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
                grassRight.sprite.name = "AG-\(dominantTileName)|\(subTileName)-n"
                self.addChild(grassRight.sprite)
                self.autoCompleteGrassNodes.append(grassRight.sprite)
                //                }
                
            } else {
                
                logtile(node1.name!)
                logtile("RIGHT")
                let ps = node1.position
                
                if  node1.name! == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    logtile((node1 as! SKSpriteNode).name)
                    (node1 as! SKSpriteNode).alpha = 1
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                    blockVerticalPath(coordinates: ps)
                }
                else if node1.name == "AG-\(subTileName)-plain-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                    blockVerticalPath(coordinates: ps)
                }
                else if node1.name! == "AG-\(subTileName)_\(dominantTileName)-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                    blockURPath(coordinates: ps)
                }
                else if node1.name! == "AG-\(subTileName)|\(dominantTileName)-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (node1 as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: ps)
                }
                else if node1.name == "AG-\(dominantTileName)_\(subTileName)-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                    blockDRPath(coordinates: ps)
                }
                else if node1.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                    blockURPath(coordinates: ps)
                }
                else if node1.name! == "AG-\(subTileName)-\(dominantTileName)UL-n" {
                    //                    (node1 as! SKSpriteNode).alpha = 0.85
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                    blockVerticalPath(coordinates: ps)
                }
                else if node1.name! == "AG-\(dominantTileName)_\(subTileName)-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                    blockDRPath(coordinates: ps)
                }
                else if node1.name! == "AG-\(dominantTileName)-\(subTileName)DL-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (node1 as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: ps)
                }
                else if node1.name == "AG-\(dominantTileName)-\(subTileName)UL-n" {
                    var farRightPoint = rightPoint
                    farRightPoint.x += 250
                    let farRightNode = self.atPoint(farRightPoint)
                    
                    if farRightNode.name == "AG-\(dominantTileName)-plain" {
                        (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (node1 as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                        unblockAllPaths(coordinates: ps)
                    }
                }
                else if node1.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    var farRightPoint = rightPoint
                    farRightPoint.x += 250
                    let farRightNode = self.atPoint(farRightPoint)
                    
                    if farRightNode.name == "AG-\(dominantTileName)_\(subTileName)-n" {
                        (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                        (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
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
                grassUL.sprite.name = "AG-\(subTileName)-\(dominantTileName)DR-n"
                self.addChild(grassUL.sprite)
                autoCompletedGrassCornerNodes.append(grassUL.sprite)
                self.autoCompleteGrassNodes.append(grassUL.sprite)
            } else {
                
                let ps = nodeUL.position
                
                if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (nodeUL as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                    blockVerticalPath(coordinates: ps)
                }
                else if nodeUL.name == "AG-\(subTileName)-plain-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (nodeUL as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n"
                    blockDRPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeUL)
                }
                else if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (nodeUL as! SKSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n"
                    blockHorizontalPath(coordinates: ps)
                }
                else if nodeUL.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (nodeUL as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    blockURPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeUL)
                }
                else if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)UL-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    blockULPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var leftPoint = grassPlainPrePlaced.position
                    leftPoint.x -= 250
                    let leftNode = self.atPoint(leftPoint)
                    
                    var upPoint = grassPlainPrePlaced.position
                    upPoint.y += 250
                    let upNode = self.atPoint(upPoint)
                    
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (leftNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n"
                    blockDRPath(coordinates: leftNode.position)
                    autoCompletedGrassCornerNodes.append(leftNode)
                    
                    (upNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (upNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n"
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
                grassUR.sprite.name = "AG-\(subTileName)-\(dominantTileName)DL-n"
                self.addChild(grassUR.sprite)
                self.autoCompleteGrassNodes.append(grassUR.sprite)
                autoCompletedGrassCornerNodes.append(grassUR.sprite)
                //                }
                
                
            } else {
                
                let ps = nodeUR.position
                
                if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)UL-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (nodeUR as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                    blockVerticalPath(coordinates: ps)
                }
                else if nodeUR.name == "AG-\(subTileName)-plain-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (nodeUR as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n"
                    blockDLPath(coordinates: ps)
                }
                else if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (nodeUR as! SKSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n"
                    blockHorizontalPath(coordinates: ps)
                }
                else if nodeUR.name == "AG-\(dominantTileName)-\(subTileName)DL-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeUR as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: ps)
                }
                else if nodeUR.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (nodeUR as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    blockDRPath(coordinates: ps)
                    //                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    //                    (nodeUR as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                }
                    //                else if nodeUR.name == "AG-\(subTileName)|\(dominantTileName)-n" {
                    //                    if prePlacedNodeUp.name == "AG-\(dominantTileName)-plain" {
                    //                    } else {
                    //                        (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    //                        (nodeUR as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    //                    }
                    //                }
                else if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    blockURPath(coordinates: ps)
                    
                    var rightPoint = grassPlainPrePlaced.position
                    rightPoint.x += 250
                    let rightNode = self.atPoint(rightPoint)
                    
                    var upPoint = grassPlainPrePlaced.position
                    upPoint.y += 250
                    let upNode = self.atPoint(upPoint)
                    
                    (rightNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (rightNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n"
                    blockDLPath(coordinates: rightNode.position)
                    autoCompletedGrassCornerNodes.append(rightNode)
                    
                    (upNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (upNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n"
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
                grassDL.sprite.name = "AG-\(subTileName)-\(dominantTileName)UR-n"
                self.addChild(grassDL.sprite)
                self.autoCompleteGrassNodes.append(grassDL.sprite)
                autoCompletedGrassCornerNodes.append(grassDL.sprite)
            } else {
                let ps = nodeDL.position
                if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (nodeDL as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                    blockVerticalPath(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(subTileName)-plain-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                    (nodeDL as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(nodeDL)
                    blockURPath(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)UL-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDL as! SKSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n"
                    blockHorizontalPath(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (nodeDL as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    autoCompletedGrassCornerNodes.append(nodeDL)
                    blockDRPath(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(subTileName)_\(dominantTileName)-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (nodeDL as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    blockULPath(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)UL-n" { // HMMMM ???
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDL as! SKSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n"
                    blockHorizontalPath(coordinates: ps)
                    logtile("BUG FIX HMMMM??? JUST EXECUTED!!!")
                }
                else if nodeDL.name == "AG-\(dominantTileName)-\(subTileName)UR-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeDL as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: ps)
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    blockDLPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var leftPoint = grassPlainPrePlaced.position
                    leftPoint.x -= 250
                    let leftNode = self.atPoint(leftPoint)
                    
                    var downPoint = grassPlainPrePlaced.position
                    downPoint.y -= 250
                    let downNode = self.atPoint(downPoint)
                    
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                    (leftNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n"
                    blockURPath(coordinates: leftNode.position)
                    autoCompletedGrassCornerNodes.append(leftNode)
                    
                    logtile("downNode Name: \(downNode.name)")
                    logtile("")
                    
                    if downNode.name == "AG-\(dominantTileName)_\(subTileName)-n" { // "AG-\(subTileName)-\(dominantTileName)DL-n" {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                        (downNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n"
                        blockURPath(coordinates: downNode.position)
                    }
                    else if downNode.name == "AG-\(dominantTileName)-\(subTileName)DL-n" {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                        (downNode as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                        blockVerticalPath(coordinates: downNode.position)
                    }
                    else {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (downNode as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
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
                grassDR.sprite.name = "AG-\(subTileName)-\(dominantTileName)UL-n"
                autoCompletedGrassCornerNodes.append(grassDR.sprite)
                self.addChild(grassDR.sprite)
                self.autoCompleteGrassNodes.append(grassDR.sprite)
                //                }
                
            } else {
                
                let ps = nodeDR.position
                
                if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDR as! SKSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n"
                    blockHorizontalPath(coordinates: ps)
                }
                else if nodeDR.name == "AG-\(subTileName)-plain-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                    (nodeDR as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n"
                    blockULPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (nodeDR as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                    blockVerticalPath(coordinates: ps)
                }
                else if nodeDR.name == "AG-\(subTileName)|\(dominantTileName)-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (nodeDR as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    blockDLPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)_\(dominantTileName)-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (nodeDR as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    blockURPath(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(dominantTileName)-\(subTileName)UL-n" { // new
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeDR as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    unblockAllPaths(coordinates: ps)
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    blockDRPath(coordinates: grassPlainPrePlaced.position)
                    
                    var rightPoint = grassPlainPrePlaced.position
                    rightPoint.x += 250
                    let rightNode = self.atPoint(rightPoint)
                    
                    var downPoint = grassPlainPrePlaced.position
                    downPoint.y -= 250
                    let downNode = self.atPoint(downPoint)
                    
                    (rightNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                    (rightNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n"
                    blockULPath(coordinates: rightNode.position)
                    autoCompletedGrassCornerNodes.append(rightNode)
                    
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    logtile("D123: \(prePlacedNodeFarDown.name)")
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)|\(subTileName)-n" { // might be useless:
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (downNode as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                        blockVerticalPath(coordinates: downNode.position)
                    } else {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                        (downNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n"
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
                grassUp.sprite.name = "AG-\(subTileName)_\(dominantTileName)-n"
                self.addChild(grassUp.sprite)
                self.autoCompleteGrassNodes.append(grassUp.sprite)
            } else {
                logtile(prePlacedNodeUp.name)
                logtile("sdfg")
                if prePlacedNodeUp.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n"
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)-plain-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n"
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)_\(subTileName)-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeUp as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n"
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeUp)
                }
                else if prePlacedNodeUp.name == "AG-\(subTileName)|\(dominantTileName)-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (prePlacedNodeUp as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeUp)
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)_\(subTileName)-n" {
                    (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeUp as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                }
                else if prePlacedNodeUp.name == "AG-\(dominantTileName)-\(subTileName)DL-n" {
                    
                    var farUpPoint = upPoint
                    farUpPoint.y += 250
                    let prePlacedNodeFarUp = self.atPoint(farUpPoint)
                    if prePlacedNodeFarUp.name == "AG-\(dominantTileName)-plain" {
                        (prePlacedNodeUp as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (prePlacedNodeUp as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
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
                grassDown.sprite.name = "AG-\(dominantTileName)_\(subTileName)-n"
                self.addChild(grassDown.sprite)
                self.autoCompleteGrassNodes.append(grassDown.sprite)
                //                }
                
            } else {
                logtile("node: \(prePlacedNodeDown.name)")
                if prePlacedNodeDown.name == "AG-\(subTileName)|\(dominantTileName)-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeDown)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-plain-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n"
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    autoCompletedGrassCornerNodes.append(prePlacedNodeDown)
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)_\(dominantTileName)-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)UL-n" || prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n"
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    logtile("D123: \(prePlacedNodeFarDown.name)")
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)-\(subTileName)DR-n" { // might be useless:
                        (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                    } else {
                        (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                        (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    }
                    
                }
                else if prePlacedNodeDown.name == "AG-\(subTileName)-\(dominantTileName)DR-n" { // new 2
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (prePlacedNodeDown as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UR-n" { // new
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UL-n" { // new 3
                    (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                }
                else if prePlacedNodeDown.name == "AG-\(dominantTileName)-\(subTileName)UL-n" {
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)-plain" {
                        (prePlacedNodeDown as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (prePlacedNodeDown as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
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
                grassLeft.sprite.name = "AG-\(subTileName)|\(dominantTileName)-n"
                self.addChild(grassLeft.sprite)
                self.autoCompleteGrassNodes.append(grassLeft.sprite)
                //                }
                
            } else {
                
                logtile(leftNode.name)
                
                if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UR-n" || leftNode.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                }
                else if leftNode.name == "AG-\(subTileName)-plain-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(subTileName)|\(dominantTileName)-n" {
                    //thisone?
                    //                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    //                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    //                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(dominantTileName)_\(subTileName)-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(subTileName)_\(dominantTileName)-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UL-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)DR-n" {
                    // might break tile engine
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                }
                else if leftNode.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    // grass corner up right needs to be replaced:
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (leftNode as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)UR-n" {
                    // grass corner up right needs to be replaced:
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (leftNode as! SKSpriteNode).name = "AG-\(dominantTileName)-plain-n"
                }
                else if leftNode.name == "AG-\(dominantTileName)-\(subTileName)UR-n" {
                    var farLeftPoint = leftPoint
                    farLeftPoint.x -= 250
                    let farLeftNode = self.atPoint(farLeftPoint)
                    if farLeftNode.name == "AG-\(dominantTileName)-plain" {
                        (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (leftNode as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
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
                grassRight.sprite.name = "AG-\(dominantTileName)|\(subTileName)-n"
                self.addChild(grassRight.sprite)
                self.autoCompleteGrassNodes.append(grassRight.sprite)
                //                }
                
            } else {
                
                logtile(node1.name!)
                logtile("RIGHT")
                
                if  node1.name! == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    logtile((node1 as! SKSpriteNode).name)
                    (node1 as! SKSpriteNode).alpha = 1
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                }
                else if node1.name == "AG-\(subTileName)-plain-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                }
                else if node1.name! == "AG-\(subTileName)_\(dominantTileName)-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name! == "AG-\(subTileName)|\(dominantTileName)-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (node1 as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                }
                else if node1.name == "AG-\(dominantTileName)_\(subTileName)-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name! == "AG-\(subTileName)-\(dominantTileName)UL-n" {
                    //                    (node1 as! SKSpriteNode).alpha = 0.85
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                }
                else if node1.name! == "AG-\(dominantTileName)_\(subTileName)-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    autoCompletedGrassCornerNodes.append(node1)
                }
                else if node1.name! == "AG-\(dominantTileName)-\(subTileName)DL-n" {
                    (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (node1 as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                }
                else if node1.name == "AG-\(dominantTileName)-\(subTileName)UL-n" {
                    var farRightPoint = rightPoint
                    farRightPoint.x += 250
                    let farRightNode = self.atPoint(farRightPoint)
                    
                    if farRightNode.name == "AG-\(dominantTileName)-plain" {
                        (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                        (node1 as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    }
                }
                else if node1.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    var farRightPoint = rightPoint
                    farRightPoint.x += 250
                    let farRightNode = self.atPoint(farRightPoint)
                    
                    if farRightNode.name == "AG-\(dominantTileName)_\(subTileName)-n" {
                        (node1 as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                        (node1 as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
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
                grassLeft.sprite.name = "AG-\(subTileName)-\(dominantTileName)DR-n"
                self.addChild(grassLeft.sprite)
                autoCompletedGrassCornerNodes.append(grassLeft.sprite)
                self.autoCompleteGrassNodes.append(grassLeft.sprite)
            } else {
                if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (nodeUL as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                }
                else if nodeUL.name == "AG-\(subTileName)-plain-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (nodeUL as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n"
                    autoCompletedGrassCornerNodes.append(nodeUL)
                }
                else if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (nodeUL as! SKSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n"
                }
                else if nodeUL.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (nodeUL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (nodeUL as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(nodeUL)
                }
                else if nodeUL.name == "AG-\(subTileName)-\(dominantTileName)UL-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var leftPoint = grassPlainPrePlaced.position
                    leftPoint.x -= 250
                    let leftNode = self.atPoint(leftPoint)
                    
                    var upPoint = grassPlainPrePlaced.position
                    upPoint.y += 250
                    let upNode = self.atPoint(upPoint)
                    
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (leftNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    
                    (upNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DR")
                    (upNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DR-n"
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
                grassLeft.sprite.name = "AG-\(subTileName)-\(dominantTileName)DL-n"
                self.addChild(grassLeft.sprite)
                self.autoCompleteGrassNodes.append(grassLeft.sprite)
                autoCompletedGrassCornerNodes.append(grassLeft.sprite)
                //                }
                
                
            } else {
                if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)UL-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (nodeUR as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                }
                else if nodeUR.name == "AG-\(subTileName)-plain-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (nodeUR as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n"
                }
                else if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)_\(dominantTileName)")
                    (nodeUR as! SKSpriteNode).name = "AG-\(subTileName)_\(dominantTileName)-n"
                }
                else if nodeUR.name == "AG-\(dominantTileName)-\(subTileName)DL-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeUR as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                }
                else if nodeUR.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (nodeUR as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    //                    (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    //                    (nodeUR as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                }
                    //                else if nodeUR.name == "AG-\(subTileName)|\(dominantTileName)-n" {
                    //                    if prePlacedNodeUp.name == "AG-\(dominantTileName)-plain" {
                    //                    } else {
                    //                        (nodeUR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    //                        (nodeUR as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                    //                    }
                    //                }
                else if nodeUR.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var rightPoint = grassPlainPrePlaced.position
                    rightPoint.x += 250
                    let rightNode = self.atPoint(rightPoint)
                    
                    var upPoint = grassPlainPrePlaced.position
                    upPoint.y += 250
                    let upNode = self.atPoint(upPoint)
                    
                    (rightNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (rightNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n"
                    autoCompletedGrassCornerNodes.append(rightNode)
                    
                    (upNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)DL")
                    (upNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)DL-n"
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
                grassUR.sprite.name = "AG-\(subTileName)-\(dominantTileName)UR-n"
                self.addChild(grassUR.sprite)
                self.autoCompleteGrassNodes.append(grassUR.sprite)
                autoCompletedGrassCornerNodes.append(grassUR.sprite)
            } else {
                if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                    (nodeDL as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                }
                else if nodeDL.name == "AG-\(subTileName)-plain-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                    (nodeDL as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(nodeDL)
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)UL-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDL as! SKSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n"
                }
                else if nodeDL.name == "AG-\(dominantTileName)|\(subTileName)-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    (nodeDL as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    autoCompletedGrassCornerNodes.append(nodeDL)
                }
                else if nodeDL.name == "AG-\(subTileName)_\(dominantTileName)-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UL")
                    (nodeDL as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UL-n"
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)UL-n" { // HMMMM ???
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDL as! SKSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n"
                    logtile("BUG FIX HMMMM??? JUST EXECUTED!!!")
                }
                else if nodeDL.name == "AG-\(dominantTileName)-\(subTileName)UR-n" {
                    (nodeDL as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeDL as! SKSpriteNode).name = "AG-\(dominantTileName)-plain-n"
                }
                else if nodeDL.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    autoCompletedGrassCornerNodes.append(grassPlainPrePlaced)
                    
                    var leftPoint = grassPlainPrePlaced.position
                    leftPoint.x -= 250
                    let leftNode = self.atPoint(leftPoint)
                    
                    var downPoint = grassPlainPrePlaced.position
                    downPoint.y -= 250
                    let downNode = self.atPoint(downPoint)
                    
                    (leftNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                    (leftNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(leftNode)
                    
                    logtile("downNode Name: \(downNode.name)")
                    logtile("")
                    
                    if downNode.name == "AG-\(dominantTileName)_\(subTileName)-n" { // "AG-\(subTileName)-\(dominantTileName)DL-n" {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UR")
                        (downNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UR-n"
                    }
                    else if downNode.name == "AG-\(dominantTileName)-\(subTileName)DL-n" {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)|\(dominantTileName)")
                        (downNode as! SKSpriteNode).name = "AG-\(subTileName)|\(dominantTileName)-n"
                    }
                    else {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (downNode as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
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
                grassUL.sprite.name = "AG-\(subTileName)-\(dominantTileName)UL-n"
                
                autoCompletedGrassCornerNodes.append(grassUL.sprite)
                self.addChild(grassUL.sprite)
                self.autoCompleteGrassNodes.append(grassUL.sprite)
                //                }
                
            } else {
                if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)UR-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)_\(subTileName)")
                    (nodeDR as! SKSpriteNode).name = "AG-\(dominantTileName)_\(subTileName)-n"
                }
                else if nodeDR.name == "AG-\(subTileName)-plain-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                    (nodeDR as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)DL-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                    (nodeDR as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                }
                else if nodeDR.name == "AG-\(subTileName)|\(dominantTileName)-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DL")
                    (nodeDR as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)DL-n"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)_\(dominantTileName)-n" {
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)UR")
                    (nodeDR as! SKSpriteNode).name = "AG-\(dominantTileName)-\(subTileName)UR-n"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(dominantTileName)-\(subTileName)UL-n" { // new
                    (nodeDR as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)-plain")
                    (nodeDR as! SKSpriteNode).name = "xxAG-\(dominantTileName)-plain-nxx"
                    autoCompletedGrassCornerNodes.append(nodeDR)
                }
                else if nodeDR.name == "AG-\(subTileName)-\(dominantTileName)DR-n" {
                    grassPlainPrePlaced.texture = SKTexture(imageNamed: "AG-\(dominantTileName)-\(subTileName)DR")
                    grassPlainPrePlaced.name = "AG-\(dominantTileName)-\(subTileName)DR-n"
                    
                    var rightPoint = grassPlainPrePlaced.position
                    rightPoint.x += 250
                    let rightNode = self.atPoint(rightPoint)
                    
                    var downPoint = grassPlainPrePlaced.position
                    downPoint.y -= 250
                    let downNode = self.atPoint(downPoint)
                    
                    (rightNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                    (rightNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n"
                    autoCompletedGrassCornerNodes.append(rightNode)
                    
                    
                    var farDownPoint = downPoint
                    farDownPoint.y -= 250
                    let prePlacedNodeFarDown = self.atPoint(farDownPoint)
                    logtile("D123: \(prePlacedNodeFarDown.name)")
                    if prePlacedNodeFarDown.name == "AG-\(dominantTileName)|\(subTileName)-n" { // might be useless:
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(dominantTileName)|\(subTileName)")
                        (downNode as! SKSpriteNode).name = "AG-\(dominantTileName)|\(subTileName)-n"
                    } else {
                        (downNode as! SKSpriteNode).texture = SKTexture(imageNamed: "AG-\(subTileName)-\(dominantTileName)UL")
                        (downNode as! SKSpriteNode).name = "AG-\(subTileName)-\(dominantTileName)UL-n"
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
