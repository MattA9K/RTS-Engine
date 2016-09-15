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
    
    var inventoryButton = AttackButton(imageNamed: "btn-attack-idle")
    var attackButton = AttackButton(imageNamed: "btn-attack-idle")
    var ralleyButton = AttackButton(imageNamed: "btn-levelUp-idle")
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
    
    var PlayerStatsWindow = SKSpriteNode(imageNamed: "level_up_window")
    
    var lblStatsStrength = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsDexterity = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsStamina = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsMagic = SKLabelNode(fontNamed:"HoeflierText")
    
    var lblStatsStrengthValue = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsDexterityValue = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsStaminaValue = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsMagicValue = SKLabelNode(fontNamed:"HoeflierText")
    
    var btnStrength = AttackButton(imageNamed: "btn-wood-idle")
    var btnDexterity = AttackButton(imageNamed: "btn-wood-idle")
    var btnStamina = AttackButton(imageNamed: "btn-wood-idle")
    var btnMagic = AttackButton(imageNamed: "btn-wood-idle")
    var btnCloseStats = AttackButton(imageNamed: "btn-wood-idle")
    
    
    
    override init() {

        self.gameScene = GameScene()
    }
    
    func hideStatsWindow() {
        PlayerStatsWindow.hidden = true
        
        btnStrength.hidden = true
        btnDexterity.hidden = true
        btnStamina.hidden = true
        btnMagic.hidden = true
        btnCloseStats.hidden = true
        
        lblStatsStrength.hidden = true
        lblStatsDexterity.hidden = true
        lblStatsStamina.hidden = true
        lblStatsMagic.hidden = true
        
        lblStatsStrengthValue.hidden = true
        lblStatsDexterityValue.hidden = true
        lblStatsStaminaValue.hidden = true
        lblStatsMagicValue.hidden = true
    }
    
    func showStatsWindow() {
        PlayerStatsWindow.hidden = false
        
        btnStrength.hidden = false
        btnDexterity.hidden = false
        btnStamina.hidden = false
        btnMagic.hidden = false
        btnCloseStats.hidden = false
        
        lblStatsStrength.hidden = false
        lblStatsDexterity.hidden = false
        lblStatsStamina.hidden = false
        lblStatsMagic.hidden = false
        
        lblStatsStrengthValue.hidden = false
        lblStatsDexterityValue.hidden = false
        lblStatsStaminaValue.hidden = false
        lblStatsMagicValue.hidden = false
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
        
        //self.ralleyButton.xScale = 0.65
        //self.ralleyButton.yScale = 0.65
        //self.ralleyButton.position = CGPointMake((gameScene.size.width * 0.77), 150)
        //self.ralleyButton.zPosition = 2000
        //self.ralleyButton.nameCustom = "lvlUp"
        
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
        
        self.ralleyButton.xScale = 0.65
        self.ralleyButton.yScale = 0.65
        self.ralleyButton.position = CGPointMake((gameScene.size.width * 0.5), 150)
        self.ralleyButton.zPosition = 2000
        self.ralleyButton.nameCustom = "lvlUp"
        
        self.joyStick.position = CGPointMake(200, 200)
        self.joyStick.zPosition = 2000
        
        
        lblStatsStrength.position = CGPointMake((gameScene.size.width * 0.3), (gameScene.size.height * 0.30))
        lblStatsStrength.text = "Strength"
        lblStatsStrength.zPosition = 2501
        lblStatsStrength.fontSize = 42
        
        lblStatsDexterity.position = CGPointMake((gameScene.size.width * 0.3), (gameScene.size.height * 0.45))
        lblStatsDexterity.text = "Dexterity"
        lblStatsDexterity.zPosition = 2501
        lblStatsDexterity.fontSize = 42
        
        lblStatsStamina.position = CGPointMake((gameScene.size.width * 0.3), (gameScene.size.height * 0.60))
        lblStatsStamina.text = "Stamina"
        lblStatsStamina.zPosition = 2501
        lblStatsStamina.fontSize = 42
        
        lblStatsMagic.position = CGPointMake((gameScene.size.width * 0.3), (gameScene.size.height * 0.80))
        lblStatsMagic.text = "Magic"
        lblStatsMagic.zPosition = 2501
        lblStatsMagic.fontSize = 42
        
        
        lblStatsStrengthValue.position = CGPointMake((gameScene.size.width * 0.45), (gameScene.size.height * 0.30))
        lblStatsStrengthValue.text = "10"
        lblStatsStrengthValue.zPosition = 2501
        lblStatsStrengthValue.fontSize = 42
        
        lblStatsDexterityValue.position = CGPointMake((gameScene.size.width * 0.45), (gameScene.size.height * 0.45))
        lblStatsDexterityValue.text = "5"
        lblStatsDexterityValue.zPosition = 2501
        lblStatsDexterityValue.fontSize = 42
        
        lblStatsStaminaValue.position = CGPointMake((gameScene.size.width * 0.45), (gameScene.size.height * 0.60))
        lblStatsStaminaValue.text = "10"
        lblStatsStaminaValue.zPosition = 2501
        lblStatsStaminaValue.fontSize = 42
        
        lblStatsMagicValue.position = CGPointMake((gameScene.size.width * 0.45), (gameScene.size.height * 0.80))
        lblStatsMagicValue.text = "5"
        lblStatsMagicValue.zPosition = 2501
        lblStatsMagicValue.fontSize = 42
        
        
        self.PlayerStatsWindow.xScale = 1
        self.PlayerStatsWindow.yScale = 1
        self.PlayerStatsWindow.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.5))
        self.PlayerStatsWindow.zPosition = 2500
        
        self.btnStrength.xScale = 0.35
        self.btnStrength.yScale = 0.35
        self.btnStrength.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.8))
        self.btnStrength.zPosition = 2501
        self.btnStrength.nameCustom = "strength"
        
        self.btnDexterity.xScale = 0.35
        self.btnDexterity.yScale = 0.35
        self.btnDexterity.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.60))
        self.btnDexterity.zPosition = 2501
        self.btnDexterity.nameCustom = "dexterity"
        
        self.btnStamina.xScale = 0.35
        self.btnStamina.yScale = 0.35
        self.btnStamina.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.45))
        self.btnStamina.zPosition = 2501
        self.btnStamina.nameCustom = "stamina"
        
        self.btnMagic.xScale = 0.35
        self.btnMagic.yScale = 0.35
        self.btnMagic.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.30))
        self.btnMagic.zPosition = 2501
        self.btnMagic.nameCustom = "magic"
        
        self.btnCloseStats.xScale = 0.35
        self.btnCloseStats.yScale = 0.35
        self.btnCloseStats.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.15))
        self.btnCloseStats.zPosition = 2501
        self.btnCloseStats.nameCustom = "exitstats"
        

        
        
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
        //self.gameScene.addChild(self.spell1Button)
        self.gameScene.addChild(self.PlayerStatsWindow)
