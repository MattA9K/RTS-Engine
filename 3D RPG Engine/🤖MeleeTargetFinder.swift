//
//  MeleeTargetFinder.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class MeleeTargetFinder {
    
    /*
     MELEE UNIT's X AND Y POSITION DETERMINE WHICH ANGLE TO FACE WHEN ATTACKING
     
    x: -50|x:   0|x:  50
    y:  50|y:  50|y:  50
    ------|------|------
    x: -50|      |x:  50
    y:   0|      |y:   0
    ------|------|------
    x: -50|x:   0|x:  50
    y: -50|y: -50|y: -50
     
    */
    
    func faceTargetAndAttack(attacker: PathfindingUnit, X: CGFloat, Y: CGFloat) {
        if X == -50 && Y == 50 {
            // FACE DOWN RIGHT
            attacker.OrderUnitToAttackMeleeDOWNRIGHT()
        } else if X == -50 && Y == 0 {
            // FACE RIGHT
            attacker.OrderUnitToAttackMeleeRIGHT()
        } else if X == -50 && Y == -50 {
            // FACE UP RIGHT
            attacker.OrderUnitToAttackMeleeUPRIGHT()
        } else if X == 0 && Y == -50 {
            // FACE UP
            attacker.OrderUnitToAttackMeleeUP()
        } else if X == 50 && Y == -50 {
            // FACE UP LEFT
            attacker.OrderUnitToAttackMeleeUPLEFT()
        } else if X == 50 && Y == 0 {
            // FACE LEFT
            attacker.OrderUnitToAttackMeleeLEFT()
        } else if X == 50 && Y == 50 {
            // FACE DOWN LEFT
            attacker.OrderUnitToAttackMeleeDOWNLEFT()
        } else if X == 0 && Y == 50 {
            // FACE DOWN
            attacker.OrderUnitToAttackMeleeDOWN()
        }
    }
    
}