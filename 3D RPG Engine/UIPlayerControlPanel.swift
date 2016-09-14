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
    
    var attackButton = AttackButton(imageNamed: "btn-attack-idle")
    var ralleyButton = AttackButton(imageNamed: "btn-wood-idle")
    var spell1Button = AttackButton(imageNamed: "btn-wood-idle")
    var spell2Button = AttackButton(imageNamed: "btn-wood-idle")
    
    // HEALTH, MANA & EXP BARS:
    var HealthJUICE = SKSpriteNode(imageNamed: "healthBar")
    var ManaJUICE = SKSpriteNode(imageNamed: "manaBar")
    var ExpJUICE = SKSpriteNode(imageNamed: "expBar")
    var HealthContainer = SKSpriteNode(imageNamed: "barcontainer")
    var ManaContainer = SKSpriteNode(imageNamed: "barcontainer")
    var ExpContainer = SKSpriteNode(imageNamed: "barcontainer")
    
    
    var joyStick: Joystick = Joystick()
    
    var labelUnitName = SKLabelNode(fontNamed:"HoeflierText")
    
    var labelArmor = SKLabelNode(fontNamed:"HoeflierText")
    var labelDamage = SKLabelNode(fontNamed:"HoeflierText")
    var labelSight = SKLabelNode(fontNamed:"HoeflierText")
    var labelSpeed = SKLabelNode(fontNamed:"HoeflierText")
    
    var guiTimer: NSTimer?
    var focusedUnit: AbstractUnit?
    
    
    override init() {

        self.gameScene = GameScene()
    }
    
    init(gameScene: GameScene) {
        self.gameScene = gameScene
        
        labelUnitName.position = CGPointMake((gameScene.size.width * 0.9), (gameScene.size.height * 0.94))
        labelUnitName.text = "Footman"
        labelUnitName.zPosition = 2001
        labelUnitName.fontSize = 28
        
        labelArmor.position = CGPointMake((gameScene.size.width * 0.9), (gameScene.size.height * 0.86))
        labelArmor.text = "Armor: 0"
        labelArmor.zPosition = 2001
        labelArmor.fontSize = 28
        
        labelDamage.position = CGPointMake((gameScene.size.width * 0.9), (gameScene.size.height * 0.81))
        labelDamage.text = "Damage: 1"
        labelDamage.zPosition = 2001
        labelDamage.fontSize = 28
        
        labelSight.position = CGPointMake((gameScene.size.width * 0.9), (gameScene.size.height * 0.76))
        labelSight.text = "Sight: 5"
        labelSight.zPosition = 2001
        labelSight.fontSize = 28
        
        labelSpeed.position = CGPointMake((gameScene.size.width * 0.9), (gameScene.size.height * 0.71))
        labelSpeed.text = "Speed: 4"
        labelSpeed.zPosition = 2001
        labelSpeed.fontSize = 28
        
        self.panelView.xScale = 5.0
        self.panelView.yScale = 12.0
        self.panelView.position = CGPointMake((gameScene.size.width * 0.91), (gameScene.size.height * 0.70))
        self.panelView.zPosition = 2000
        
        self.attackButton.xScale = 0.65
        self.attackButton.yScale = 0.65
        self.attackButton.position = CGPointMake((gameScene.size.width * 0.90), 150)
        self.attackButton.zPosition = 2000
        self.attackButton.nameCustom = "attack"
        
        self.ralleyButton.xScale = 0.65
        self.ralleyButton.yScale = 0.65
        self.ralleyButton.position = CGPointMake((gameScene.size.width * 0.77), 150)
        self.ralleyButton.zPosition = 2000
        self.ralleyButton.nameCustom = "rally"
        
        self.spell1Button.xScale = 0.65
        self.spell1Button.yScale = 0.65
        self.spell1Button.position = CGPointMake((gameScene.size.width * 0.64), 150)
        self.spell1Button.zPosition = 2000
        self.spell1Button.nameCustom = "spell1"
        
        self.spell2Button.xScale = 0.65
        self.spell2Button.yScale = 0.65
        self.spell2Button.position = CGPointMake((gameScene.size.width * 0.5), 150)
        self.spell2Button.zPosition = 2000
        self.spell2Button.nameCustom = "spell2"
        
        self.joyStick.position = CGPointMake(200, 200)
        self.joyStick.zPosition = 2000
        
        
        
        
        HealthJUICE.xScale = 3
        HealthJUICE.yScale = 0.5
        HealthJUICE.position = CGPointMake(500, 50)
        HealthJUICE.zPosition = 2001
        
        ManaJUICE.xScale = 3
        ManaJUICE.yScale = 0.5
        ManaJUICE.position = CGPointMake(500, 100)
        ManaJUICE.zPosition = 2001
        
        ExpJUICE.xScale = 3
        ExpJUICE.yScale = 0.5
        ExpJUICE.position = CGPointMake(500, 150)
        ExpJUICE.zPosition = 2001
        
        HealthContainer.xScale = 3.1
        HealthContainer.yScale = 0.51
        HealthContainer.position = CGPointMake(499.2, 50)
        HealthContainer.zPosition = 2000
        
        ManaContainer.xScale = 3.1
        ManaContainer.yScale = 0.51
        ManaContainer.position = CGPointMake(499.1, 100)
        ManaContainer.zPosition = 2000
        
        ExpContainer.xScale = 3.1
        ExpContainer.yScale = 0.51
        ExpContainer.position = CGPointMake(499.01, 150)
        ExpContainer.zPosition = 2000
        

        
        self.gameScene.addChild(HealthJUICE)
        self.gameScene.addChild(ManaJUICE)
        self.gameScene.addChild(ExpJUICE)
        self.gameScene.addChild(HealthContainer)
        self.gameScene.addChild(ManaContainer)
        self.gameScene.addChild(ExpContainer)
        
        self.gameScene.addChild(self.panelView)
        self.gameScene.addChild(self.attackButton)
        self.gameScene.addChild(self.ralleyButton)
        self.gameScene.addChild(self.spell1Button)
        self.gameScene.addChild(self.spell2Button)
        
        self.gameScene.addChild(self.joyStick)
        
        self.gameScene.addChild(self.labelUnitName)
        self.gameScene.addChild(self.labelArmor)
        self.gameScene.addChild(self.labelDamage)
        self.gameScene.addChild(self.labelSight)
        self.gameScene.addChild(self.labelSpeed)
    }
    
    func activateFromViewController() {
        guiTimer = NSTimer.scheduledTimerWithTimeInterval(0.2,
                                                          target: self,
                                                          selector: #selector(UIPlayerControlPanel.updateGUIFromTimer),
                                                          userInfo: nil,
                                                          repeats: true)
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
        spell2Button.position.x += 50
        spell1Button.position.x += 50
        
        ManaContainer.position.x += 50
        ExpContainer.position.x += 50
        HealthContainer.position.x += 50
        ExpJUICE.position.x += 50
        ManaJUICE.position.x += 50
        HealthJUICE.position.x += 50
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
        spell2Button.position.x -= 50
        spell1Button.position.x -= 50
        
        ManaContainer.position.x -= 50
        ExpContainer.position.x -= 50
        HealthContainer.position.x -= 50
        ExpJUICE.position.x -= 50
        ManaJUICE.position.x -= 50
        HealthJUICE.position.x -= 50
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
        spell2Button.position.y += 50
        spell1Button.position.y += 50
        
        ManaContainer.position.y += 50
        ExpContainer.position.y += 50
        HealthContainer.position.y += 50
        ExpJUICE.position.y += 50
        ManaJUICE.position.y += 50
        HealthJUICE.position.y += 50
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
        spell2Button.position.y -= 50
        spell1Button.position.y -= 50
        
        ManaContainer.position.y -= 50
        ExpContainer.position.y -= 50
        HealthContainer.position.y -= 50
        ExpJUICE.position.y -= 50
        ManaJUICE.position.y -= 50
        HealthJUICE.position.y -= 50
    }
    
    func orderPlayerToAttack() {
        self.gameScene.playerDidTouchNewAttackButton()
    }
    
    func orderPlayerToRalleyForces() {
        self.gameScene.playerDidTouchNewRallyForcesButton()
    }
    
    func updateResourceBar(percentLeft: CGFloat, resourceType: ResourceBar) {
        let totalValue = percentLeft * 3
        
        if resourceType == .HP {
            HealthJUICE.xScale = totalValue
        }
        else if resourceType == .Mana {
            ManaJUICE.xScale = totalValue
        }
        else if resourceType == .EXP {
            ExpJUICE.xScale = totalValue
        }
    }
    
    enum ResourceBar {
        case Mana, HP, EXP
    }
}