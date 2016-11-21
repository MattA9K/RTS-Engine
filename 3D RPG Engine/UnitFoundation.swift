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
    
    open var sprite: SKAbstractSprite = SKAbstractSprite(imageNamed: "player-test")
    var angleFacing: UnitFaceAngle = UnitFaceAngle.down
    var ReferenceOfGameScene: GameScene = GameScene()
    var teamNumber: Int = 0
    var isPlayer: Bool = false
    var uuid : UUID = UUID()
    var isAutonomous: Bool = false
    
    override init() {
        
        sprite.isUserInteractionEnabled = true
//        fatalError("Unit created without ReferenceOfGameScene! [UnitFoundation]")
    }
}

protocol UnitBaseFunctionality {
    var sprite: SKAbstractSprite { get set }
    var teamNumber: Int { get set }
    var angleFacing: UnitFaceAngle { get set }
    var ReferenceOfGameScene: GameScene { get set }
    var isPlayer: Bool { get set }
    var uuid : UUID { get }
    var isAutonomous : Bool { get set }
}

