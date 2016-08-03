//
//  AbstractUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

class AbstractUnit: UnitFoundation, UnitActions, UnitDelegate {
    
    // ACTIONS P
    var HP: Int = 50
    var MANA: Int = 50
    var focusedTargetUnit: AbstractUnit?
    var positionLogical: CGPoint = CGPointMake(0, 0)
    var isDead = false
    
    // DELEGATE P
    weak var delegate: UnitDelegate?
    var currentActionProgress: CGFloat = 1.0
    
    
    override init() {
//        fatalError("Unit created without ReferenceOfGameScene! [UnitFoundation]")
    }
    
    func alertTheReceivingUnitItIsBeingAttacked(attacker: AbstractUnit) {
        self.focusedTargetUnit = attacker
    }
    
    // ACTIONS M
    func didTakeDamage(damage: Int, fromUnit: AbstractUnit) {
        fatalError("not implemented")
    }
    func didLoseAllHitpoints() {
        fatalError("not implemented")
    }
    
    // DELEGATE M
    func actionDidBegin() {
        self.currentActionProgress = 0.0
        print("unit is executing a new order...")
        processAction()
    }
    func processAction() {
        if self.currentActionProgress < 1.0 {
            print(".", terminator: "")
            self.currentActionProgress += 0.2
            NSThread.sleepForTimeInterval(0.3)
            processAction()
        } else {
            actionDidFinish()
        }
    }
    func actionDidFinish() {
        print("")
        print("Unit finished, awaiting new orders.")
    }
}