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
    
    var GameSceneRef: GameScene
    
    var inventoryButton = AttackButton(imageNamed: "btn-attack-idle")
    var attackButton = AttackButton(imageNamed: "btn-attack-idle")
    var ralleyButton = AttackButton(imageNamed: "btn-levelUp-idle")
    
    var spell1Button = AttackButton(imageNamed: "btn-ralley-idle")
    var spell2Button = AttackButton(imageNamed: "btn-frozenOrb-idle")
    var spell3Button = AttackButton(imageNamed: "btn-explosion-idle")
    var spell4Button = AttackButton(imageNamed: "btn-blizzard-idle")
    
    // HEALTH, MANA & EXP BARS:
    var HealthJUICE = SKSpriteNode(imageNamed: "healthBar")
    var ManaJUICE = SKSpriteNode(imageNamed: "manaBar")
    var ExpJUICE = SKSpriteNode(imageNamed: "expBar")
    var HealthContainer = SKSpriteNode(imageNamed: "barcontainer")
    var ManaContainer = SKSpriteNode(imageNamed: "barcontainer")
    var ExpContainer = SKSpriteNode(imageNamed: "barcontainer")
    var HealthContainer2 = SKSpriteNode(imageNamed: "barcontainer")
    var ManaContainer2 = SKSpriteNode(imageNamed: "barcontainer")
    var ExpContainer2 = SKSpriteNode(imageNamed: "barcontainer")
    
    var joyStick: Joystick = Joystick()
    
    var panelView: SKSpriteNode = SKSpriteNode(imageNamed: "SearchRadiusDummyV")
    var labelUnitName = SKLabelNode(fontNamed:"Copperplate")
    var labelArmor = SKLabelNode(fontNamed:"Copperplate")
    var labelDamage = SKLabelNode(fontNamed:"Copperplate")
    var labelSight = SKLabelNode(fontNamed:"Copperplate")
    var labelSpeed = SKLabelNode(fontNamed:"Copperplate")
    
    var guiTimer: Timer?
    var focusedUnit: AbstractUnit?
    
    var PlayerStatsWindow = SKSpriteNode(imageNamed: "stonePanelWindow")
    
    var lblPlayerLevel = SKLabelNode(fontNamed:"Copperplate")
    var lblPointsToSpend = SKLabelNode(fontNamed:"Copperplate")
    
    var lblPlayerHP = SKLabelNode(fontNamed:"Copperplate")
    var lblPlayerMana = SKLabelNode(fontNamed:"Copperplate")
    var lblPlayerDMG = SKLabelNode(fontNamed:"Copperplate")
    var lblPlayerARM = SKLabelNode(fontNamed:"Copperplate")

    
    var lblStatsStrength = SKLabelNode(fontNamed:"Copperplate")
    var lblStatsDexterity = SKLabelNode(fontNamed:"Copperplate")
    var lblStatsStamina = SKLabelNode(fontNamed:"Copperplate")
    var lblStatsMagic = SKLabelNode(fontNamed:"Copperplate")
    var lblStatsStrengthValue = SKLabelNode(fontNamed:"Copperplate")
    var lblStatsDexterityValue = SKLabelNode(fontNamed:"Copperplate")
    var lblStatsStaminaValue = SKLabelNode(fontNamed:"Copperplate")
    var lblStatsMagicValue = SKLabelNode(fontNamed:"Copperplate")
    
    var btnStrength = AttackButton(imageNamed: "btn-levelUp-idle")
    var btnDexterity = AttackButton(imageNamed: "btn-levelUp-idle")
    var btnStamina = AttackButton(imageNamed: "btn-levelUp-idle")
    var btnMagic = AttackButton(imageNamed: "btn-levelUp-idle")
    var btnCloseStats = AttackButton(imageNamed: "btn-stone-idle")
    
    var heroStat: HeroStat?
    
