//
//  Pathfinding.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


protocol Pathfinding {
    func OrderUnitToMoveOneStepUP() -> Bool
    func OrderUnitToMoveOneStepDOWN() -> Bool
    func OrderUnitToMoveOneStepLEFT() -> Bool
    func OrderUnitToMoveOneStepRIGHT() -> Bool
    
    func OrderUnitToMoveOneStepUL() -> Bool
    func OrderUnitToMoveOneStepUR() -> Bool
    func OrderUnitToMoveOneStepDL() -> Bool
    func OrderUnitToMoveOneStepDR() -> Bool

    
    func issueOrderTargetingPoint(target: CGPoint)
    func issueOrderTargetingUnit(unit: UnitFoundation)
    
    func thereIsAnObstacleInTheWay(destination: CGPoint) -> Bool
}