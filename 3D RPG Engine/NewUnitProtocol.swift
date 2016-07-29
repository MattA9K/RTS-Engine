//
//  NewUnitProtocol.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/29/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


protocol NewUnitProtocol {
    
    func playAnimation_DidTakeDamage()
    
    func MoveOneStepUP() -> Bool
    func MoveOneStepDOWN() -> Bool
    func MoveOneStepLEFT() -> Bool
    func MoveOneStepRIGHT() -> Bool
    
    func FireAttack()
    
    func issueOrderTargetingUnit(unit: BaseUnit)
    func issueOrderTargetingPoint(point: CGPoint)
    
    
}

/*
Current Unit Lifecycle:
 
 
 
 

*/