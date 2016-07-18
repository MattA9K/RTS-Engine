//
//  GameScene.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    
    var debugLabel = SKLabelNode(fontNamed:"HoeflierText")
    var debugLabelCamera = SKLabelNode(fontNamed:"HoeflierText")
    
    var ControlPanel: UserInputControlsPanel?
    var AllUnitsInRAM: GameSceneUnitsInRAM?
    
    let SightCategory   : UInt32 = 0x1 << 0
    
    let Player_1_Sprite_Category   : UInt32 = 0x1 << 1
    let Player_1_Sight_Category   : UInt32 = 0x1 << 2
    
    let Player_2_Sprite_Category   : UInt32 = 0x1 << 3
    let Player_2_Sight_Category   : UInt32 = 0x1 << 4
    
    // HEROES
    var playerSK: BaseUnit!
    let playerSpriteID = "sprite_player"
    
    // NON-HEROES
    var enemies = [BaseUnit]()
    //    var allEnemyIDs: [String:BaseUnit] = [:]
    
    var tilesets = [SKGroundTileGeneric]()
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        
        
//        AllUnitsInRAM = GameSceneUnitsInRAM(gameScene: self)
        generateUnitsFromMap()
        physicsWorld.contactDelegate = self
        
        for unit in enemies {
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
        }
        
        self.addChild(debugLabel)
        debugLabel.text = ""
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */

        
        for touch in touches {
            let location = touch.locationInNode(self)
            let selectedNode = self.nodeAtPoint(location)
            
            selectedNode.hidden = true
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
                NSThread.sleepForTimeInterval(0.4);
                dispatch_async(dispatch_get_main_queue()) {
                    selectedNode.hidden = false
                    self.playerSK.issueOrderTargetingPoint(location, unitOrder: .Move)
                }
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func updateDebugLabel(text: String) {
        debugLabel.text = text
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
        
//        if ((sightBody.categoryBitMask == Player_1_Sight_Category) && (unitBody.categoryBitMask == Player_2_Sprite_Category)) {
//            ControlPanel?.printToConsole("Player 1 spotted player 2")
//            
//            ControlPanel?.printToConsole("")
//            ControlPanel?.printToConsole("sightBody,")
//            ControlPanel?.printToConsole(String(sightBody.node!.name!))
//            
//            ControlPanel?.printToConsole("")
//            ControlPanel?.printToConsole("unitBody,")
//            ControlPanel?.printToConsole(String(unitBody.node!.name!))
//            
//            ControlPanel?.printToConsole("")
//            ControlPanel?.printToConsole("")
//        }
//        if ((sightBody.categoryBitMask == Player_2_Sight_Category) && (unitBody.categoryBitMask == Player_1_Sprite_Category)) {
//            ControlPanel?.printToConsole("Player 2 spotted player 1")
//            
//            ControlPanel?.printToConsole("")
//            ControlPanel?.printToConsole("sightBody,")
//            ControlPanel?.printToConsole(String(sightBody.node!.name!))
//            
//            ControlPanel?.printToConsole("")
//            ControlPanel?.printToConsole("unitBody,")
//            ControlPanel?.printToConsole(String(unitBody.node!.name!))
//            
//            ControlPanel?.printToConsole("")
//            ControlPanel?.printToConsole("")
//        }
//        if ((sightBody.categoryBitMask == Player_1_Sight_Category) && (unitBody.categoryBitMask == PlayerCategory[0]!) ||
//            (sightBody.categoryBitMask == PlayerCategory[0]!) && (unitBody.categoryBitMask == Player_1_Sight_Category) ) {
////            ControlPanel?.printToConsole("Unit is within sight.")
//            if sightBody.node is SKAbstractSprite {
//                if let name = (sightBody.node as! SKAbstractSprite).name {
//                    ControlPanel?.printToConsole("Unit Name: " + name)
//                }
//            } else if sightBody.node is SKUnitSight {
//                if let name = (sightBody.node as! SKUnitSight).name {
//                    ControlPanel?.printToConsole("Unit Name: " + name)
//                }
//            }
//        }
        
        
        
        
        /*
        var sightBody: SKPhysicsBody = contact.bodyA
        var unitBody: SKPhysicsBody = contact.bodyB
        
        if ((sightBody.categoryBitMask == UnitCategory) && (unitBody.categoryBitMask == SightCategory)) {
            ControlPanel?.printToConsole("Unit is within sight.")
            if sightBody is SKAbstractSprite {
                if let name = (sightBody as! SKAbstractSprite).name {
                    ControlPanel?.printToConsole("Unit Name: " + name)
                }
            }
        }
        
        if let name = sightBody.node?.name {
            ControlPanel?.printToConsole("first: " + name)
            if sightBody.node is SKUnitSight {
                if let unit = (sightBody.node as! SKUnitSight).UnitReference🔶 {
                    
                    ControlPanel?.printToConsole("first2: " + unit.sprite.name!)
                    ControlPanel?.printToConsole(String((unitBody.node as! SKAbstractSprite).UnitReference🔶!.teamNumber))
                    
                    if (unitBody.node as! SKAbstractSprite).UnitReference🔶!.teamNumber != unit.teamNumber {
                        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
                            NSThread.sleepForTimeInterval(0.4);
                            dispatch_async(dispatch_get_main_queue()) {
                                if unit.isPlayer == false {
                                    unit.issueOrderTargetingUnit((unitBody.node as! SKAbstractSprite).UnitReference🔶!, unitOrder: .AttackMove)
                                }
                            }
                        }
                        
                    }
                }
            }
            
        }
        if let name = unitBody.node?.name {
            ControlPanel?.printToConsole("second: " + name)
        }
        
//        unitBody.node?.runAction(SKAction.colorizeWithColor(UIColor.redColor(), colorBlendFactor: 1.5, duration: 0.4))
//        sightBody.node?.runAction(SKAction.colorizeWithColor(UIColor.purpleColor(), colorBlendFactor: 1.5, duration: 0.4))
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            NSThread.sleepForTimeInterval(0.4);
            dispatch_async(dispatch_get_main_queue()) {
//                sightBody.node?.runAction(SKAction.colorizeWithColor(UIColor.greenColor(), colorBlendFactor: 1.5, duration: 0.4))
//                unitBody.node?.runAction(SKAction.colorizeWithColor(UIColor.blueColor(), colorBlendFactor: 1.5, duration: 0.4))
            }
        }
 */
    }
    
    
    
    func generateUnitsFromMap() {
        let map = GameMap()
        map.generateGameSceneBasedFromMap()
        map.generateGameTilesetSceneBasedFromMap()
        
        print("UNITS IN MAP: ")
        print(map.UnitsInMap)
        
        var unitI = 0
        for unit in map.UnitsInMap {
            if unit is BaseUnit {
                
                let mirror = Mirror(reflecting: unit)
                let classname:String = mirror.description
                unit.sprite.UnitReference🔶 = unit
                unit.sprite.name = classname + " " + "Plyr:" + String(unit.teamNumber) + "_" + String(unitI)
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
            self.addChild(tile)
        }
    }
    func ThisUnitTookDamage(unit: SKBlockMovementSpriteNode) {
        unit.UnitReference🔶.unitDidTakeDamage(1)
    }

}

public func logg(line: Any) {
    print(line)
}