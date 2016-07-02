//
//  GameScene.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    
    var debugLabel = SKLabelNode(fontNamed:"Arial")
    var debugLabelCamera = SKLabelNode(fontNamed:"Arial")
    
    var ControlPanel: UserInputControlsPanel?
    var AllUnitsInRAM: GameSceneUnitsInRAM?
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        
        AllUnitsInRAM = GameSceneUnitsInRAM(gameScene: self)
        
        self.addChild(debugLabel)

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
        debugLabel.fontSize = 14
        debugLabel.position = CGPoint(x:380, y:150)
    }
    
    

}

public func logg(line: Any) {
    print(line)
}