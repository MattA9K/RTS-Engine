//
//  FootmanUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/1/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class FootmanUnit: MeleeUnit {
    
    override init(unit: Actor, scene: GameScene) {
        super.init(unit: unit, scene: scene)
        
        let CastClassUnit = SKFootmanSprite(imageNamed: unit.SpritePNG)
        CastClassUnit.xScale = 0.3
        CastClassUnit.yScale = 0.3
        CastClassUnit.position = unit.pointCG
        CastClassUnit.name = unit.unitType
        CastClassUnit.zPosition = 10
        sprite = CastClassUnit
        teamNumber = 1
        HP = 3
    }
    
    override func OrderUnitToMoveOneStepUP() {
        let destination = sprite.position.y + UnitDefaultProperty.Movement.Range
        (self.sprite as! SKFootmanSprite).playWalkUPAnimation()
        sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
        angleFacing = UnitFaceAngle.Up
    }
    override func OrderUnitToMoveOneStepDOWN() {
        let destination = sprite.position.y - UnitDefaultProperty.Movement.Range
        (self.sprite as! SKFootmanSprite).playWalkDOWNAnimation()
        sprite.runAction(SKAction.moveToY(destination, duration: 0.2))
        angleFacing = UnitFaceAngle.Down
    }
    override func OrderUnitToMoveOneStepLEFT() {
        let destination = sprite.position.x - UnitDefaultProperty.Movement.Range
        (self.sprite as! SKFootmanSprite).playWalkLEFTAnimation()
        sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
        angleFacing = UnitFaceAngle.Left
    }
    override func OrderUnitToMoveOneStepRIGHT() {
        let destination = sprite.position.x + UnitDefaultProperty.Movement.Range
        (self.sprite as! SKFootmanSprite).playWalkRIGHTAnimation()
        sprite.runAction(SKAction.moveToX(destination, duration: 0.2))
        angleFacing = UnitFaceAngle.Right
    }
    
    
    override func OrderUnitToAttackMeleeUP() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y + UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.y = attackY
        (sprite as! SKFootmanSprite).playAttackUPAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitInTheSceneTookDamage(attackedUnit.name!)
        ReferenceOfGameScene🔶!.showDamagedPoint(pointAttackedInWorld)
    }
    override func OrderUnitToAttackMeleeDOWN() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.y - UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.y = attackY
        (sprite as! SKFootmanSprite).playAttackDOWNAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitInTheSceneTookDamage(attackedUnit.name!)
        ReferenceOfGameScene🔶!.showDamagedPoint(pointAttackedInWorld)
    }
    override func OrderUnitToAttackMeleeLEFT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x - UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.x = attackY
        (sprite as! SKFootmanSprite).playAttackDOWNAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitInTheSceneTookDamage(attackedUnit.name!)
        ReferenceOfGameScene🔶!.showDamagedPoint(pointAttackedInWorld)
    }
    override func OrderUnitToAttackMeleeRIGHT() {
        let currentPlayerPosition = sprite.position
        var pointAttackedInWorld = currentPlayerPosition
        let attackY = currentPlayerPosition.x + UnitDefaultProperty.Attack.Range
        pointAttackedInWorld.x = attackY
        (sprite as! SKFootmanSprite).playAttackDOWNAnimation()
        var attackedUnit = ReferenceOfGameScene🔶!.nodeAtPoint(pointAttackedInWorld)
        ReferenceOfGameScene🔶!.AllUnitsInRAM!.ThisUnitInTheSceneTookDamage(attackedUnit.name!)
        ReferenceOfGameScene🔶!.showDamagedPoint(pointAttackedInWorld)
    }
    
    override func unitIsNowDying() {
        (self.sprite as! SKFootmanSprite).playDeathAnimation()
    }
}