//    override init() {
//        super.init()
//    }
    
    // useless
    func castMissileAttack() {
        self.GameSceneRef.executeCohortFormationSequence()
    }
    
    func castSpell1() {
        self.GameSceneRef.executeCohortFormationSequence()
    }
    func castSpell2() {
        self.GameSceneRef.fireFrozenOrbPlayerHelper()
    }
    func castSpell3() {
        self.GameSceneRef.fireMissileBombPlayerHelper()
    }
    func castSpell4() {
        self.GameSceneRef.playerCastBlizzardHelper()
    }
    
    func hideStatsWindow() {
        PlayerStatsWindow.isHidden = true
        
        btnStrength.isHidden = true
        btnDexterity.isHidden = true
        btnStamina.isHidden = true
        btnMagic.isHidden = true
        btnCloseStats.isHidden = true
        
        lblStatsStrength.isHidden = true
        lblStatsDexterity.isHidden = true
        lblStatsStamina.isHidden = true
        lblStatsMagic.isHidden = true
        
        lblStatsStrengthValue.isHidden = true
        lblStatsDexterityValue.isHidden = true
        lblStatsStaminaValue.isHidden = true
        lblStatsMagicValue.isHidden = true
        
        lblPlayerLevel.isHidden = true
        lblPlayerHP.isHidden = true
        lblPlayerMana.isHidden = true
        lblPlayerDMG.isHidden = true
        lblPlayerARM.isHidden = true
        lblPointsToSpend.isHidden = true
    }
    
    func showStatsWindow() {
        PlayerStatsWindow.isHidden = false
        
        btnStrength.isHidden = false
        btnDexterity.isHidden = false
        btnStamina.isHidden = false
        btnMagic.isHidden = false
        btnCloseStats.isHidden = false
        
        lblStatsStrength.isHidden = false
        lblStatsDexterity.isHidden = false
        lblStatsStamina.isHidden = false
        lblStatsMagic.isHidden = false
        
        lblStatsStrengthValue.isHidden = false
        lblStatsDexterityValue.isHidden = false
        lblStatsStaminaValue.isHidden = false
        lblStatsMagicValue.isHidden = false
        
        lblPlayerLevel.isHidden = false
        lblPlayerHP.isHidden = false
        lblPlayerMana.isHidden = false
        lblPlayerDMG.isHidden = false
        lblPlayerARM.isHidden = false
        lblPointsToSpend.isHidden = false
    }
    
    init(gameScene: GameScene, playerUnit: AbstractUnit) {
        self.GameSceneRef = gameScene
        self.heroStat = HeroStat(unit: playerUnit)
        
        labelUnitName.position = CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.94))
        labelUnitName.text = "Footman"
        labelUnitName.zPosition = 2001
        labelUnitName.fontSize = 28
        
        labelArmor.position = CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.86))
        labelArmor.text = "Armor: 0"
        labelArmor.zPosition = 2001
        labelArmor.fontSize = 28
        
        labelDamage.position = CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.81))
        labelDamage.text = "Damage: 1"
        labelDamage.zPosition = 2001
        labelDamage.fontSize = 28
        
        labelSight.position = CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.76))
        labelSight.text = "Sight: 5"
        labelSight.zPosition = 2001
        labelSight.fontSize = 28
        
        labelSpeed.position = CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.71))
        labelSpeed.text = "Speed: 4"
        labelSpeed.zPosition = 2001
        labelSpeed.fontSize = 28
        
        self.panelView.xScale = 5.0
        self.panelView.yScale = 12.0
        self.panelView.position = CGPoint(x: (gameScene.size.width * 0.91), y: (gameScene.size.height * 0.70))
        self.panelView.zPosition = 2000
        
        self.attackButton.xScale = 0.45
        self.attackButton.yScale = 0.45
        self.attackButton.position = CGPoint(x: (gameScene.size.width * 0.95), y: 90)
        self.attackButton.zPosition = 2000
        self.attackButton.nameCustom = "attack"
        
        //self.ralleyButton.xScale = 0.65
        //self.ralleyButton.yScale = 0.65
        //self.ralleyButton.position = CGPointMake((gameScene.size.width * 0.77), 150)
        //self.ralleyButton.zPosition = 2000
        //self.ralleyButton.nameCustom = "lvlUp"
        
        self.spell1Button.xScale = 0.45
        self.spell1Button.yScale = 0.45
        self.spell1Button.position = CGPoint(x: (gameScene.size.width * 0.59), y: 90) /// 0.55  / no 4 / no 15
        self.spell1Button.zPosition = 2000
        self.spell1Button.nameCustom = "spell1"
        
        self.spell2Button.xScale = 0.45
        self.spell2Button.yScale = 0.45
        self.spell2Button.position = CGPoint(x: (gameScene.size.width * 0.68), y: 90)
        self.spell2Button.zPosition = 2000
        self.spell2Button.nameCustom = "spell2"
        
        self.spell3Button.xScale = 0.45
        self.spell3Button.yScale = 0.45
        self.spell3Button.position = CGPoint(x: (gameScene.size.width * 0.77), y: 90)
        self.spell3Button.zPosition = 2000
        self.spell3Button.nameCustom = "spell3"
        
        self.spell4Button.xScale = 0.45
        self.spell4Button.yScale = 0.45
        self.spell4Button.position = CGPoint(x: (gameScene.size.width * 0.86), y: 90)
        self.spell4Button.zPosition = 2000
        self.spell4Button.nameCustom = "spell4"
        
        self.ralleyButton.xScale = 0.30
        self.ralleyButton.yScale = 0.30
        self.ralleyButton.position = CGPoint(x: (gameScene.size.width * 0.5), y: 200)
        self.ralleyButton.zPosition = 2000
        self.ralleyButton.nameCustom = "lvlUp"
        
        self.joyStick.position = CGPoint(x: 200, y: 200)
        self.joyStick.zPosition = 2000
        
        
        
        lblStatsStrength.position = CGPoint(x: (gameScene.size.width * 0.3), y: (gameScene.size.height * 0.25))
        lblStatsStrength.text = "Strength"
        lblStatsStrength.zPosition = 2501
        lblStatsStrength.fontSize = 42
        
        lblStatsDexterity.position = CGPoint(x: (gameScene.size.width * 0.3), y: (gameScene.size.height * 0.4))
        lblStatsDexterity.text = "Dexterity"
        lblStatsDexterity.zPosition = 2501
        lblStatsDexterity.fontSize = 42
        
        lblStatsStamina.position = CGPoint(x: (gameScene.size.width * 0.3), y: (gameScene.size.height * 0.55))
        lblStatsStamina.text = "Stamina"
        lblStatsStamina.zPosition = 2501
        lblStatsStamina.fontSize = 42
        
        lblStatsMagic.position = CGPoint(x: (gameScene.size.width * 0.3), y: (gameScene.size.height * 0.7))
        lblStatsMagic.text = "Magic"
        lblStatsMagic.zPosition = 2501
        lblStatsMagic.fontSize = 42
        
        
        lblStatsStrengthValue.position = CGPoint(x: (gameScene.size.width * 0.40), y: (gameScene.size.height * 0.25))
        lblStatsStrengthValue.text = String(heroStat!.Strength)
        lblStatsStrengthValue.zPosition = 2501
        lblStatsStrengthValue.fontSize = 42
        
        lblStatsDexterityValue.position = CGPoint(x: (gameScene.size.width * 0.40), y: (gameScene.size.height * 0.4))
        lblStatsDexterityValue.text = String(heroStat!.Dexterity)
        lblStatsDexterityValue.zPosition = 2501
        lblStatsDexterityValue.fontSize = 42
        
        lblStatsStaminaValue.position = CGPoint(x: (gameScene.size.width * 0.40), y: (gameScene.size.height * 0.55))
        lblStatsStaminaValue.text = String(heroStat!.Stamina)
        lblStatsStaminaValue.zPosition = 2501
        lblStatsStaminaValue.fontSize = 42
        
        lblStatsMagicValue.position = CGPoint(x: (gameScene.size.width * 0.40), y: (gameScene.size.height * 0.7))
        lblStatsMagicValue.text = String(heroStat!.Magic)
        lblStatsMagicValue.zPosition = 2501
        lblStatsMagicValue.fontSize = 42
        
        
        lblPlayerLevel.position = CGPoint(x: (gameScene.size.width * 0.30), y: (gameScene.size.height * 0.8))
        lblPlayerLevel.text = "Level \(heroStat!.Level)"
        lblPlayerLevel.zPosition = 2501
        lblPlayerLevel.fontSize = 42
        lblPlayerHP.position = CGPoint(x: (gameScene.size.width * 0.65), y: (gameScene.size.height * 0.7))
        lblPlayerHP.text = "Life: \(gameScene.playerSK.HP)/\(gameScene.playerSK.HP_MAX)"
        lblPlayerHP.zPosition = 2501
        lblPlayerHP.fontSize = 42
        lblPlayerMana.position = CGPoint(x: (gameScene.size.width * 0.65), y: (gameScene.size.height * 0.6))
        lblPlayerMana.text = "Mana: \(gameScene.playerSK.MANA)/\(gameScene.playerSK.MANA_MAX)"
        lblPlayerMana.zPosition = 2501
        lblPlayerMana.fontSize = 42
        lblPlayerDMG.position = CGPoint(x: (gameScene.size.width * 0.65), y: (gameScene.size.height * 0.5))
        lblPlayerDMG.text = "Damage: \(gameScene.playerSK.DMG)"
        lblPlayerDMG.zPosition = 2501
        lblPlayerDMG.fontSize = 42
        lblPlayerARM.position = CGPoint(x: (gameScene.size.width * 0.65), y: (gameScene.size.height * 0.4))
        lblPlayerARM.text = "Armor: \(gameScene.playerSK.Armor)"
        lblPlayerARM.zPosition = 2501
        lblPlayerARM.fontSize = 42

        lblPointsToSpend.position = CGPoint(x: (gameScene.size.width * 0.50), y: (gameScene.size.height * 0.8))
        lblPointsToSpend.text = "Points To Spend: \(heroStat!.SpendPoints)"
        lblPointsToSpend.zPosition = 2501
        lblPointsToSpend.fontSize = 42
        
        
        self.PlayerStatsWindow.xScale = 0.43
        self.PlayerStatsWindow.yScale = 0.43
        self.PlayerStatsWindow.position = CGPoint(x: (gameScene.size.width * 0.50), y: (gameScene.size.height * 0.54))
        self.PlayerStatsWindow.zPosition = 2500
        
        self.btnStrength.xScale = 0.35
        self.btnStrength.yScale = 0.35
        self.btnStrength.position = CGPoint(x: (gameScene.size.width * 0.5), y: (gameScene.size.height * 0.25))
        self.btnStrength.zPosition = 2501
        self.btnStrength.nameCustom = "strength"
        
        self.btnDexterity.xScale = 0.35
        self.btnDexterity.yScale = 0.35
        self.btnDexterity.position = CGPoint(x: (gameScene.size.width * 0.5), y: (gameScene.size.height * 0.4))
        self.btnDexterity.zPosition = 2501
        self.btnDexterity.nameCustom = "dexterity"
        
        self.btnStamina.xScale = 0.35
        self.btnStamina.yScale = 0.35
        self.btnStamina.position = CGPoint(x: (gameScene.size.width * 0.5), y: (gameScene.size.height * 0.55))
        self.btnStamina.zPosition = 2501
        self.btnStamina.nameCustom = "stamina"
        
        self.btnMagic.xScale = 0.35
        self.btnMagic.yScale = 0.35
        self.btnMagic.position = CGPoint(x: (gameScene.size.width * 0.5), y: (gameScene.size.height * 0.7))
        self.btnMagic.zPosition = 2501
        self.btnMagic.nameCustom = "magic"
        
        self.btnCloseStats.xScale = 0.35
        self.btnCloseStats.yScale = 0.35
        self.btnCloseStats.position = CGPoint(x: (gameScene.size.width * 0.75), y: (gameScene.size.height * 0.8))
        self.btnCloseStats.zPosition = 2501
        self.btnCloseStats.nameCustom = "exitstats"
        

        
        
        HealthJUICE.xScale = 3
        HealthJUICE.yScale = 0.5
        HealthJUICE.position = CGPoint(x: 500, y: 50)
        HealthJUICE.zPosition = 2001
        
        ManaJUICE.xScale = 3
        ManaJUICE.yScale = 0.5
        ManaJUICE.position = CGPoint(x: 500, y: 100)
        ManaJUICE.zPosition = 2001
        
        ExpJUICE.xScale = 3
        ExpJUICE.yScale = 0.5
        ExpJUICE.position = CGPoint(x: 500, y: 150)
        ExpJUICE.zPosition = 2001
        
        HealthContainer.xScale = 3.1
        HealthContainer.yScale = 0.51
        HealthContainer.position = CGPoint(x: 499.2, y: 50)
        HealthContainer.zPosition = 2000
        
        ManaContainer.xScale = 3.1
        ManaContainer.yScale = 0.51
        ManaContainer.position = CGPoint(x: 499.1, y: 100)
        ManaContainer.zPosition = 2000
        
        ExpContainer.xScale = 3.1
        ExpContainer.yScale = 0.51
        ExpContainer.position = CGPoint(x: 499.01, y: 150)
        ExpContainer.zPosition = 2000
        
        HealthContainer2.xScale = 1.6
        HealthContainer2.yScale = 0.51
        HealthContainer2.position = CGPoint(x: 460, y: 50)
        HealthContainer2.zPosition = 2002
        
        ManaContainer2.xScale = 1.6
        ManaContainer2.yScale = 0.51
        ManaContainer2.position = CGPoint(x: 460, y: 100)
        ManaContainer2.zPosition = 2002
        
        ExpContainer2.xScale = 1.6
        ExpContainer2.yScale = 0.51
        ExpContainer2.position = CGPoint(x: 460, y: 150)
        ExpContainer2.zPosition = 2002

        
        self.GameSceneRef.addChild(HealthJUICE)
        self.GameSceneRef.addChild(ManaJUICE)
        self.GameSceneRef.addChild(ExpJUICE)
        self.GameSceneRef.addChild(HealthContainer)
        self.GameSceneRef.addChild(ManaContainer)
        self.GameSceneRef.addChild(ExpContainer)
        self.GameSceneRef.addChild(HealthContainer2)
        self.GameSceneRef.addChild(ManaContainer2)
        self.GameSceneRef.addChild(ExpContainer2)
        
