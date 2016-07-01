//
//  GameGUI.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit


extension GameScene {
    
    
    func buildGUI() {
        generateAttackButton()
        generateUpButton()
        generateDownButton()
        generateLeftButton()
        generateRightButton()
    }
    
    func generateAttackButton() {
        let sprite = SKSpriteNode(imageNamed:"attack")
        sprite.xScale = 1.0
        sprite.yScale = 1.0
        let position = CGPointMake(650, 150)
        sprite.position = position
        sprite.name = "attack"
        self.addChild(sprite)
    }
    
    func generateUpButton() {
        let sprite = SKSpriteNode(imageNamed:"up-arrow")
        sprite.xScale = 1.0
        sprite.yScale = 1.0
        let position = CGPointMake(440, 140)
        sprite.position = position
        sprite.name = "up-arrow"
        self.addChild(sprite)
    }
    
    func generateLeftButton() {
        let sprite = SKSpriteNode(imageNamed:"left-arrow")
        sprite.xScale = 1.0
        sprite.yScale = 1.0
        let position = CGPointMake(337, 44)
        sprite.position = position
        sprite.name = "left-arrow"
        self.addChild(sprite)
    }
    
    func generateRightButton() {
        let sprite = SKSpriteNode(imageNamed:"right-arrow")
        sprite.xScale = 1.0
        sprite.yScale = 1.0
        let position = CGPointMake(522, 44)
        sprite.position = position
        sprite.name = "right-arrow"
        self.addChild(sprite)
    }
    
    func generateDownButton() {
        let sprite = SKSpriteNode(imageNamed:"down-arrow")
        sprite.xScale = 1.0
        sprite.yScale = 1.0
        let position = CGPointMake(440, 44)
        sprite.position = position
        sprite.name = "down-arrow"
        self.addChild(sprite)
    }
}
