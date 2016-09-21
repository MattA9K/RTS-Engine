//
//  UIPlayerControlComponents.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/4/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

protocol UIPlayerComponents: class {
    var GameSceneRef: GameScene { get set }
    var panelView: SKSpriteNode { get set }
    
    var attackButton: AttackButton { get set }
    var joyStick: Joystick { get set }
    var focusedUnit: AbstractUnit? { get set }
    
    func activateFromViewController()
    
    func moveByXPositive()
    func moveByXNegative()
    
    func moveByYPositive()
    func moveByYNegative()
    
    func updateGUIFromTimer()
}