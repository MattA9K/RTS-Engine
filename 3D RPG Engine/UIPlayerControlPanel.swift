//
//  UIPlayerControlPanel.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/4/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class UIPlayerControlPanel : NSObject, UIPlayerComponents {
    var gameScene: GameScene
    var panelView: SKSpriteNode = SKSpriteNode(imageNamed: "SearchRadiusDummyV")
    
    var attackButton = AttackButton(imageNamed: "btnAttack")
    var ralleyButton = AttackButton(imageNamed: "btnAttack")
    
    
    var joyStick: Joystick = Joystick()
    
    var labelUnitName = SKLabelNode(fontNamed:"HoeflierText")
    
    var labelArmor = SKLabelNode(fontNamed:"HoeflierText")
    var labelDamage = SKLabelNode(fontNamed:"HoeflierText")
    var labelSight = SKLabelNode(fontNamed:"HoeflierText")
    var labelSpeed = SKLabelNode(fontNamed:"HoeflierText")
    
    var guiTimer: NSTimer?
    var focusedUnit: AbstractUnit?
    
    
    override init() {
        // stupid fucking Swift forces you to init self's property
        // there's no nil option which is fucking stupid....
        self.gameScene = GameScene()
    }
    
    init(gameScene: GameScene) {
        self.gameScene = gameScene
        
        labelUnitName.position = CGPointMake((gameScene.size.width * 0.85), (gameScene.size.height * 0.94))
        labelUnitName.text = "Footman"
        labelUnitName.zPosition = 2001
        labelUnitName.fontSize = 28
        
        labelArmor.position = CGPointMake((gameScene.size.width * 0.85), (gameScene.size.height * 0.86))
        labelArmor.text = "Armor: 0"
        labelArmor.zPosition = 2001
        labelArmor.fontSize = 28
        
        labelDamage.position = CGPointMake((gameScene.size.width * 0.85), (gameScene.size.height * 0.81))
        labelDamage.text = "Damage: 1"
        labelDamage.zPosition = 2001
        labelDamage.fontSize = 28
        
        labelSight.position = CGPointMake((gameScene.size.width * 0.85), (gameScene.size.height * 0.76))
        labelSight.text = "Sight: 5"
        labelSight.zPosition = 2001
        labelSight.fontSize = 28
        
        labelSpeed.position = CGPointMake((gameScene.size.width * 0.85), (gameScene.size.height * 0.71))
        labelSpeed.text = "Speed: 4"
        labelSpeed.zPosition = 2001
        labelSpeed.fontSize = 28
        
        self.panelView.xScale = 5.0
        self.panelView.yScale = 12.0
        self.panelView.position = CGPointMake((gameScene.size.width * 0.89), (gameScene.size.height * 0.70))
        self.panelView.zPosition = 2000
        
        self.attackButton.xScale = 0.75
        self.attackButton.yScale = 0.75
        self.attackButton.position = CGPointMake((gameScene.size.width * 0.90), 150)
        self.attackButton.zPosition = 2000
        self.attackButton.nameCustom = "attack"
        
        self.ralleyButton.xScale = 0.75
        self.ralleyButton.yScale = 0.75
        self.ralleyButton.position = CGPointMake((gameScene.size.width * 0.80), 150)
        self.ralleyButton.zPosition = 2000
        self.ralleyButton.nameCustom = "rally"
        
        self.joyStick.position = CGPointMake(200, 200)
        self.joyStick.zPosition = 2000
        
        self.gameScene.addChild(self.panelView)
        self.gameScene.addChild(self.attackButton)
        self.gameScene.addChild(self.ralleyButton)
        self.gameScene.addChild(self.joyStick)
        
        self.gameScene.addChild(self.labelUnitName)
        self.gameScene.addChild(self.labelArmor)
        self.gameScene.addChild(self.labelDamage)
        self.gameScene.addChild(self.labelSight)
        self.gameScene.addChild(self.labelSpeed)
        
        
    }
    
    func activateFromViewController() {
        guiTimer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(UIPlayerControlPanel.updateGUIFromTimer), userInfo: nil, repeats: true)
        self.attackButton.makeInteractable(self)
        self.ralleyButton.makeInteractable(self)
    }
    
    func updateGUIFromTimer() {
        if let unit = focusedUnit {
            self.labelUnitName.text = unit.nameGUI
            self.labelArmor.text = "Armor: \(unit.Armor)"
            self.labelSpeed.text = "HP: \(unit.HP) "
            self.labelDamage.text = "Damage: \(unit.DMG) "
        }
    }
    
    func moveByXPositive() {
        panelView.position.x += 50
        attackButton.position.x += 50
        joyStick.position.x += 50
        
        labelUnitName.position.x += 50
        labelArmor.position.x += 50
        labelDamage.position.x += 50
        labelSight.position.x += 50
        labelSpeed.position.x += 50
        ralleyButton.position.x += 50
    }
    func moveByXNegative() {
        panelView.position.x -= 50
        attackButton.position.x -= 50
        joyStick.position.x -= 50
        
        labelUnitName.position.x -= 50
        labelArmor.position.x -= 50
        labelDamage.position.x -= 50
        labelSight.position.x -= 50
        labelSpeed.position.x -= 50
        ralleyButton.position.x -= 50
    }
    func moveByYPositive() {
        panelView.position.y += 50
        attackButton.position.y += 50
        joyStick.position.y += 50
        
        labelUnitName.position.y += 50
        labelArmor.position.y += 50
        labelDamage.position.y += 50
        labelSight.position.y += 50
        labelSpeed.position.y += 50
        ralleyButton.position.y += 50
    }
    func moveByYNegative() {
        panelView.position.y -= 50
        attackButton.position.y -= 50
        joyStick.position.y -= 50
        
        labelUnitName.position.y -= 50
        labelArmor.position.y -= 50
        labelDamage.position.y -= 50
        labelSight.position.y -= 50
        labelSpeed.position.y -= 50
        ralleyButton.position.y -= 50
    }
    
    func orderPlayerToAttack() {
        self.gameScene.playerDidTouchNewAttackButton()
    }
    
    func orderPlayerToRalleyForces() {
        self.gameScene.playerDidTouchNewRallyForcesButton()
    }
    
    
}