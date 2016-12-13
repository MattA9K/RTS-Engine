//
// Created by Mateusz Andrzejczuk on 12/2/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation



class JunkyardDogUnit : MeleeUnitNEW {
    /// Moves a unit towards a random step point
    func issueJunkYardDogOrder() {
        let possibleWalkDirections : [UnitFaceAngle] = [.up, .down, .left, .right, .ul, .ur, .dl, .dr]
        let randomDirectionIndex : Int = Int(arc4random_uniform(UInt32(possibleWalkDirections.count)))
        let nextRandomPathfinderStep : UnitFaceAngle = possibleWalkDirections[randomDirectionIndex]
        forwardSocketMessage(direction: nextRandomPathfinderStep)

        let rollDice10Sides = Int(arc4random_uniform(100))
        if rollDice10Sides == 4 {
            spawnBuilding(player: self.teamNumber)
        }
    }

    func spawnBuilding(player: Int) {
        let startLocation : CGPoint = self.positionLogical
        let newBuildingUnit : OrcHutHatcheryUnit = OrcHutHatcheryUnit(player: player)
        newBuildingUnit.sprite.position = startLocation
        self.ReferenceOfGameScene.appendAIUnitToGameScene(unit: newBuildingUnit)
        self.ReferenceOfGameScene.broadcastAIUnitToGameScene(unit: newBuildingUnit)
    }
}


class HatcheryUnit : StructureUnit {
    /// Moves a unit towards a random step point
    func issueHatcheryOrder() {
        let rollDice10Sides = Int(arc4random_uniform(10))
        if rollDice10Sides == 5 {
            trainPeon(player: self.teamNumber)
        }
    }

    func trainPeon(player: Int) {
        let startLocation : CGPoint = self.positionLogical
        let newUnit = PeonUnit(player: player)
        newUnit.sprite.position = CGPoint(
                x:startLocation.x - 150,
                y:startLocation.y - 150)
        self.ReferenceOfGameScene.hostDidRequestBuildOrder(unit: newUnit)
    }
}