//        self.gameScene.addChild(self.spell2Button)
        
        self.gameScene.addChild(self.joyStick)
        self.gameScene.addChild(self.labelUnitName)
        self.gameScene.addChild(self.labelArmor)
        self.gameScene.addChild(self.labelDamage)
        self.gameScene.addChild(self.labelSight)
        self.gameScene.addChild(self.labelSpeed)
        
        self.gameScene.addChild(btnStrength)
        self.gameScene.addChild(btnDexterity)
        self.gameScene.addChild(btnStamina)
        self.gameScene.addChild(btnMagic)
        self.gameScene.addChild(btnCloseStats)
        
        self.gameScene.addChild(lblStatsStrength)
        self.gameScene.addChild(lblStatsDexterity)
        self.gameScene.addChild(lblStatsStamina)
        self.gameScene.addChild(lblStatsMagic)
        
        self.gameScene.addChild(lblStatsStrengthValue)
        self.gameScene.addChild(lblStatsDexterityValue)
        self.gameScene.addChild(lblStatsStaminaValue)
        self.gameScene.addChild(lblStatsMagicValue)
    }
    
    
    func activateFromViewController() {
        guiTimer = NSTimer.scheduledTimerWithTimeInterval(0.1,
                                                          target: self,
                                                          selector: #selector(UIPlayerControlPanel.updateGUIFromTimer),
                                                          userInfo: nil,
                                                          repeats: true)
        self.attackButton.makeInteractable(self)
        self.ralleyButton.makeInteractable(self)
        self.btnStrength.makeInteractable(self)
        self.btnDexterity.makeInteractable(self)
        self.btnStamina.makeInteractable(self)
        self.btnMagic.makeInteractable(self)
        self.btnCloseStats.makeInteractable(self)
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
        self.gameScene.playerDidTouchNewRallyForcesButton()
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
        self.gameScene.playerDidTouchNewRallyForcesButton()
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
        self.gameScene.playerDidTouchNewRallyForcesButton()
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
        self.gameScene.playerDidTouchNewRallyForcesButton()
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