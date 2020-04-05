//
//  UIPlayerControlPanel.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/4/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

let Z_POSITION_PLAYER_STATS_CONTROLS: CGFloat! = 2501
let FONT_SIZE: CGFloat! = 32

let DEVICE = UIScreen.main.nativeBounds
let LABEL_UNIT_NAME: CGPoint! = CGPoint(x: (DEVICE.width * 0.9), y: (DEVICE.height * 0.94))
let LABEL_ARMOR: CGPoint! = CGPoint(x: (DEVICE.width * 0.9), y: (DEVICE.height * 0.86))
let LABEL_DAMAGE: CGPoint! = CGPoint(x: (DEVICE.width * 0.9), y: (DEVICE.height * 0.81))
let LABEL_SIGHT: CGPoint! = CGPoint(x: (DEVICE.width * 0.9), y: (DEVICE.height * 0.76))
let LABEL_SPEED: CGPoint! = CGPoint(x: (DEVICE.width * 0.9), y: (DEVICE.height * 0.71))
let PANEL_VIEW: CGPoint! = CGPoint(x: (DEVICE.width * 0.91), y: (DEVICE.height * 0.70))
let ATTACK_BUTTON: CGPoint! = CGPoint(x: (DEVICE.width * 0.92), y: 90)
let SPELL_1: CGPoint! = CGPoint(x: (DEVICE.width * 0.56), y: 90)
let SPELL_2: CGPoint! = CGPoint(x: (DEVICE.width * 0.65), y: 90)
let SPELL_3: CGPoint! = CGPoint(x: (DEVICE.width * 0.74), y: 90)
let SPELL_4: CGPoint! = CGPoint(x: (DEVICE.width * 0.83), y: 90)
let RALLEY_BUTTON: CGPoint! = CGPoint(x: (DEVICE.width * 0.5), y: 200)
let JOY_STICK: CGPoint! = CGPoint(x: (DEVICE.width * 0.07), y: (DEVICE.height * 0.07))
let STATS_STRENGTH: CGPoint! = CGPoint(x: (DEVICE.width * 0.3), y: (DEVICE.height * 0.25))
let STATS_DEXTERITY: CGPoint! = CGPoint(x: (DEVICE.width * 0.3), y: (DEVICE.height * 0.4))
let STATS_STAMINA: CGPoint! = CGPoint(x: (DEVICE.width * 0.3), y: (DEVICE.height * 0.55))
let STATS_MAGIC: CGPoint! = CGPoint(x: (DEVICE.width * 0.3), y: (DEVICE.height * 0.7))
let STATS_STRENGTH_VAL: CGPoint! = CGPoint(x: (DEVICE.width * 0.40), y: (DEVICE.height * 0.25))
let STATS_DEXTERITY_VAL: CGPoint! = CGPoint(x: (DEVICE.width * 0.40), y: (DEVICE.height * 0.4))
let STATS_STAMINA_VAL: CGPoint! = CGPoint(x: (DEVICE.width * 0.40), y: (DEVICE.height * 0.55))
let STATS_MAGIC_VAL: CGPoint! = CGPoint(x: (DEVICE.width * 0.40), y: (DEVICE.height * 0.7))
let PLAYER_LEVEL: CGPoint! = CGPoint(x: (DEVICE.width * 0.30), y: (DEVICE.height * 0.8))
let PLAYER_HP: CGPoint! = CGPoint(x: (DEVICE.width * 0.65), y: (DEVICE.height * 0.7))
let PLAYER_MANA: CGPoint! = CGPoint(x: (DEVICE.width * 0.65), y: (DEVICE.height * 0.6))
let PLAYER_DMG: CGPoint! = CGPoint(x: (DEVICE.width * 0.65), y: (DEVICE.height * 0.5))
let PLAYER_ARM: CGPoint! = CGPoint(x: (DEVICE.width * 0.65), y: (DEVICE.height * 0.4))
let POINTS_TO_SPEND: CGPoint! = CGPoint(x: (DEVICE.width * 0.50), y: (DEVICE.height * 0.8))
let PLAYER_STATS: CGPoint! = CGPoint(x: (DEVICE.width * 0.50), y: (DEVICE.height * 0.54))
let BTN_STRENGTH: CGPoint! = CGPoint(x: (DEVICE.width * 0.5), y: (DEVICE.height * 0.25))
let BTN_DEXTERITY: CGPoint! = CGPoint(x: (DEVICE.width * 0.5), y: (DEVICE.height * 0.4))
let BTN_STAMINA: CGPoint! = CGPoint(x: (DEVICE.width * 0.5), y: (DEVICE.height * 0.55))
let BTN_MAGIC: CGPoint! = CGPoint(x: (DEVICE.width * 0.5), y: (DEVICE.height * 0.7))
let BTN_CLOSE_STATS: CGPoint! = CGPoint(x: (DEVICE.width * 0.75), y: (DEVICE.height * 0.8))
let HEALTH_JUICE: CGPoint! = CGPoint(x: (DEVICE.width * 0.30), y: 50) // CGPoint(x: 500, y: 50)
let MANA_JUICE: CGPoint! = CGPoint(x: (DEVICE.width * 0.30), y: 100) //CGPoint(x: 500, y: 100)
let EXP_JUICE: CGPoint! = CGPoint(x: (DEVICE.width * 0.30), y: 150) //CGPoint(x: 500, y: 150)
let HP_CONTAINER: CGPoint! = CGPoint(x: (DEVICE.width * 0.30), y: 50) //CGPoint(x: 499.2, y: 50)
let MANA_CONTAINER: CGPoint! = CGPoint(x: (DEVICE.width * 0.30), y: 100) //CGPoint(x: 499.1, y: 100)
let EXP_CONTAINER: CGPoint! = CGPoint(x: (DEVICE.width * 0.30), y: 150) //CGPoint(x: 499.01, y: 150)
let HP_CONTAINER_2: CGPoint! = CGPoint(x: (DEVICE.width * 0.26), y: 50) //CGPoint(x: 460, y: 50)
let MANA_CONTAINER_2: CGPoint! = CGPoint(x: (DEVICE.width * 0.26), y: 100) //CGPoint(x: 460, y: 100)
let EXP_CONTAINER_2: CGPoint! = CGPoint(x: (DEVICE.width * 0.26), y: 150) //CGPoint(x: 460, y: 150)

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
//        self.GameSceneRef.executeCohortFormationSequence()
    }
    
    func castSpell1() {
        print("BUTTON IS IN DEBUG MODE!!!")
//        self.GameSceneRef.autoCompletePlainGrassNodes() //MAP EDITOR
//        self.GameSceneRef.executeCohortFormationSequence()
        self.GameSceneRef.heroDidCastSpell1()
    }
    func castSpell2() {
//        self.GameSceneRef.fireFrozenOrbPlayerHelper()
//        self.GameSceneRef.resetMapEditor() //MAP EDITOR
//        self.GameSceneRef.sendTestDebugPingToSocket()
        self.GameSceneRef.heroDidCastSpell2()
    }
    func castSpell3() {
//        self.GameSceneRef.DIRT_BRUSH_ENABLED = !self.GameSceneRef.DIRT_BRUSH_ENABLED //MAP EDITOR
//        self.GameSceneRef.fireMissileBombPlayerHelper()
//        self.GameSceneRef.hostMultiplayerGame()
        self.GameSceneRef.presentUnitDebuggerDialog()
        self.GameSceneRef.heroDidCastSpell3()
    }
    func castSpell4() {
//        self.GameSceneRef.autoCorrectGrassCornerNodes() //MAP EDITOR
//        self.GameSceneRef.playerCastBlizzardHelper()
//        self.GameSceneRef.joinMultiplayerGame()
//        self.GameSceneRef.heroDidCastSpell4()
        self.GameSceneRef.rightClickEnabled = !self.GameSceneRef.rightClickEnabled
        print(self.GameSceneRef.rightClickEnabled)
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
        
        labelUnitName.position = LABEL_UNIT_NAME
        labelUnitName.text = "Footman"
        labelUnitName.zPosition = 2001
        labelUnitName.fontSize = 28
        
        labelArmor.position = LABEL_ARMOR// CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.86))
        labelArmor.text = "Armor: 0"
        labelArmor.zPosition = 2001
        labelArmor.fontSize = 28
        
        labelDamage.position = LABEL_DAMAGE //= CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.81))
        labelDamage.text = "Damage: 1"
        labelDamage.zPosition = 2001
        labelDamage.fontSize = 28
        
        labelSight.position = LABEL_SIGHT //= CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.76))
        labelSight.text = "Sight: 5"
        labelSight.zPosition = 2001
        labelSight.fontSize = 28
        
        labelSpeed.position = LABEL_SPEED // = CGPoint(x: (gameScene.size.width * 0.9), y: (gameScene.size.height * 0.71))
        labelSpeed.text = "Speed: 4"
        labelSpeed.zPosition = 2001
        labelSpeed.fontSize = 28
        
        self.panelView.xScale = 5.0
        self.panelView.yScale = 12.0
        self.panelView.position = PANEL_VIEW //= CGPoint(x: (gameScene.size.width * 0.91), y: (gameScene.size.height * 0.70))
        self.panelView.zPosition = 2000
        
        self.attackButton.xScale = 0.30
        self.attackButton.yScale = 0.30
        self.attackButton.position = ATTACK_BUTTON //= CGPoint(x: (gameScene.size.width * 0.95), y: 90)
        self.attackButton.zPosition = 2000
        self.attackButton.nameCustom = "attack"
        
        //self.ralleyButton.xScale = 0.65
        //self.ralleyButton.yScale = 0.65
        //self.ralleyButton.position = CGPointMake((gameScene.size.width * 0.77), 150)
        //self.ralleyButton.zPosition = 2000
        //self.ralleyButton.nameCustom = "lvlUp"
        
        self.spell1Button.xScale = 0.30
        self.spell1Button.yScale = 0.30
        self.spell1Button.position = SPELL_1 //= CGPoint(x: (gameScene.size.width * 0.59), y: 90) /// 0.55  / no 4 / no 15
        self.spell1Button.zPosition = 2000
        self.spell1Button.nameCustom = "spell1"
        
        self.spell2Button.xScale = 0.30
        self.spell2Button.yScale = 0.30
        self.spell2Button.position = SPELL_2 //= CGPoint(x: (gameScene.size.width * 0.68), y: 90)
        self.spell2Button.zPosition = 2000
        self.spell2Button.nameCustom = "spell2"
        
        self.spell3Button.xScale = 0.30
        self.spell3Button.yScale = 0.30
        self.spell3Button.position = SPELL_3 //= CGPoint(x: (gameScene.size.width * 0.77), y: 90)
        self.spell3Button.zPosition = 2000
        self.spell3Button.nameCustom = "spell3"
        
        self.spell4Button.xScale = 0.30
        self.spell4Button.yScale = 0.30
        self.spell4Button.position = SPELL_4 //= CGPoint(x: (gameScene.size.width * 0.86), y: 90)
        self.spell4Button.zPosition = 2000
        self.spell4Button.nameCustom = "spell4"
        
        self.ralleyButton.xScale = 0.20
        self.ralleyButton.yScale = 0.20
        self.ralleyButton.position = RALLEY_BUTTON //= CGPoint(x: (gameScene.size.width * 0.5), y: 200)
        self.ralleyButton.zPosition = 2000
        self.ralleyButton.nameCustom = "lvlUp"
        
        self.joyStick.position = JOY_STICK //= CGPoint(x: 150, y: 150)
        self.joyStick.zPosition = 2000
        
        
        
        lblStatsStrength.position = STATS_STRENGTH  //= CGPoint(x: (gameScene.size.width * 0.3), y: (gameScene.size.height * 0.25))
        lblStatsStrength.text = "Strength"
        lblStatsStrength.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblStatsStrength.fontSize = FONT_SIZE
        
        lblStatsDexterity.position = STATS_DEXTERITY //= CGPoint(x: (gameScene.size.width * 0.3), y: (gameScene.size.height * 0.4))
        lblStatsDexterity.text = "Dexterity"
        lblStatsDexterity.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblStatsDexterity.fontSize = FONT_SIZE
        
        lblStatsStamina.position = STATS_STAMINA //= CGPoint(x: (gameScene.size.width * 0.3), y: (gameScene.size.height * 0.55))
        lblStatsStamina.text = "Stamina"
        lblStatsStamina.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblStatsStamina.fontSize = FONT_SIZE
        
        lblStatsMagic.position = STATS_MAGIC //= CGPoint(x: (gameScene.size.width * 0.3), y: (gameScene.size.height * 0.7))
        lblStatsMagic.text = "Magic"
        lblStatsMagic.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblStatsMagic.fontSize = FONT_SIZE
        
        
        lblStatsStrengthValue.position = STATS_STRENGTH_VAL  //= CGPoint(x: (gameScene.size.width * 0.40), y: (gameScene.size.height * 0.25))
        lblStatsStrengthValue.text = String(heroStat!.Strength)
        lblStatsStrengthValue.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblStatsStrengthValue.fontSize = FONT_SIZE
        
        lblStatsDexterityValue.position = STATS_DEXTERITY_VAL //= CGPoint(x: (gameScene.size.width * 0.40), y: (gameScene.size.height * 0.4))
        lblStatsDexterityValue.text = String(heroStat!.Dexterity)
        lblStatsDexterityValue.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblStatsDexterityValue.fontSize = FONT_SIZE
        
        lblStatsStaminaValue.position = STATS_STAMINA_VAL  //= CGPoint(x: (gameScene.size.width * 0.40), y: (gameScene.size.height * 0.55))
        lblStatsStaminaValue.text = String(heroStat!.Stamina)
        lblStatsStaminaValue.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblStatsStaminaValue.fontSize = FONT_SIZE
        
        lblStatsMagicValue.position = STATS_MAGIC_VAL  //= CGPoint(x: (gameScene.size.width * 0.40), y: (gameScene.size.height * 0.7))
        lblStatsMagicValue.text = String(heroStat!.Magic)
        lblStatsMagicValue.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblStatsMagicValue.fontSize = FONT_SIZE
        
        
        lblPlayerLevel.position = PLAYER_LEVEL  //= CGPoint(x: (gameScene.size.width * 0.30), y: (gameScene.size.height * 0.8))
        lblPlayerLevel.text = "Level \(heroStat!.Level)"
        lblPlayerLevel.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblPlayerLevel.fontSize = FONT_SIZE
        lblPlayerHP.position = PLAYER_HP  //= CGPoint(x: (gameScene.size.width * 0.65), y: (gameScene.size.height * 0.7))
        lblPlayerHP.text = "Life: \(gameScene.playerSK.HP)/\(gameScene.playerSK.HP_MAX)"
        lblPlayerHP.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblPlayerHP.fontSize = FONT_SIZE
        lblPlayerMana.position = PLAYER_MANA  //= CGPoint(x: (gameScene.size.width * 0.65), y: (gameScene.size.height * 0.6))
        lblPlayerMana.text = "Mana: \(gameScene.playerSK.MANA)/\(gameScene.playerSK.MANA_MAX)"
        lblPlayerMana.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblPlayerMana.fontSize = FONT_SIZE
        lblPlayerDMG.position = PLAYER_DMG  //= CGPoint(x: (gameScene.size.width * 0.65), y: (gameScene.size.height * 0.5))
        lblPlayerDMG.text = "Damage: \(gameScene.playerSK.DMG)"
        lblPlayerDMG.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblPlayerDMG.fontSize = FONT_SIZE
        lblPlayerARM.position = PLAYER_ARM  //= CGPoint(x: (gameScene.size.width * 0.65), y: (gameScene.size.height * 0.4))
        lblPlayerARM.text = "Armor: \(gameScene.playerSK.Armor)"
        lblPlayerARM.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblPlayerARM.fontSize = FONT_SIZE

        lblPointsToSpend.position = POINTS_TO_SPEND  //= CGPoint(x: (gameScene.size.width * 0.50), y: (gameScene.size.height * 0.8))
        lblPointsToSpend.text = "Points To Spend: \(heroStat!.SpendPoints)"
        lblPointsToSpend.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        lblPointsToSpend.fontSize = FONT_SIZE
        
        
        self.PlayerStatsWindow.xScale = 0.30
        self.PlayerStatsWindow.yScale = 0.30
        self.PlayerStatsWindow.position = PLAYER_STATS  //= CGPoint(x: (gameScene.size.width * 0.50), y: (gameScene.size.height * 0.54))
        self.PlayerStatsWindow.zPosition = 2500
        
        self.btnStrength.xScale = 0.25
        self.btnStrength.yScale = 0.25
        self.btnStrength.position = BTN_STRENGTH  //= CGPoint(x: (gameScene.size.width * 0.5), y: (gameScene.size.height * 0.25))
        self.btnStrength.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        self.btnStrength.nameCustom = "strength"
        
        self.btnDexterity.xScale = 0.25
        self.btnDexterity.yScale = 0.25
        self.btnDexterity.position = BTN_DEXTERITY //= CGPoint(x: (gameScene.size.width * 0.5), y: (gameScene.size.height * 0.4))
        self.btnDexterity.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        self.btnDexterity.nameCustom = "dexterity"
        
        self.btnStamina.xScale = 0.25
        self.btnStamina.yScale = 0.25
        self.btnStamina.position = BTN_STAMINA ///= CGPoint(x: (gameScene.size.width * 0.5), y: (gameScene.size.height * 0.55))
        self.btnStamina.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        self.btnStamina.nameCustom = "stamina"
        
        self.btnMagic.xScale = 0.25
        self.btnMagic.yScale = 0.25
        self.btnMagic.position = BTN_MAGIC //= CGPoint(x: (gameScene.size.width * 0.5), y: (gameScene.size.height * 0.7))
        self.btnMagic.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        self.btnMagic.nameCustom = "magic"
        
        self.btnCloseStats.xScale = 0.25
        self.btnCloseStats.yScale = 0.25
        self.btnCloseStats.position = BTN_CLOSE_STATS //= CGPoint(x: (gameScene.size.width * 0.75), y: (gameScene.size.height * 0.8))
        self.btnCloseStats.zPosition = Z_POSITION_PLAYER_STATS_CONTROLS
        self.btnCloseStats.nameCustom = "exitstats"
        

        
        
        HealthJUICE.xScale = 3
        HealthJUICE.yScale = 0.5
        HealthJUICE.position = HEALTH_JUICE //CGPoint(x: 500, y: 50)
        HealthJUICE.zPosition = 2001
        
        ManaJUICE.xScale = 3
        ManaJUICE.yScale = 0.5
        ManaJUICE.position = MANA_JUICE //CGPoint(x: 500, y: 100)
        ManaJUICE.zPosition = 2001
        
        ExpJUICE.xScale = 3
        ExpJUICE.yScale = 0.5
        ExpJUICE.position = EXP_JUICE//CGPoint(x: 500, y: 150)
        ExpJUICE.zPosition = 2001
        
        HealthContainer.xScale = 3.1
        HealthContainer.yScale = 0.51
        HealthContainer.position = HP_CONTAINER//CGPoint(x: 499.2, y: 50)
        HealthContainer.zPosition = 2000
        
        ManaContainer.xScale = 3.1
        ManaContainer.yScale = 0.51
        ManaContainer.position = MANA_CONTAINER//CGPoint(x: 499.1, y: 100)
        ManaContainer.zPosition = 2000
        
        ExpContainer.xScale = 3.1
        ExpContainer.yScale = 0.51
        ExpContainer.position = EXP_CONTAINER//CGPoint(x: 499.01, y: 150)
        ExpContainer.zPosition = 2000
        
        HealthContainer2.xScale = 1.6
        HealthContainer2.yScale = 0.51
        HealthContainer2.position = HP_CONTAINER_2///CGPoint(x: 460, y: 50)
        HealthContainer2.zPosition = 2002
        
        ManaContainer2.xScale = 1.6
        ManaContainer2.yScale = 0.51
        ManaContainer2.position = MANA_CONTAINER_2//CGPoint(x: 460, y: 100)
        ManaContainer2.zPosition = 2002
        
        ExpContainer2.xScale = 1.6
        ExpContainer2.yScale = 0.51
        ExpContainer2.position = EXP_CONTAINER_2//CGPoint(x: 460, y: 150)
        ExpContainer2.zPosition = 2002

        /*
        self.GameSceneRef.addChild(HealthJUICE)
//        self.GameSceneRef.addChild(ManaJUICE)
        self.GameSceneRef.addChild(ExpJUICE)
        self.GameSceneRef.addChild(HealthContainer)
        self.GameSceneRef.addChild(ManaContainer)
        self.GameSceneRef.addChild(ExpContainer)
        self.GameSceneRef.addChild(HealthContainer2)
//        self.GameSceneRef.addChild(ManaContainer2)
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
        */


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

        appendAllGUIToSingleArray()
    }
    
    @objc func updateGUIFromTimer() {
        if let unit = focusedUnit {
            self.labelUnitName.text = unit.nameGUI
            self.labelArmor.text = "Armor: \(unit.Armor)"
            self.labelSpeed.text = "HP: \(unit.HP) "
            self.labelDamage.text = "Damage: \(unit.DMG) "
        }
    }
    
    var allGUIComponents = [SKNode]()

    func appendAllGUIToSingleArray() {
        self.allGUIComponents.append(panelView)
        self.allGUIComponents.append(joyStick)
        self.allGUIComponents.append(labelUnitName)
        self.allGUIComponents.append(labelArmor)
        self.allGUIComponents.append(labelDamage)
        self.allGUIComponents.append(labelSight)
        self.allGUIComponents.append(labelSpeed)

        self.allGUIComponents.append(attackButton)
        self.allGUIComponents.append(ralleyButton)
        self.allGUIComponents.append(spell4Button)
        self.allGUIComponents.append(spell3Button)

        self.allGUIComponents.append(spell2Button)
        self.allGUIComponents.append(spell1Button)
        self.allGUIComponents.append(ManaContainer)
        self.allGUIComponents.append(ExpContainer)
        self.allGUIComponents.append(HealthContainer)
        self.allGUIComponents.append(ManaContainer2)
        self.allGUIComponents.append(ExpContainer2)
        self.allGUIComponents.append(HealthContainer2)
        self.allGUIComponents.append(ExpJUICE)
        self.allGUIComponents.append(ManaJUICE)
        self.allGUIComponents.append(HealthJUICE)

        self.allGUIComponents.append(btnStrength)
        self.allGUIComponents.append(btnDexterity)
        self.allGUIComponents.append(btnStamina)
        self.allGUIComponents.append(btnMagic)
        self.allGUIComponents.append(btnCloseStats)
        self.allGUIComponents.append(lblStatsStrength)
        self.allGUIComponents.append(lblStatsDexterity)
        self.allGUIComponents.append(lblStatsStamina)

        self.allGUIComponents.append(lblStatsMagic)
        self.allGUIComponents.append(lblStatsStrengthValue)
        self.allGUIComponents.append(lblStatsDexterityValue)
        self.allGUIComponents.append(lblStatsStaminaValue)
        self.allGUIComponents.append(lblStatsMagicValue)
        self.allGUIComponents.append(lblPlayerLevel)

        self.allGUIComponents.append(lblPlayerHP)
        self.allGUIComponents.append(lblPlayerMana)
        self.allGUIComponents.append(lblPlayerDMG)
        self.allGUIComponents.append(lblPlayerARM)
        self.allGUIComponents.append(PlayerStatsWindow)
        self.allGUIComponents.append(lblPointsToSpend)
    }

    func moveToFollowPlayerHero(_ difference: CGPoint) {
        let pl = self.GameSceneRef.playerSK.sprite.position

        joyStick.position.x = pl.x - (SCREEN_BOUNDS.width * 0.6)
        joyStick.position.y = pl.y - (SCREEN_BOUNDS.height * 0.42)

        attackButton.position.x = pl.x + (SCREEN_BOUNDS.width * 0.79)
        attackButton.position.y = pl.y - (SCREEN_BOUNDS.height * 0.7)
        ralleyButton.position.x = pl.x + (SCREEN_BOUNDS.width * 0.0)
        ralleyButton.position.y = pl.y - (SCREEN_BOUNDS.height * 0.4)
        spell4Button.position.x = pl.x + (SCREEN_BOUNDS.width * 0.6)
        spell4Button.position.y = pl.y - (SCREEN_BOUNDS.height * 0.7)
        spell3Button.position.x = pl.x + (SCREEN_BOUNDS.width * 0.4)
        spell3Button.position.y = pl.y - (SCREEN_BOUNDS.height * 0.7)

        spell2Button.position.x = pl.x + (SCREEN_BOUNDS.width * 0.2)
        spell2Button.position.y = pl.y - (SCREEN_BOUNDS.height * 0.7)
        spell1Button.position.x = pl.x + (SCREEN_BOUNDS.width * 0.00)
        spell1Button.position.y = pl.y - (SCREEN_BOUNDS.height * 0.7)

        HealthContainer.position.x = pl.x - (SCREEN_BOUNDS.width * 0.3)
        HealthContainer.position.y = pl.y - (SCREEN_BOUNDS.height * 0.5)
        HealthContainer2.position.x = pl.x - (SCREEN_BOUNDS.width * 0.3)
        HealthContainer2.position.y = pl.y - (SCREEN_BOUNDS.height * 0.5)
        HealthJUICE.position.x = pl.x - (SCREEN_BOUNDS.width * 0.3)
        HealthJUICE.position.y = pl.y - (SCREEN_BOUNDS.height * 0.5)

        ManaContainer.position.x = pl.x - (SCREEN_BOUNDS.width * 0.3)
        ManaContainer.position.y = pl.y - (SCREEN_BOUNDS.height * 0.6)
        ManaContainer2.position.x = pl.x - (SCREEN_BOUNDS.width * 0.3)
        ManaContainer2.position.y = pl.y - (SCREEN_BOUNDS.height * 0.6)
        ManaJUICE.position.x = pl.x - (SCREEN_BOUNDS.width * 0.3)
        ManaJUICE.position.y = pl.y - (SCREEN_BOUNDS.height * 0.6)

        ExpContainer.position.x = pl.x - (SCREEN_BOUNDS.width * 0.3)
        ExpContainer.position.y = pl.y - (SCREEN_BOUNDS.height * 0.4)
        ExpContainer2.position.x = pl.x - (SCREEN_BOUNDS.width * 0.3)
        ExpContainer2.position.y = pl.y - (SCREEN_BOUNDS.height * 0.4)
        ExpJUICE.position.x = pl.x - (SCREEN_BOUNDS.width * 0.3)
        ExpJUICE.position.y = pl.y - (SCREEN_BOUNDS.height * 0.4)

//        for gui in allGUIComponents {
//            gotGUI = gui
//            Thread.sleep(forTimeInterval: 0.005)
//            gui.position.x = (gui.position.x + difference.x)
//            gui.position.y = (gui.position.y + difference.y)
//        }
//        if let gui = gotGUI {
//            gui.position.x = (gui.position.x - difference.x) * 1
//            gui.position.y = (gui.position.y - difference.y) * 1
//            print("gui.position.x: \(gui.position.x)")
//            print("gui.position.y: \(gui.position.y)")
//            print("difference.x: \(difference.x)")
//            print("difference.y: \(difference.y)")
//            print("gui.position.x + difference.x: \(gui.position.x + difference.x)")
//            print("gui.position.y + difference.y: \(gui.position.y + difference.y)")
//        }
    }

    func moveBy(_ diff: CGPoint) {

//        for gui in allGUIComponents {
//            gui.run(SKAction.moveBy(x: diff.x, y: diff.y, duration: 0.2))
//        }
    }
    
    func moveByXPositive() {
        for gui in allGUIComponents {
//            gui.position.x += MIN_GRID_SIZE
//            gui.run(SKAction.moveBy(x: MIN_GRID_SIZE, y: 0, duration: 0.2))
        }
    }
    func moveByXNegative() {
        for gui in allGUIComponents {
//            gui.position.x -= MIN_GRID_SIZE
//            gui.run(SKAction.moveBy(x: MIN_GRID_SIZE * -1, y: 0, duration: 0.2))
        }
    }
    func moveByYPositive() {
        for gui in allGUIComponents {
//            gui.position.y += MIN_GRID_SIZE
//            gui.run(SKAction.moveBy(x: 0, y: MIN_GRID_SIZE, duration: 0.2))
        }
    }
    func moveByYNegative() {
        for gui in allGUIComponents {
//            gui.position.y -= MIN_GRID_SIZE
//            gui.run(SKAction.moveBy(x: 0, y: MIN_GRID_SIZE * -1, duration: 0.2))
        }
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
