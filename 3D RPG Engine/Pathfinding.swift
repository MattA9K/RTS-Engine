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
    
    func OrderUnitToMoveOneStepUP(_ completionHandler: @escaping (CGPoint?) -> ()) -> ()
    func OrderUnitToMoveOneStepDOWN(_ completionHandler: @escaping (CGPoint?) -> ()) -> ()
    func OrderUnitToMoveOneStepLEFT(_ completionHandler: @escaping (CGPoint?) -> ()) -> ()
    func OrderUnitToMoveOneStepRIGHT(_ completionHandler: @escaping (CGPoint?) -> ()) -> ()
    
    func OrderUnitToMoveOneStepUL(_ completionHandler: @escaping (CGPoint?) -> ()) -> ()
    func OrderUnitToMoveOneStepUR(_ completionHandler: @escaping (CGPoint?) -> ()) -> ()
    func OrderUnitToMoveOneStepDL(_ completionHandler: @escaping (CGPoint?) -> ()) -> ()
    func OrderUnitToMoveOneStepDR(_ completionHandler: @escaping (CGPoint?) -> ()) -> ()
    
    
    func OrderUnitToMoveOneStep(direction: UnitFaceAngle, completionHandler: @escaping (CGPoint?) -> ()) -> () 

    func issueOrderTargetingPoint(_ target: CGPoint, completionHandler: @escaping (CGPoint?) -> ()) -> ()
    func issueOrderTargetingUnit(_ unit: UnitFoundation)
    
    func thereIsAnObstacleInTheWay(_ destination: CGPoint, completionHandler: (Bool?) -> ()) -> ()
}
