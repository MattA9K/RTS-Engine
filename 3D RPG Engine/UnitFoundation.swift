//
//  UnitFoundation.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit
// Ultra generic unit.
// the super class of ALL units.


class UnitFoundation: NSObject, UnitBaseFunctionality {
    
    public var sprite: SKAbstractSprite = SKAbstractSprite(imageNamed: "player-test")
    var angleFacing: UnitFaceAngle = UnitFaceAngle.Down
    var ReferenceOfGameScene: GameScene = GameScene()
    var teamNumber: Int = 0
    var isPlayer: Bool = false

    
    
    override init() {
        
        sprite.userInteractionEnabled = true
//        fatalError("Unit created without ReferenceOfGameScene! [UnitFoundation]")
    }
}

protocol UnitBaseFunctionality {
    var sprite: SKAbstractSprite { get set }
    var teamNumber: Int { get set }
    var angleFacing: UnitFaceAngle { get set }
    var ReferenceOfGameScene: GameScene { get set }
    var isPlayer: Bool { get set }
}

class SKAbstractSpriteNEW: SKMapSprite {
    var UnitReference: UnitFoundation?
}