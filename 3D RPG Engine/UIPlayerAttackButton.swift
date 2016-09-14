//
//  UIPlayerAttackButton.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/4/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class AttackButton: SKSpriteNode {
    
    var superClass: UIPlayerControlPanel?
    var nameCustom = ""
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if nameCustom == "attack" {
            self.superClass!.orderPlayerToAttack()
            
            let nonPressedButton = SKTexture(imageNamed: "btn-attack-idle")
            let pressedButton = SKTexture(imageNamed: "btn-attack-pressed")
            
            self.runAction(SKAction.animateWithTextures([pressedButton], timePerFrame: 0.2), completion: {
                self.runAction(SKAction.animateWithTextures([nonPressedButton], timePerFrame: 0.2))
            })
        } else {
            
            let nonPressedButton = SKTexture(imageNamed: "btn-wood-idle")
            let pressedButton = SKTexture(imageNamed: "btn-wood-pressed")
            
            self.runAction(SKAction.animateWithTextures([pressedButton], timePerFrame: 0.2), completion: {
                self.runAction(SKAction.animateWithTextures([nonPressedButton], timePerFrame: 0.2))
            })
            
            self.superClass!.orderPlayerToRalleyForces()
        }
    }
    
    func makeInteractable(superClass: UIPlayerControlPanel) {
        self.userInteractionEnabled = true
        self.superClass = superClass
    }
}
