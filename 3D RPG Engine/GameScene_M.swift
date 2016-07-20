//
//  GameScene_M.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/19/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene {
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
//        for unit in enemies {
            //            unit.sight.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(250, 250))
            //            unit.sight.physicsBody!.categoryBitMask = PlayerCategory[0]!
            //            unit.sight.physicsBody!.contactTestBitMask = PlayerCategory[unit.teamNumber!]!
            //            unit.sight.name = "SIGHT"
            //            unit.sight.physicsBody!.affectedByGravity = false
            //            unit.sight.physicsBody?.dynamic = false
            //            unit.sight.physicsBody!.collisionBitMask = 0
            
            
            //            if let sight = unit.sight {
            //                unit.sight.UnitReference🔶 = unit
            //            }
            //            func setPlayer1() {
            //                unit.sight.physicsBody!.categoryBitMask = Player_1_Sight_Category
            //                unit.sight.physicsBody!.contactTestBitMask = Player_2_Sprite_Category
            //
            //                unit.sprite.physicsBody!.categoryBitMask = Player_1_Sprite_Category
            //                unit.sprite.physicsBody!.contactTestBitMask = Player_2_Sight_Category
            //            }
            //            func setPlayer2() {
            //                unit.sight.physicsBody!.categoryBitMask = Player_2_Sight_Category
            //                unit.sight.physicsBody!.contactTestBitMask = Player_1_Sprite_Category
            //
            //                unit.sprite.physicsBody!.categoryBitMask = Player_2_Sprite_Category
            //                unit.sprite.physicsBody!.contactTestBitMask = Player_1_Sight_Category
            //            }
            //            func setPlayer0() {
            //            }
            
            //            unit.sprite.physicsBody = SKPhysicsBody(rectangleOfSize: unit.sprite.size)
            //            unit.sprite.physicsBody?.dynamic = false
            //            unit.sprite.physicsBody!.affectedByGravity = false
            
            //            switch unit.teamNumber! {
            //            case 1:
            //                setPlayer1()
            //            case 2:
            //                setPlayer2()
            //            default:
            //                setPlayer0()
            //            }
//        }
        
        var PlayerMovement = NSTimer.scheduledTimerWithTimeInterval(0.55, target: self, selector: Selector("orderPlayerToMove"), userInfo: nil, repeats: true)
    }
    
    func orderPlayerToMove() {
        self.playerSK.issueOrderTargetingPoint(playerTarget!.position, unitOrder: .AttackMove)
        debugLabel.position = playerSK.sprite.position
        debugLabel.text = String(playerSK.sprite.position)
        debugLabel.zPosition = 100
        debugLabel.fontSize = 19
    }
    
    func initPlayerTarget() {
        playerTarget = SKPlayerTarget(imageNamed: "player-test")
        playerTarget!.xScale = GameSettings.SpriteScale.Default
        playerTarget!.yScale = GameSettings.SpriteScale.Default
        playerTarget!.zPosition = SpritePositionZ.AliveUnit.Z
        playerTarget!.position = playerSK.sprite.position
        addChild(playerTarget!)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        playerTarget?.removeFromParent()
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let selectedNode = self.nodeAtPoint(location)
            
            playerTarget?.position = location
            addChild(playerTarget!)
            

            if selectedNode is SKAbstractSprite {
                self.playerSK.issueOrderTargetingUnit((selectedNode as! SKAbstractSprite).UnitReference🔶!)
            } else {
//                selectedNode.hidden = true
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
                    NSThread.sleepForTimeInterval(0.4);
                    dispatch_async(dispatch_get_main_queue()) {
//                        selectedNode.hidden = false
                        self.playerSK.issueOrderTargetingPoint(location, unitOrder: .Move)
                    }
                }
            }
            
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func updateDebugLabel(text: String) {
        debugLabel.text = text
        debugLabel.zPosition = 100
        debugLabel.fontSize = 19
        debugLabel.position = CGPoint(x:280, y:600)
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let contactBodyA: SKPhysicsBody = contact.bodyA
        let contactBodyB: SKPhysicsBody = contact.bodyB
        
        ControlPanel?.printToConsole(" \n")
        ControlPanel?.printToConsole("⎶⎶⎶⎶⎶⎶⎶⎶⎶⎶⎶⎶⎶⎶")
        ControlPanel?.printToConsole("Some contact occured.")
        //        ControlPanel?.printToConsole(String(Int(sightBody.categoryBitMask)))
        
        ControlPanel?.printToConsole("Player 2 spotted player 1")
        
        ControlPanel?.printToConsole("")
        ControlPanel?.printToConsole("contactBodyA,")
        ControlPanel?.printToConsole(String(contactBodyA.node!.name!))
        ControlPanel?.printToConsole("")
        ControlPanel?.printToConsole("contactBodyB,")
        ControlPanel?.printToConsole(String(contactBodyB.node!.name!))
        ControlPanel?.printToConsole("")
        ControlPanel?.printToConsole("")
    }
    
    
    
    func generateUnitsFromMap(mapName: String) {
        let map = GameMap()
        map.generateGameSceneBasedFromMap(mapName)
        map.generateGameTilesetSceneBasedFromMap(mapName)
        
        print("UNITS IN MAP: ")
        print(map.UnitsInMap)
        
        var unitI = 0
        for unit in map.UnitsInMap {
            if unit is BaseUnit {
                
                let mirror = Mirror(reflecting: unit)
                let classname = String(mirror.subjectType)
                unit.sprite.UnitReference🔶 = unit
                unit.sprite.name = classname + "|" + "Plyr:" + String(unit.teamNumber!) + "|" + String(unitI)
                unit.ReferenceOfGameScene🔶 = self
                self.addChild(unit.sprite)
                self.addChild(unit.spriteMovementBlocker)
                if let sight = unit.sight {
                    sight.position = unit.sprite.position
                    self.addChild(sight)
                }
                unit.updateMovementBlockerPosition()
                enemies.append(unit)
                //                allEnemyIDs[unit.sprite.name!] = unit
                unit.spriteMovementBlocker.UnitReference🔶 = unit
                
                if (unit as! BaseUnit).isPlayer == true {
                    playerSK = unit
                }
                unitI += 1
            } else if unit is BaseStructure {
                self.addChild(unit.sprite)
            }
            
        }
        
        for tile in map.TilesInMap {
            print(tile)
            self.addChild(tile)
        }
        
        initPlayerTarget()
        self.addChild(debugLabel)
    }
    func ThisUnitTookDamage(unit: SKBlockMovementSpriteNode) {
        unit.UnitReference🔶.unitDidTakeDamage(1)
    }
}