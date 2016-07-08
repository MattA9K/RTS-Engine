//
//  MeleeUnitProtocol.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


protocol UnitProtocol {
    
    func OrderUnitToMoveOneStepUP() -> Bool
    func OrderUnitToMoveOneStepDOWN() -> Bool
    func OrderUnitToMoveOneStepLEFT() -> Bool
    func OrderUnitToMoveOneStepRIGHT() -> Bool
    func animateUnitToLookDamaged()
    
}
