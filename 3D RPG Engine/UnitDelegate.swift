//
//  AbstractUnitDelegate.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


protocol UnitDelegate: class {
    weak var delegate: UnitDelegate? { get set }
    var currentActionProgress: CGFloat { get set }
    
    func actionDidBegin()
    func processAction()
    func actionDidFinish()
}