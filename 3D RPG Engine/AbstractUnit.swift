//
//  AbstractUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

class AbstractUnit: UnitFoundation, UnitActions, UnitDelegate, PathBlocking {
    
    var spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "SearchRadiusDummy")
    
    
    // ACTIONS P
    var HP: Int = 50
    var MANA: Int = 50
    
    
    var focusedTargetUnit: (AbstractUnit?) {
        didSet {
            if focusedTargetUnit?.isDead == true { focusedTargetUnit = nil }
            else if focusedTargetUnit?.sprite.name == self.sprite.name { focusedTargetUnit = nil }
        }
    }
    
    
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
    
    func initMovementBlocker() {
        //        spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "path-blocker")
//        spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "SearchRadiusDummy")
        spriteMovementBlocker.xScale = 1.0
        spriteMovementBlocker.yScale = 1.0
        spriteMovementBlocker.position = sprite.position
        spriteMovementBlocker.zPosition = 20
        spriteMovementBlocker.UnitReference = self
    }
    func destroyBlockerUponDeath() {
        self.spriteMovementBlocker.removeFromParent()
    }
    
    func unitWillTakeDamageReturnIfUnitDies(damage: Int, fromUnit: AbstractUnit) -> Bool {
        let randomNumber = arc4random()
        var selectedNumber = 1
        if randomNumber > 3000492058 {
            selectedNumber = 1
        }
        else if randomNumber > 1000492058 {
            selectedNumber = 2
        } else {
            selectedNumber = 3
        }
        ReferenceOfGameScene.runAction(SKAction.playSoundFileNamed("Sword\(selectedNumber).wav", waitForCompletion: true))
        
        HP -= damage
        if HP <= 0 && isDead == false {
            didLoseAllHitpoints()
            fromUnit.focusedTargetUnit = nil
        }
        return isDead
    }
    // ACTIONS M
    func didTakeDamage(damage: Int, fromUnit: AbstractUnit) {
        fatalError("not implemented")
    }
    func didLoseAllHitpoints() {
        self.isDead = true
        self.sprite.playDeathAnimation()
        self.destroyBlockerUponDeath()
        terminateTimers()
    }
    func terminateTimers() {
        if self is MeleeUnitNEW {
            (self as! MeleeUnitNEW).sightTimer?.invalidate()
            (self as! MeleeUnitNEW).attackTimer?.invalidate()
        } else if self is RangedUnitNEW {
            (self as! RangedUnitNEW).sightTimer?.invalidate()
            (self as! RangedUnitNEW).attackTimer?.invalidate()
        }

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