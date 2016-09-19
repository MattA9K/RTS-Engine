//
//  AbstractUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/2/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

class AbstractUnit: UnitFoundation, UnitActions, UnitProperties, UnitDelegate, PathBlocking {
    
    var spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "SearchRadiusDummy")
    var spriteSight = SKSpriteSightNode(imageNamed: "SearchRadiusDummy") //(imageNamed: "RadiusDummyB")
    
    var nameGUI: String
    
    // ACTIONS P
    var HP: Int = 50
    var MANA: Int = 50
    var Armor: Int = 0
    var DMG: Int = 1
    
    var HP_MAX: Int = 0
    var MANA_MAX: Int = 0
    var DMG_MAX: Int = 0
    var Armor_MAX: Int = 0
    
    var previousAttacker: (AbstractUnit?) {
        didSet {
            focusedTargetUnit = previousAttacker
        }
    }
    
    var focusedTargetUnit: (AbstractUnit?) {
        didSet {
            if focusedTargetUnit?.isDead == true {
                focusedTargetUnit = nil
            }
            else if self.isPlayer == true {
                focusedTargetUnit = nil
            }
            else if focusedTargetUnit == self {
                focusedTargetUnit = oldValue
            }
            else if focusedTargetUnit == previousAttacker {
                focusedTargetUnit = previousAttacker
            }
//            else if previousAttacker != nil {
//                focusedTargetUnit = previousAttacker
//            }
        }
    }
    
    
    var positionLogical: CGPoint = CGPointMake(0, 0)
    var isDead = false
    
    // DELEGATE P
    weak var delegate: UnitDelegate?
    var currentActionProgress: CGFloat = 1.0
    
    
    override init() {
        self.nameGUI = "no name!"
//        fatalError("Unit created without ReferenceOfGameScene! [UnitFoundation]")
    }
    
    func alertTheReceivingUnitItIsBeingAttacked(attacker: AbstractUnit) {
        self.focusedTargetUnit = attacker
        self.previousAttacker = attacker
    }
    
    func initMovementBlocker() {
        //        spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "path-blocker")
//        spriteMovementBlocker = SKBlockMovementSpriteNode(imageNamed: "SearchRadiusDummy")
        spriteMovementBlocker.xScale = 1.0
        spriteMovementBlocker.yScale = 1.0
        spriteMovementBlocker.position = sprite.position
        spriteMovementBlocker.zPosition = 20
        spriteMovementBlocker.UnitReference = self
        
        spriteSight.xScale = 13.0
        spriteSight.yScale = 13.0
        spriteSight.position = sprite.position
        spriteSight.zPosition = 20
        spriteSight.UnitReference = self
    }
    func destroyBlockerUponDeath() {
        self.spriteMovementBlocker.removeFromParent()
        self.spriteSight.removeFromParent()
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
        var damageAfterArmor = damage - self.Armor
        if damageAfterArmor <= 0 { HP -= 1 }
        else { HP -= damageAfterArmor }
        if HP <= 0 && isDead == false {
            didLoseAllHitpoints()
//            fromUnit.focusedTargetUnit = nil
        }
        return isDead
    }
    
    // ACTIONS M
    func didTakeDamage(damage: Int, fromUnit: AbstractUnit) {
        fatalError("not implemented")
    }
    
    func didLoseAllHitpoints() {
        self.sprite.removeAllActions()
        self.sprite.playDeathAnimation({_ in
            self.ReferenceOfGameScene.PathsBlocked[String(self.positionLogical)] = false
            self.isDead = true
            self.destroyBlockerUponDeath()
            self.terminateTimers()
        })
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