//        self.GameSceneRef.addChild(self.panelView)
        self.GameSceneRef.addChild(self.attackButton)
        self.GameSceneRef.addChild(self.ralleyButton)
        self.GameSceneRef.addChild(self.spell1Button)
        self.GameSceneRef.addChild(self.PlayerStatsWindow)
        self.GameSceneRef.addChild(lblPointsToSpend)
        self.GameSceneRef.addChild(self.spell2Button)
        self.GameSceneRef.addChild(self.spell3Button)
        self.GameSceneRef.addChild(self.spell4Button)
        
        self.GameSceneRef.addChild(self.joyStick)
//        self.GameSceneRef.addChild(self.labelUnitName)
//        self.GameSceneRef.addChild(self.labelArmor)
//        self.GameSceneRef.addChild(self.labelDamage)
//        self.GameSceneRef.addChild(self.labelSight)
//        self.GameSceneRef.addChild(self.labelSpeed)
        
        self.GameSceneRef.addChild(btnStrength)
        self.GameSceneRef.addChild(btnDexterity)
        self.GameSceneRef.addChild(btnStamina)
        self.GameSceneRef.addChild(btnMagic)
        self.GameSceneRef.addChild(btnCloseStats)
        
        self.GameSceneRef.addChild(lblStatsStrength)
        self.GameSceneRef.addChild(lblStatsDexterity)
        self.GameSceneRef.addChild(lblStatsStamina)
        self.GameSceneRef.addChild(lblStatsMagic)
        
        self.GameSceneRef.addChild(lblStatsStrengthValue)
        self.GameSceneRef.addChild(lblStatsDexterityValue)
        self.GameSceneRef.addChild(lblStatsStaminaValue)
        self.GameSceneRef.addChild(lblStatsMagicValue)
        
        self.GameSceneRef.addChild(lblPlayerLevel)
        self.GameSceneRef.addChild(lblPlayerHP)
        self.GameSceneRef.addChild(lblPlayerMana)
        self.GameSceneRef.addChild(lblPlayerDMG)
        self.GameSceneRef.addChild(lblPlayerARM)
        
        
    }
    
    func toggleHidePointsToSpend() {
        
    }
    
    func updateLevelValues() {
        let experience = CGFloat((self.heroStat!.XP)) / CGFloat((self.heroStat?.XP_MAX)!)
        self.updateResourceBar(experience, resourceType: .exp)
        
        let maxHP = self.GameSceneRef.playerSK.HP_MAX
        let maxMana = self.GameSceneRef.playerSK.MANA_MAX
        let armor = self.GameSceneRef.playerSK.Armor_MAX
        let dmg = self.GameSceneRef.playerSK.DMG_MAX
        
        self.GameSceneRef.playerSK.HP_MAX = maxHP + (heroStat?.BonusHP)!
        self.GameSceneRef.playerSK.MANA_MAX = maxMana + (heroStat?.BonusMagic)!
        self.GameSceneRef.playerSK.Armor = armor + (heroStat?.BonusARM)!
        self.GameSceneRef.playerSK.DMG = dmg + (heroStat?.BonusDMG)!
        
        lblStatsStrengthValue.text = String(heroStat!.Strength)
        lblStatsDexterityValue.text = String(heroStat!.Dexterity)
        lblStatsStaminaValue.text = String(heroStat!.Stamina)
        lblStatsMagicValue.text = String(heroStat!.Magic)
        lblPlayerLevel.text = "Level \(heroStat!.Level)"
        lblPlayerHP.text = "Life: \(GameSceneRef.playerSK.HP)/\(GameSceneRef.playerSK.HP_MAX)"
        lblPlayerMana.text = "Mana: \(GameSceneRef.playerSK.MANA)/\(GameSceneRef.playerSK.MANA_MAX)"
        lblPlayerDMG.text = "Damage: \(GameSceneRef.playerSK.DMG)"
        lblPlayerARM.text = "Armor: \(GameSceneRef.playerSK.Armor)"
        lblPointsToSpend.text = "Points To Spend: \(heroStat!.SpendPoints)"
        
    }
    
    func activateFromViewController() {
        guiTimer = Timer.scheduledTimer(timeInterval: 0.1,
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
        
        if let stat = heroStat {
            if stat.SpendPoints <= 0 {
                ralleyButton.isHidden = false
            }
        }
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
//        self.GameSceneRef.playerDidTouchNewRallyForcesButton()
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
        ManaContainer2.position.x += 50
        ExpContainer2.position.x += 50
        HealthContainer2.position.x += 50
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
//        self.GameSceneRef.playerDidTouchNewRallyForcesButton()
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
        
        ManaContainer2.position.x -= 50
        ExpContainer2.position.x -= 50
        HealthContainer2.position.x -= 50
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
//        self.GameSceneRef.playerDidTouchNewRallyForcesButton()
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
        
        ManaContainer2.position.y += 50
        ExpContainer2.position.y += 50
        HealthContainer2.position.y += 50
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
//        self.GameSceneRef.playerDidTouchNewRallyForcesButton()
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
        
        ManaContainer2.position.y -= 50
        ExpContainer2.position.y -= 50
        HealthContainer2.position.y -= 50
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
    
    func updateXP(_ unit: AbstractUnit) {
        let didLevelUp = heroStat?.addExperience(unit)
        updateLevelValues()
        
        if didLevelUp == true {
            ralleyButton.isHidden = false
        }
    }
    
    func orderPlayerToAttack() {
        self.GameSceneRef.playerDidTouchNewAttackButton()
    }
    
    func orderPlayerToRalleyForces() {
        self.GameSceneRef.playerDidTouchNewRallyForcesButton()
    }
    
    func updateResourceBar(_ percentLeft: CGFloat, resourceType: ResourceBar) {
        let totalValue = percentLeft * 3
        
        if resourceType == .hp {
            HealthJUICE.xScale = totalValue
        }
        else if resourceType == .mana {
            ManaJUICE.xScale = totalValue
        }
        else if resourceType == .exp {
            ExpJUICE.xScale = totalValue
        }
    }
    
    enum ResourceBar {
        case mana, hp, exp
    }
}
