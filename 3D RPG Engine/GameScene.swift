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
        
        let grass = SKSpriteNode(imageNamed: "grass_Forest")
        grass.position = CGPoint(x:280, y:300)
        grass.zPosition = 0
        grass.xScale = 0.4
        grass.yScale = 0.4
        self.addChild(grass)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            let selectedNode = self.nodeAtPoint(location)
//            debugLabel.text = String(AllUnitsInRAM?.playerSK.sprite.position)
//            debugLabel.fontSize = 14
//            debugLabel.position = CGPoint(x:380, y:750)
//        }
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