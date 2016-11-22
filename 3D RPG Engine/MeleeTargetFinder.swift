//
//  MeleeTargetFinder.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class MeleeTargetFinderNEW {
    
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
    
    func faceTargetAndAttack(_ attacker: MeleeUnitNEW, X: CGFloat, Y: CGFloat) -> UnitFaceAngle {
        
        //        print(X)
        //        print(Y)
        
        if X == -50 && Y == 50 {
            // FACE DOWN RIGHT
//            attacker.OrderUnitToAttackMeleeDOWNRIGHT()
            attacker.orderUnitToAttackMelee(angleFacing: .dr)
            return .dr
        } else if X == -50 && Y == 0 {
            // FACE RIGHT
            attacker.orderUnitToAttackMelee(angleFacing: .right)
            return .right
        } else if X == -50 && Y == -50 {
            // FACE UP RIGHT
//            attacker.OrderUnitToAttackMeleeUPRIGHT()
            attacker.orderUnitToAttackMelee(angleFacing: .ur)
            return .ur
        } else if X == 0 && Y == -50 {
            // FACE UP
//            attacker.OrderUnitToAttackMeleeUP()
            attacker.orderUnitToAttackMelee(angleFacing: .up)
            return .up
        } else if X == 50 && Y == -50 {
            // FACE UP LEFT
//            attacker.OrderUnitToAttackMeleeUPLEFT()
            attacker.orderUnitToAttackMelee(angleFacing: .ul)
            return .ul
        } else if X == 50 && Y == 0 {
            // FACE LEFT
//            attacker.OrderUnitToAttackMeleeLEFT()
            attacker.orderUnitToAttackMelee(angleFacing: .left)
            return .left
        } else if X == 50 && Y == 50 {
            // FACE DOWN LEFT
//            attacker.OrderUnitToAttackMeleeDOWNLEFT()
            attacker.orderUnitToAttackMelee(angleFacing: .dl)
            return .dl
        } else if X == 0 && Y == 50 {
            // FACE DOWN
//            attacker.OrderUnitToAttackMeleeDOWN()
            attacker.orderUnitToAttackMelee(angleFacing: .down)
            return .down
        } else {
            print("[ERROR CRITICAL]: ☠️ ☠️ ☠️ func faceTargetAndAttack() ☠️ ☠️ ☠️")
            return .down
        }
    }
}
