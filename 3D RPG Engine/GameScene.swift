//
//  GameScene.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    
    var debugLabel = SKLabelNode(fontNamed:"HoeflierText")
    var debugLabelCamera = SKLabelNode(fontNamed:"HoeflierText")
    
    var ControlPanel: UserInputControlsPanel?
    var AllUnitsInRAM: GameSceneUnitsInRAM?
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        
        AllUnitsInRAM = GameSceneUnitsInRAM(gameScene: self)
        
        self.addChild(debugLabel)
        debugLabel.text = ""
        
        
        
//        let sprite = SKSpriteNode(imageNamed: "grass_Forest")
//        sprite.position = CGPoint(x:280, y:600)
//        sprite.zPosition = 5
//        sprite.xScale = 1.4
//        sprite.yScale = 1.4
//        addChild(sprite)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let selectedNode = self.nodeAtPoint(location)
            
            selectedNode.hidden = true
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
                NSThread.sleepForTimeInterval(0.7);
                dispatch_async(dispatch_get_main_queue()) {
                    selectedNode.hidden = false
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
    
    

}

public func logg(line: Any) {
    print(line)
}