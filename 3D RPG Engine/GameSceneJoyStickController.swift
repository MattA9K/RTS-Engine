//
//  GameSceneJoyStickController.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 9/20/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation


extension GameScene {
    
    func didMoveJoystick(_ direction: String, unitSuccessfullyMoved: @escaping (Bool) -> ()) {
        if direction == "left" {
            //            playerTarget?.position.x -= 50
            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepLEFT({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
            }
            //            spriteControlPanel?.moveByXNegative()
            //            anchorPoint.x += 50.0 / self.size.width
        }
        else if direction == "face-left" {
            playerSK.sprite.playFaceLeftAnimation()
            playerSK.angleFacing = UnitFaceAngle.left
            unitSuccessfullyMoved(true)
        }
            
        else if direction == "face-right" {
            playerSK.sprite.playFaceRightAnimation()
            playerSK.angleFacing = UnitFaceAngle.right
            unitSuccessfullyMoved(true)
        }
        else if direction == "right" {
            //            playerTarget?.position.x += 50
//            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepRIGHT({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
//            }
            
            //            spriteControlPanel?.moveByXPositive()
            //            anchorPoint.x -= 50.0 / self.size.width
        }
            
        else if direction == "face-up" {
            playerSK.sprite.playFaceUpAnimation()
            playerSK.angleFacing = UnitFaceAngle.up
            unitSuccessfullyMoved(true)
        }
        else if direction == "up" {
            //            playerTarget?.position.y += 50
//            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepUP({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
//            }
            
            //            anchorPoint.y -= 50.0 / self.size.height
            //            spriteControlPanel?.moveByYPositive()
        }
            
        else if direction == "face-down" {
            playerSK.sprite.playFaceDownAnimation()
            playerSK.angleFacing = UnitFaceAngle.down
        }
        else if direction == "down" {
//            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepDOWN({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
//            }
            
            //            anchorPoint.y += 50.0 / self.size.height
            //            spriteControlPanel?.moveByYNegative()
        }
            
        else if direction == "face-ul" {
            playerSK.sprite.playFaceULAnimation()
            playerSK.angleFacing = UnitFaceAngle.ul
            unitSuccessfullyMoved(true)
        }
        else if direction == "face-ur" {
            playerSK.sprite.playFaceURAnimation()
            playerSK.angleFacing = UnitFaceAngle.ur
            unitSuccessfullyMoved(true)
        }
            
        else if direction == "face-dl" {
            playerSK.sprite.playFaceDLAnimation()
            playerSK.angleFacing = UnitFaceAngle.dl
            unitSuccessfullyMoved(true)
        }
        else if direction == "face-dr" {
            playerSK.sprite.playFaceDRAnimation()
            playerSK.angleFacing = UnitFaceAngle.dr
            unitSuccessfullyMoved(true)
        }
            
        else if direction == "ul" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                let playerDidMove = (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepUL({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
            }
            
            //            if playerDidMove == true {
            //                anchorPoint.x += 50.0 / self.size.width
            //                anchorPoint.y -= 50.0 / self.size.height
            //                spriteControlPanel?.moveByXNegative()
            //                spriteControlPanel?.moveByYPositive()
            //            }
            
        }
        else if direction == "ur" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                let playerDidMove = (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepUR({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
            }
            
            //            if playerDidMove == true {
            //                anchorPoint.x -= 50.0 / self.size.width
            //                anchorPoint.y -= 50.0 / self.size.height
            //                spriteControlPanel?.moveByXPositive()
            //                spriteControlPanel?.moveByYPositive()
            //            }
        }
        else if direction == "dl" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                let playerDidMove = (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepDL({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
            }
            
            //            if playerDidMove == true {
            //                anchorPoint.x += 50.0 / self.size.width
            //                anchorPoint.y += 50.0 / self.size.height
            //                spriteControlPanel?.moveByXNegative()
            //                spriteControlPanel?.moveByYNegative()
            //            }
            
        }
        else if direction == "dr" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                let playerDidMove = (playerSK as! PathfinderUnit).OrderUnitToMoveOneStepDR({ finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
            }
            
            //            if playerDidMove == true {
            //                anchorPoint.x -= 50.0 / self.size.width
            //                anchorPoint.y += 50.0 / self.size.height
            //                spriteControlPanel?.moveByXPositive()
            //                spriteControlPanel?.moveByYNegative()
            //            }
        }
    }
    
}
