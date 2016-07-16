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
    let UnitCategory   : UInt32 = 0x1 << 1
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        
        AllUnitsInRAM = GameSceneUnitsInRAM(gameScene: self)
        AllUnitsInRAM!.generateUnitsFromMap()
        physicsWorld.contactDelegate = self
        
        for unit in AllUnitsInRAM!.enemies {
            unit.sight.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(250, 250))
            unit.sight.physicsBody!.categoryBitMask = SightCategory
            unit.sight.physicsBody!.contactTestBitMask = UnitCategory
            unit.sight.name = "SIGHT"
            unit.sight.physicsBody!.affectedByGravity = false
            unit.sight.physicsBody?.dynamic = true
            unit.sight.physicsBody!.collisionBitMask = 0
            
            if let sight = unit.sight {
                unit.sight.UnitReference🔶 = unit
            }
            
            unit.sprite.physicsBody = SKPhysicsBody(rectangleOfSize: unit.sprite.size)
            unit.sprite.physicsBody?.dynamic = false
            unit.sprite.physicsBody!.affectedByGravity = false
            unit.sprite.physicsBody!.categoryBitMask = UnitCategory
            unit.sprite.physicsBody!.contactTestBitMask = SightCategory
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
                    self.AllUnitsInRAM?.playerSK.issueOrderTargetingPoint(location, unitOrder: .Move)
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
                    ControlPanel?.printToConsole(String(unit.teamNumber))
                    
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
        
    }
    
    
    

}

public func logg(line: Any) {
    print(line)
}