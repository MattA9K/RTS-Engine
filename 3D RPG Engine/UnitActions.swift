//
//  AbstractUnitActions.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

protocol UnitActions {
    var isDead: Bool { get set }
    
    var focusedTargetUnit: AbstractUnit? { get set }
    var positionLogical: CGPoint { get set }
    
    func alertTheReceivingUnitItIsBeingAttacked(_ attacker: AbstractUnit)
    
    func didTakeDamage(_ damage: Int, fromUnit: AbstractUnit)
    func unitWillTakeDamageReturnIfUnitDies(_ damage: Int, fromUnit: AbstractUnit) -> Bool
    func terminateTimers()
    func didLoseAllHitpoints()
}
