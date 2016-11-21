//
//  GameInputTouchCommands.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit

extension GameScene {
    
    func playerDidTouchNewAttackButton() {
        let facing = playerSK.angleFacing
        if socket.isConnected == true {
            self.broadcastPlayerHeroAttackToGameScene(facing)
        } else {
            (playerSK as! MeleeUnitNEW).orderUnitToAttackMelee(angleFacing: facing)
        }
        
//        (playerSK as! MeleeUnitNEW).orderUnitToAttackMelee(angleFacing: facing)
    }
    
    func joystickDidWalkEvent(_ direction: UnitFaceAngle, unitSuccessfullyMoved: @escaping (Bool) -> ()) {
        
        if socket.isConnected == true {
            self.broadcastPlayerHeroMovementToGameScene(direction)
        } else {
            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStep(
                    direction: direction,
                    completionHandler: { finalDestination in
                        self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                        unitSuccessfullyMoved(true)
                })
            }
        }

    }
    
    
    func joystickDidFaceEvent(_ direction: UnitFaceAngle, unitSuccessfullyMoved: @escaping (Bool) -> ()) {
        if (playerSK as! PathfinderUnit).isMoving == false {
            playerSK.sprite.playFaceAnimation(direction: direction)
            playerSK.angleFacing = direction
            unitSuccessfullyMoved(true)
        }
    }
    
    
    func playerDidTouchNewRallyForcesButton() {
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.low).async {
            for unitUUID in self.AllUnitGUIDs {
                if self.AllUnitsInGameScene[unitUUID]!.teamNumber == self.playerSK.teamNumber &&
                    (self.AllUnitsInGameScene[unitUUID]! as! MeleeUnitNEW).CoolingDown == false && (self.AllUnitsInGameScene[unitUUID]! as! MeleeUnitNEW).isMoving == false &&
                (self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit?.isDead == false || self.AllUnitsInGameScene[unitUUID]!.focusedTargetUnit != nil) {
                    DispatchQueue.main.async {
                        if self.AllUnitsInGameScene[unitUUID]! is FootmanMercUnit && self.AllUnitsInGameScene[unitUUID]!.isDead == false {
                            if let subUnit = self.AllUnitsInGameScene[unitUUID]! as? PathfinderUnit {
                                print((subUnit as! FootmanMercUnit).nameGUI)
                                if (subUnit as! FootmanMercUnit).nameGUI == "merc_unit" {
                                    subUnit.issueOrderTargetingPoint(self.playerSK.sprite.position, completionHandler: { finalDestination in
                                        self.AllUnitsInGameScenePositions[subUnit.uuid.uuidString] = finalDestination
                                    })
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    func showDamagedPoint(_ pointAttackedInWorld: CGPoint) {

    }
    
    
    func playerDidTouchSuicideButton(_ sender: UIButton!) {

    }
    
}
