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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.superClass!.orderPlayerToAttack()
    }
    
    func makeInteractable(superClass: UIPlayerControlPanel) {
        self.userInteractionEnabled = true
        self.superClass = superClass
    }
}