//
//  HeroFootmanUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/18/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class HeroFootmanUnit: FootmanUnit {
    
    override init(player: Int) {
        super.init(player: player)
//        teamNumber = player // OVERRIDE PLAYER NUMBER HERE
        nameGUI = "Rullo"
        HP = 320
        Armor = 3
        DMG = 25
    }
    
    override func CastUnitClass() {
        let CastClassUnit = SKFootmanSprite(imageNamed: "footmanLvl1_down_stand")
        CastClassUnit.unitIdentifier = "Hero"
        CastClassUnit.loadTextures()
        CastClassUnit.xScale = 0.25
        CastClassUnit.yScale = 0.25
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
//        sprite.color = UIColor.cyanColor()
        sprite.alpha = 2.0
        
        let delayAction = SKAction.waitForDuration(0.32)
        let action1 = SKAction.colorizeWithColor(UIColor.yellowColor(), colorBlendFactor: 0.8, duration: 0.1)
        let action2 = SKAction.colorizeWithColor(UIColor.cyanColor(), colorBlendFactor: 0.8, duration: 0.1)
        sprite.runAction(delayAction, completion: {
            
            self.sprite.runAction(action1)
            
            self.sprite.runAction(delayAction, completion: {

                self.sprite.runAction(action2)
            })
        })
        
    }


}