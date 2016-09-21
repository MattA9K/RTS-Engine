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
    var spell3Button = AttackButton(imageNamed: "btn-wood-idle")
    var spell4Button = AttackButton(imageNamed: "btn-wood-idle")
    
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
    
    var lblPlayerLevel = SKLabelNode(fontNamed:"HoeflierText")
    var lblPointsToSpend = SKLabelNode(fontNamed:"HoeflierText")
    
    var lblPlayerHP = SKLabelNode(fontNamed:"HoeflierText")
    var lblPlayerMana = SKLabelNode(fontNamed:"HoeflierText")
    var lblPlayerDMG = SKLabelNode(fontNamed:"HoeflierText")
    var lblPlayerARM = SKLabelNode(fontNamed:"HoeflierText")

    
    var lblStatsStrength = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsDexterity = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsStamina = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsMagic = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsStrengthValue = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsDexterityValue = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsStaminaValue = SKLabelNode(fontNamed:"HoeflierText")
    var lblStatsMagicValue = SKLabelNode(fontNamed:"HoeflierText")
    
    var btnStrength = AttackButton(imageNamed: "btn-levelUp-idle")
    var btnDexterity = AttackButton(imageNamed: "btn-levelUp-idle")
    var btnStamina = AttackButton(imageNamed: "btn-levelUp-idle")
    var btnMagic = AttackButton(imageNamed: "btn-levelUp-idle")
    var btnCloseStats = AttackButton(imageNamed: "btn-wood-idle")
    
    var heroStat: HeroStat?
    
    override init() {

        // NEW GAME PLAYERS:
        
        self.gameScene = GameScene()
    }
    
    // useless
    func castMissileAttack() {
        self.gameScene.executeCohortFormationSequence()
    }
    
    func castSpell1() {
        self.gameScene.executeCohortFormationSequence()
    }
    func castSpell2() {
        self.gameScene.fireFrozenOrbPlayerHelper()
    }
    func castSpell3() {
        
    }
    func castSpell4() {
        
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
        
        lblPlayerLevel.hidden = true
        lblPlayerHP.hidden = true
        lblPlayerMana.hidden = true
        lblPlayerDMG.hidden = true
        lblPlayerARM.hidden = true
        lblPointsToSpend.hidden = true
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
        
        lblPlayerLevel.hidden = false
        lblPlayerHP.hidden = false
        lblPlayerMana.hidden = false
        lblPlayerDMG.hidden = false
        lblPlayerARM.hidden = false
        lblPointsToSpend.hidden = false
    }
    
    init(gameScene: GameScene, playerUnit: AbstractUnit) {
        self.gameScene = gameScene
        self.heroStat = HeroStat(unit: playerUnit)
        
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
        
        self.attackButton.xScale = 0.45
        self.attackButton.yScale = 0.45
        self.attackButton.position = CGPointMake((gameScene.size.width * 0.95), 90)
        self.attackButton.zPosition = 2000
        self.attackButton.nameCustom = "attack"
        
        //self.ralleyButton.xScale = 0.65
        //self.ralleyButton.yScale = 0.65
        //self.ralleyButton.position = CGPointMake((gameScene.size.width * 0.77), 150)
        //self.ralleyButton.zPosition = 2000
        //self.ralleyButton.nameCustom = "lvlUp"
        
        self.spell1Button.xScale = 0.45
        self.spell1Button.yScale = 0.45
        self.spell1Button.position = CGPointMake((gameScene.size.width * 0.59), 90) /// 0.55  / no 4 / no 15
        self.spell1Button.zPosition = 2000
        self.spell1Button.nameCustom = "spell1"
        
        self.spell2Button.xScale = 0.45
        self.spell2Button.yScale = 0.45
        self.spell2Button.position = CGPointMake((gameScene.size.width * 0.68), 90)
        self.spell2Button.zPosition = 2000
        self.spell2Button.nameCustom = "spell2"
        
        self.spell3Button.xScale = 0.45
        self.spell3Button.yScale = 0.45
        self.spell3Button.position = CGPointMake((gameScene.size.width * 0.77), 90)
        self.spell3Button.zPosition = 2000
        self.spell3Button.nameCustom = "spell3"
        
        self.spell4Button.xScale = 0.45
        self.spell4Button.yScale = 0.45
        self.spell4Button.position = CGPointMake((gameScene.size.width * 0.86), 90)
        self.spell4Button.zPosition = 2000
        self.spell4Button.nameCustom = "spell4"
        
        self.ralleyButton.xScale = 0.30
        self.ralleyButton.yScale = 0.30
        self.ralleyButton.position = CGPointMake((gameScene.size.width * 0.5), 200)
        self.ralleyButton.zPosition = 2000
        self.ralleyButton.nameCustom = "lvlUp"
        
        self.joyStick.position = CGPointMake(200, 200)
        self.joyStick.zPosition = 2000
        
        
        
        lblStatsStrength.position = CGPointMake((gameScene.size.width * 0.3), (gameScene.size.height * 0.25))
        lblStatsStrength.text = "Strength"
        lblStatsStrength.zPosition = 2501
        lblStatsStrength.fontSize = 42
        
        lblStatsDexterity.position = CGPointMake((gameScene.size.width * 0.3), (gameScene.size.height * 0.4))
        lblStatsDexterity.text = "Dexterity"
        lblStatsDexterity.zPosition = 2501
        lblStatsDexterity.fontSize = 42
        
        lblStatsStamina.position = CGPointMake((gameScene.size.width * 0.3), (gameScene.size.height * 0.55))
        lblStatsStamina.text = "Stamina"
        lblStatsStamina.zPosition = 2501
        lblStatsStamina.fontSize = 42
        
        lblStatsMagic.position = CGPointMake((gameScene.size.width * 0.3), (gameScene.size.height * 0.7))
        lblStatsMagic.text = "Magic"
        lblStatsMagic.zPosition = 2501
        lblStatsMagic.fontSize = 42
        
        
        lblStatsStrengthValue.position = CGPointMake((gameScene.size.width * 0.40), (gameScene.size.height * 0.25))
        lblStatsStrengthValue.text = String(heroStat!.Strength)
        lblStatsStrengthValue.zPosition = 2501
        lblStatsStrengthValue.fontSize = 42
        
        lblStatsDexterityValue.position = CGPointMake((gameScene.size.width * 0.40), (gameScene.size.height * 0.4))
        lblStatsDexterityValue.text = String(heroStat!.Dexterity)
        lblStatsDexterityValue.zPosition = 2501
        lblStatsDexterityValue.fontSize = 42
        
        lblStatsStaminaValue.position = CGPointMake((gameScene.size.width * 0.40), (gameScene.size.height * 0.55))
        lblStatsStaminaValue.text = String(heroStat!.Stamina)
        lblStatsStaminaValue.zPosition = 2501
        lblStatsStaminaValue.fontSize = 42
        
        lblStatsMagicValue.position = CGPointMake((gameScene.size.width * 0.40), (gameScene.size.height * 0.7))
        lblStatsMagicValue.text = String(heroStat!.Magic)
        lblStatsMagicValue.zPosition = 2501
        lblStatsMagicValue.fontSize = 42
        
        
        lblPlayerLevel.position = CGPointMake((gameScene.size.width * 0.30), (gameScene.size.height * 0.9))
        lblPlayerLevel.text = "Level \(heroStat!.Level)"
        lblPlayerLevel.zPosition = 2501
        lblPlayerLevel.fontSize = 42
        lblPlayerHP.position = CGPointMake((gameScene.size.width * 0.65), (gameScene.size.height * 0.7))
        lblPlayerHP.text = "Life: \(gameScene.playerSK.HP)/\(gameScene.playerSK.HP_MAX)"
        lblPlayerHP.zPosition = 2501
        lblPlayerHP.fontSize = 42
        lblPlayerMana.position = CGPointMake((gameScene.size.width * 0.65), (gameScene.size.height * 0.6))
        lblPlayerMana.text = "Mana: \(gameScene.playerSK.MANA)/\(gameScene.playerSK.MANA_MAX)"
        lblPlayerMana.zPosition = 2501
        lblPlayerMana.fontSize = 42
        lblPlayerDMG.position = CGPointMake((gameScene.size.width * 0.65), (gameScene.size.height * 0.5))
        lblPlayerDMG.text = "Damage: \(gameScene.playerSK.DMG)"
        lblPlayerDMG.zPosition = 2501
        lblPlayerDMG.fontSize = 42
        lblPlayerARM.position = CGPointMake((gameScene.size.width * 0.65), (gameScene.size.height * 0.4))
        lblPlayerARM.text = "Armor: \(gameScene.playerSK.Armor)"
        lblPlayerARM.zPosition = 2501
        lblPlayerARM.fontSize = 42

        lblPointsToSpend.position = CGPointMake((gameScene.size.width * 0.50), (gameScene.size.height * 0.8))
        lblPointsToSpend.text = "Points To Spend: \(heroStat!.SpendPoints)"
        lblPointsToSpend.zPosition = 2501
        lblPointsToSpend.fontSize = 42
        
        
        self.PlayerStatsWindow.xScale = 1
        self.PlayerStatsWindow.yScale = 1
        self.PlayerStatsWindow.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.5))
        self.PlayerStatsWindow.zPosition = 2500
        
        self.btnStrength.xScale = 0.35
        self.btnStrength.yScale = 0.35
        self.btnStrength.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.25))
        self.btnStrength.zPosition = 2501
        self.btnStrength.nameCustom = "strength"
        
        self.btnDexterity.xScale = 0.35
        self.btnDexterity.yScale = 0.35
        self.btnDexterity.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.4))
        self.btnDexterity.zPosition = 2501
        self.btnDexterity.nameCustom = "dexterity"
        
        self.btnStamina.xScale = 0.35
        self.btnStamina.yScale = 0.35
        self.btnStamina.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.55))
        self.btnStamina.zPosition = 2501
        self.btnStamina.nameCustom = "stamina"
        
        self.btnMagic.xScale = 0.35
        self.btnMagic.yScale = 0.35
        self.btnMagic.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.7))
        self.btnMagic.zPosition = 2501
        self.btnMagic.nameCustom = "magic"
        
        self.btnCloseStats.xScale = 0.35
        self.btnCloseStats.yScale = 0.35
        self.btnCloseStats.position = CGPointMake((gameScene.size.width * 0.5), (gameScene.size.height * 0.10))
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
        self.gameScene.addChild(self.spell1Button)
        self.gameScene.addChild(self.PlayerStatsWindow)
        self.gameScene.addChild(lblPointsToSpend)
        self.gameScene.addChild(self.spell2Button)
        self.gameScene.addChild(self.spell3Button)
        self.gameScene.addChild(self.spell4Button)
        
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
        
        self.gameScene.addChild(lblPlayerLevel)
        self.gameScene.addChild(lblPlayerHP)
        self.gameScene.addChild(lblPlayerMana)
        self.gameScene.addChild(lblPlayerDMG)
        self.gameScene.addChild(lblPlayerARM)
    }
    
    func toggleHidePointsToSpend() {
        
    }
    
    func updateLevelValues() {
        let maxHP = self.gameScene.playerSK.HP_MAX
        let maxMana = self.gameScene.playerSK.MANA_MAX
        let armor = self.gameScene.playerSK.Armor_MAX
        let dmg = self.gameScene.playerSK.DMG_MAX
        
        self.gameScene.playerSK.HP_MAX = maxHP + (heroStat?.BonusHP)!
        self.gameScene.playerSK.MANA_MAX = maxMana + (heroStat?.BonusMagic)!
        self.gameScene.playerSK.Armor = armor + (heroStat?.BonusARM)!
        self.gameScene.playerSK.DMG = dmg + (heroStat?.BonusDMG)!
        
        lblStatsStrengthValue.text = String(heroStat!.Strength)
        lblStatsDexterityValue.text = String(heroStat!.Dexterity)
        lblStatsStaminaValue.text = String(heroStat!.Stamina)
        lblStatsMagicValue.text = String(heroStat!.Magic)
        lblPlayerLevel.text = "Level \(heroStat!.Level)"
        lblPlayerHP.text = "Life: \(gameScene.playerSK.HP)/\(gameScene.playerSK.HP_MAX)"
        lblPlayerMana.text = "Mana: \(gameScene.playerSK.MANA)/\(gameScene.playerSK.MANA_MAX)"
        lblPlayerDMG.text = "Damage: \(gameScene.playerSK.DMG)"
        lblPlayerARM.text = "Armor: \(gameScene.playerSK.Armor)"
        lblPointsToSpend.text = "Points To Spend: \(heroStat!.SpendPoints)"
        
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
        self.spell1Button.makeInteractable(self)
        self.spell2Button.makeInteractable(self)
        self.spell3Button.makeInteractable(self)
        self.spell4Button.makeInteractable(self)
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
        spell4Button.position.x += 50
        spell3Button.position.x += 50
        spell2Button.position.x += 50
        spell1Button.position.x += 50
        
        ManaContainer.position.x += 50
        ExpContainer.position.x += 50
        HealthContainer.position.x += 50
        ExpJUICE.position.x += 50
        ManaJUICE.position.x += 50
        HealthJUICE.position.x += 50
        
        // SKILLS WINDOW
        btnStrength.position.x += 50
        btnDexterity.position.x += 50
        btnStamina.position.x += 50
        btnMagic.position.x += 50
        btnCloseStats.position.x += 50
        lblStatsStrength.position.x += 50
        lblStatsDexterity.position.x += 50
        lblStatsStamina.position.x += 50
        lblStatsMagic.position.x += 50
        lblStatsStrengthValue.position.x += 50
        lblStatsDexterityValue.position.x += 50
        lblStatsStaminaValue.position.x += 50
        lblStatsMagicValue.position.x += 50
        lblPlayerLevel.position.x += 50
        lblPlayerHP.position.x += 50
        lblPlayerMana.position.x += 50
        lblPlayerDMG.position.x += 50
        lblPlayerARM.position.x += 50
        PlayerStatsWindow.position.x += 50
        lblPointsToSpend.position.x += 50
        // SKILLS WINDOW
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
        spell4Button.position.x -= 50
        spell3Button.position.x -= 50
        spell2Button.position.x -= 50
        spell1Button.position.x -= 50
        
        ManaContainer.position.x -= 50
        ExpContainer.position.x -= 50
        HealthContainer.position.x -= 50
        ExpJUICE.position.x -= 50
        ManaJUICE.position.x -= 50
        HealthJUICE.position.x -= 50
        
        // SKILLS WINDOW
        btnStrength.position.x -= 50
        btnDexterity.position.x -= 50
        btnStamina.position.x -= 50
        btnMagic.position.x -= 50
        btnCloseStats.position.x -= 50
        lblStatsStrength.position.x -= 50
        lblStatsDexterity.position.x -= 50
        lblStatsStamina.position.x -= 50
        lblStatsMagic.position.x -= 50
        lblStatsStrengthValue.position.x -= 50
        lblStatsDexterityValue.position.x -= 50
        lblStatsStaminaValue.position.x -= 50
        lblStatsMagicValue.position.x -= 50
        lblPlayerLevel.position.x -= 50
        lblPlayerHP.position.x -= 50
        lblPlayerMana.position.x -= 50
        lblPlayerDMG.position.x -= 50
        lblPlayerARM.position.x -= 50
        PlayerStatsWindow.position.x -= 50
        lblPointsToSpend.position.x -= 50
        // SKILLS WINDOW
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
        spell4Button.position.y += 50
        spell3Button.position.y += 50
        spell2Button.position.y += 50
        spell1Button.position.y += 50
        
        ManaContainer.position.y += 50
        ExpContainer.position.y += 50
        HealthContainer.position.y += 50
        ExpJUICE.position.y += 50
        ManaJUICE.position.y += 50
        HealthJUICE.position.y += 50
        
        // SKILLS WINDOW
        btnStrength.position.y += 50
        btnDexterity.position.y += 50
        btnStamina.position.y += 50
        btnMagic.position.y += 50
        btnCloseStats.position.y += 50
        lblStatsStrength.position.y += 50
        lblStatsDexterity.position.y += 50
        lblStatsStamina.position.y += 50
        lblStatsMagic.position.y += 50
        lblStatsStrengthValue.position.y += 50
        lblStatsDexterityValue.position.y += 50
        lblStatsStaminaValue.position.y += 50
        lblStatsMagicValue.position.y += 50
        lblPlayerLevel.position.y += 50
        lblPlayerHP.position.y += 50
        lblPlayerMana.position.y += 50
        lblPlayerDMG.position.y += 50
        lblPlayerARM.position.y += 50
        PlayerStatsWindow.position.y += 50
        lblPointsToSpend.position.y += 50
        // SKILLS WINDOW
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
        spell4Button.position.y -= 50
        spell3Button.position.y -= 50
        spell2Button.position.y -= 50
        spell1Button.position.y -= 50
        
        ManaContainer.position.y -= 50
        ExpContainer.position.y -= 50
        HealthContainer.position.y -= 50
        ExpJUICE.position.y -= 50
        ManaJUICE.position.y -= 50
        HealthJUICE.position.y -= 50
        
        // SKILLS WINDOW
        btnStrength.position.y -= 50
        btnDexterity.position.y -= 50
        btnStamina.position.y -= 50
        btnMagic.position.y -= 50
        btnCloseStats.position.y -= 50
        lblStatsStrength.position.y -= 50
        lblStatsDexterity.position.y -= 50
        lblStatsStamina.position.y -= 50
        lblStatsMagic.position.y -= 50
        lblStatsStrengthValue.position.y -= 50
        lblStatsDexterityValue.position.y -= 50
        lblStatsStaminaValue.position.y -= 50
        lblStatsMagicValue.position.y -= 50
        lblPlayerLevel.position.y -= 50
        lblPlayerHP.position.y -= 50
        lblPlayerMana.position.y -= 50
        lblPlayerDMG.position.y -= 50
        lblPlayerARM.position.y -= 50
        PlayerStatsWindow.position.y -= 50
        lblPointsToSpend.position.y -= 50
        // SKILLS WINDOW
    }
    
    func updateXP(unit: AbstractUnit) {
        let didLevelUp = heroStat?.addExperience(unit)
        updateLevelValues()
        
        if didLevelUp == true {
            ralleyButton.hidden = false
        }
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