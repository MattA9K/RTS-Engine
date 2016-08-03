//
//  PathBlocking.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/3/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


protocol PathBlocking {
    var spriteMovementBlocker: SKBlockMovementSpriteNode { get set }
    
    func initMovementBlocker()
    func destroyBlockerUponDeath()
}