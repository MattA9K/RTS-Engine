//
//  RangedTargetFinder.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class RangedTargetFinderNEW {
    
    /*
     MELEE UNIT's X AND Y POSITION DETERMINE WHICH ANGLE TO FACE WHEN ATTACKING
     
     x: 150|x: 100|x:  50|x:   0|x: -50|x:-100|x:-150|
     y:-150|y:-150|y:-150|y:-150|y:-150|y:-150|y:-150|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|x:   0|y: -50|x:-100|x:-150|
     y:-100|y:-100|y:-100|y:-100|y:-100|y:-100|y:-100|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|x:   0|x: -50|x:-100|x:-150|
     y: -50|y: -50|y: -50|y: -50|y: -50|y: -50|y: -50|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|      |x: -50|x:-100|x:-150|
     y:   0|y:   0|y:   0|      |y:   0|y:   0|y:   0|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|x:   0|x: -50|x:-100|x:-150|
     y:  50|x:  50|y:  50|y:  50|y:  50|y:  50|y:  50|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|x:   0|x: -50|x:-100|x:-150|
     y: 100|y: 100|y: 100|y: 100|y: 100|y: 100|y: 100|
     ------|------|------|------|------|------|------|
     x: 150|x: 100|x:  50|x:   0|x: -50|x:-100|x:-150|
     y: 150|y: 150|y: 150|y: 150|y: 150|y: 150|y: 150|
     
     */
    
    
    func faceTargetAndAttack(_ attacker: RangedUnitNEW, X: CGFloat, Y: CGFloat) -> Bool {
        
        printgs("Ranged Unit is trying to attack.")
        printgs("X:\(X) , Y:\(Y)")
        
        
        if X > 0 && Y < 0 {
            // UP LEFT
            attacker.OrderUnitToAttackRangedUPLEFT(CGPoint(x: X, y: Y))
            return true
        }
        else if X == 0 && Y < 0 {
            // UP
            attacker.OrderUnitToAttackRangedUP(CGPoint(x: X, y: Y))
            return true
        }
        else if X < 0 && Y < 0 {
            // UP RIGHT
            //            attacker.OrderUnitToAttackRangedUPRIGHT(CGPointMake(X, Y))
            attacker.OrderUnitToAttackRangedUPRIGHT(CGPoint(x: X, y: Y))
            return true
        }
        else if X < 0 && Y == 0 {
            // LEFT
            attacker.OrderUnitToAttackRangedRIGHT(CGPoint(x: X, y: Y))
            return true
        }
        else if X > 0 && Y == 0 {
            // RIGHT
            attacker.OrderUnitToAttackRangedLEFT(CGPoint(x: X, y: Y))
            return true
        }
        else if X > 0 && Y > 0 {
            // DOWN LEFT
            //            attacker.OrderUnitToAttackRangedDOWNLEFT(CGPointMake(X, Y))
            attacker.OrderUnitToAttackRangedDOWNLEFT(CGPoint(x: X, y: Y))
            return true
        }
        else if X == 0 && Y > 0 {
            // DOWN
            attacker.OrderUnitToAttackRangedDOWN(CGPoint(x: X, y: Y))
            return true
        }
        else if X < 0 && Y > 0 {
            // DOWN RIGHT
            attacker.OrderUnitToAttackRangedDOWNRIGHT(CGPoint(x: X, y: Y))
            return true
        }
        
        return false
    }
    
}
