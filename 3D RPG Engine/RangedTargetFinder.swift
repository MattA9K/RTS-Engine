//
//  RangedTargetFinder.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class RangedTargetFinder {
    
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
    
    
    func faceTargetAndAttack(attacker: RangedUnit, X: CGFloat, Y: CGFloat, targetLocation: CGPoint) {
        
        var finalX: CGFloat = 0
        var finalY: CGFloat = 0
        
        if X > 0 {
            finalX = 50
        } else if X == 0 {
            finalX = 0
        } else {
            finalX = -50
        }
        
        if Y > 0 {
            finalY = 50
        } else if Y == 0 {
            finalY = 0
        } else {
            finalY = -50
        }
        
        
        
        if finalX == -50 && finalY == 50 {
            attacker.OrderUnitToAttackRangedDOWNRIGHT_(targetLocation)
//            ()
        } else if finalX == -50 && finalY == 0 {
            // FACE RIGHT
            attacker.OrderUnitToAttackRangedRIGHT_(targetLocation)
        } else if finalX == -50 && finalY == -50 {
            attacker.OrderUnitToAttackRangedUPRIGHT_(targetLocation)
//            attacker.OrderUnitToAttackMeleeUPRIGHT()
        } else if ((finalX == 0 && finalY == -50)) {
            // FACE UP
            attacker.OrderUnitToAttackRangedUP_(targetLocation)
        } else if finalX == 50 && finalY == -50 {
            attacker.OrderUnitToAttackRangedUPLEFT_(targetLocation)
//            attacker.OrderUnitToAttackMeleeUPLEFT()
        } else if finalX == 50 && finalY == 0 {
            // FACE LEFT
            attacker.OrderUnitToAttackRangedLEFT_(targetLocation)
        } else if finalX == 50 && finalY == 50 {
            attacker.OrderUnitToAttackRangedDOWNLEFT_(targetLocation)
//            attacker.OrderUnitToAttackMeleeDOWNLEFT()
        } else if finalX == 0 && finalY == 50 {
            // FACE DOWN
            attacker.OrderUnitToAttackRangedDOWN_(targetLocation)
        }
    }
    
}