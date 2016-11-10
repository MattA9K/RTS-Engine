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
        
        print("DID MOVE JOYSTICK!!! \n \(direction)")
        
        if direction == "left" {
            //            playerTarget?.position.x -= 50
            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStep(direction: .left, completionHandler: { finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
            }
            //            spriteControlPanel?.moveByXNegative()
            //            anchorPoint.x += 50.0 / self.size.width
        }
        else if direction == "face-left" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                playerSK.sprite.playFaceLeftAnimation()
                playerSK.angleFacing = UnitFaceAngle.left
                unitSuccessfullyMoved(true)
            }
        }
            
        else if direction == "face-right" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                playerSK.sprite.playFaceRightAnimation()
                playerSK.angleFacing = UnitFaceAngle.right
                unitSuccessfullyMoved(true)
            }
        }
        else if direction == "right" {
            //            playerTarget?.position.x += 50
            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStep(direction: .right, completionHandler: { finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
            }
            
            //            spriteControlPanel?.moveByXPositive()
            //            anchorPoint.x -= 50.0 / self.size.width
        }
            
        else if direction == "face-up" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                playerSK.sprite.playFaceUpAnimation()
                playerSK.angleFacing = UnitFaceAngle.up
                unitSuccessfullyMoved(true)
            }
        }
        else if direction == "up" {
            //            playerTarget?.position.y += 50
            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStep(direction: .up, completionHandler: { finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
            }
            
            //            anchorPoint.y -= 50.0 / self.size.height
            //            spriteControlPanel?.moveByYPositive()
        }
            
        else if direction == "face-down" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                playerSK.sprite.playFaceDownAnimation()
                playerSK.angleFacing = UnitFaceAngle.down
                unitSuccessfullyMoved(true)
            }
        }
        else if direction == "down" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStep(direction: .down, completionHandler: { finalDestination in
                    self.AllUnitsInGameScenePositions[self.playerSK.uuid.uuidString] = finalDestination
                    unitSuccessfullyMoved(true)
                })
            }
            
            //            anchorPoint.y += 50.0 / self.size.height
            //            spriteControlPanel?.moveByYNegative()
        }
            
        else if direction == "face-ul" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                playerSK.sprite.playFaceULAnimation()
                playerSK.angleFacing = UnitFaceAngle.ul
                unitSuccessfullyMoved(true)
            }
        }
        else if direction == "face-ur" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                playerSK.sprite.playFaceURAnimation()
                playerSK.angleFacing = UnitFaceAngle.ur
                unitSuccessfullyMoved(true)
            }
        }
            
        else if direction == "face-dl" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                playerSK.sprite.playFaceDLAnimation()
                playerSK.angleFacing = UnitFaceAngle.dl
                unitSuccessfullyMoved(true)
            }
        }
        else if direction == "face-dr" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                playerSK.sprite.playFaceDRAnimation()
                playerSK.angleFacing = UnitFaceAngle.dr
                unitSuccessfullyMoved(true)
            }
        }
            
        else if direction == "ul" {
            if (playerSK as! PathfinderUnit).isMoving == false {
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStep(direction: .ul, completionHandler: { finalDestination in
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
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStep(direction: .ur, completionHandler: { finalDestination in
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
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStep(direction: .dl, completionHandler: { finalDestination in
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
                (playerSK as! PathfinderUnit).OrderUnitToMoveOneStep(direction: .dr, completionHandler: { finalDestination in
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
