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
    
    var isMoving: Bool { get set}
    
    func OrderUnitToMoveOneStepUP(completionHandler: (CGPoint?) -> ())
    func OrderUnitToMoveOneStepDOWN(completionHandler: (CGPoint?) -> ())
    func OrderUnitToMoveOneStepLEFT(completionHandler: (CGPoint?) -> ())
    func OrderUnitToMoveOneStepRIGHT(completionHandler: (CGPoint?) -> ())
    
    func OrderUnitToMoveOneStepUL(completionHandler: (CGPoint?) -> ())
    func OrderUnitToMoveOneStepUR(completionHandler: (CGPoint?) -> ())
    func OrderUnitToMoveOneStepDL(completionHandler: (CGPoint?) -> ())
    func OrderUnitToMoveOneStepDR(completionHandler: (CGPoint?) -> ())

    
    func issueOrderTargetingPoint(target: CGPoint, completionHandler: (CGPoint?) -> ())
    func issueOrderTargetingUnit(unit: UnitFoundation)
    
    func thereIsAnObstacleInTheWay(destination: CGPoint, completionHandler: (Bool?) -> ())
}