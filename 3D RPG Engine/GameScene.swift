//
//  GameScene.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Alamofire
import SpriteKit
import Starscream
import SwiftyJSON

let ARRAY_OF_COLORS : [UIColor] = [.red, .green, .purple, .orange, .yellow, .blue]
let RANDOM_COLOR_1 : UIColor = ARRAY_OF_COLORS[Int(arc4random_uniform(UInt32(ARRAY_OF_COLORS.count)))]
let RANDOM_COLOR_2 : UIColor = ARRAY_OF_COLORS[Int(arc4random_uniform(UInt32(ARRAY_OF_COLORS.count)))]
let RANDOM_COLOR_3 : UIColor = ARRAY_OF_COLORS[Int(arc4random_uniform(UInt32(ARRAY_OF_COLORS.count)))]
let RANDOM_COLOR_4 : UIColor = ARRAY_OF_COLORS[Int(arc4random_uniform(UInt32(ARRAY_OF_COLORS.count)))]

let BALROG_PLYR_1 = SpriteTextureSet_Balrog(actorName: "balrog", color: RANDOM_COLOR_2)
let BALROG_ENEMY = SpriteTextureSet_Balrog(actorName: "balrog", color: RANDOM_COLOR_3)
let PLAYER_1_TEXTURE_SET = SpriteTextureSet_HeroFootman(actorName: "footmanCenturionLvl1", color: RANDOM_COLOR_2)
let PLAYER_2_TEXTURE_SET = SpriteTextureSet_HeroFootman(actorName: "footmanCenturionLvl1", color: RANDOM_COLOR_4)

let HOST_SERVER : String = "138.68.1.244"

/// GameScene
///
/// The backbone of the application
///
/// `IMPORTANT PROPERTIES`
/// - **allPlayers**: property is required to determine all GameScene unit colors
class GameScene: SKScene, WebSocketDelegate {


    /// **required**
    ///
    /// Set each time a unit is appended to the game.
    ///
    /// property is required to determine all GameScene unit colors
    var allPlayers : [Int:Player] = [:]


    var debugLabel = SKLabelNode(fontNamed:"HoeflierText")
    var debugLabelCamera = SKLabelNode(fontNamed:"HoeflierText")
    var allTimers = [Timer]()
    
    // HEROES
    var playerSK: AbstractUnit!
    let playerSpriteID = "sprite_player"
    
    // NON-HEROES
    var enemies = [AbstractUnit]()
    //    var allEnemyIDs: [String:BaseUnit] = [:]
    
    var tilesets = [SKGroundTileGeneric]()
    

    var playerTarget: SKPlayerTarget?
    /// this target variable may be depricated
    var playerTarget2: SKSpriteNode?
    
    var map = GameMap()
    
    var AllUnitsInGameScene = [UUID:AbstractUnit]()
//    var AllUnitGUIDs = [UUID]()
    var AllUnitsInGameScenePositions = [String:CGPoint]()
    var PathsBlocked = [String:GamePathMatrixPoint]()

    var TotalPlayer2UnitsInGameScene = 0
    let _ScenarioSceneListener = ScenarioSceneListener(ScenarioKind_: ScenarioKind.deathmatch)
    var temporaryNodes = [SKSpriteNode]()


    let frozenOrbDamage = 15
    var viewControllerRef: UIViewController?
    var playerIsHost = false
    var playerIsHost2 = false
    var latestDataFromWebSocket: String! = ""
    var gameHostEventIncrement = 0;
    var totalSocketMessages = 0
    var currentPlayerNumber = 1
    var currentPlayerNumber2 = 0
    var playerSK2: AbstractUnit!
    
    var hostSetOfAiUnits : [UUID:AbstractUnit] = [:]

    var aiUnitBCCounterk : Int = 0
    
    var swipeActivated: Int = 0 {
        didSet {
            if oldValue == 0 {
                DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.low).async {
                    Thread.sleep(forTimeInterval: 3.0)
                    DispatchQueue.main.async {
                        self.swipeActivated = 0
                    }
                }
            }
        }
    }
    
    
    var virtualAnchorPoint : CGPoint = CGPoint(x: 0, y: 0)
    var spriteControlPanel: UIPlayerControlPanel?




    var nodesForMultiplayerHost = [TileSpriteNode]()
    var nodesCollectedGuest = [SKSpriteNode]()

    var plainGrassNodes = [TileSpriteNode]()
    var plainDirtNodes = [TileSpriteNode]()
    var plainGrassNodesLayer2 = [TileSpriteNode]()
    var plainDirtNodesLayer2 = [TileSpriteNode]()
    var autoCompleteGrassNodes = [TileSpriteNode]()
    var autoCompletedGrassCornerNodes = [SKNode]()
    var transitionalMapSectionsLeft = 10

    var unitsForMultiplayer : [UUID:AbstractUnit] = [:]

    var playerStartLocation = CGPoint(x:0, y:0)
    var currentlySelectedUnit: AbstractUnit?
    
    var dominantTileName = ""
    var subTileName = ""


    var socketMessagesReceivedLog : String = ""
    var orderedQueueOfSocketEventsToBroadcast : [String] = [] {
        didSet {

        }
    }
    let unitInformationPanel = UnitInformationPanel()
    var unitsUnderConstruction : [UUID:Int] = [:]

    // <Player: Amount>
    var resourceLumber : [Int:Int] = [:]
    var resourceGold : [Int:Int] = [:]

    var commandBarDelegate : CommandBar?
    
    
    let rtsPlayerTarget : SKSpriteNode! = SKSpriteNode(color: .green, size: CGSize(width: 50, height:50))
    

    override func didMove(to view: SKView) {
        /* Setup your scene here */
//        initializeSwipeToPanCameraEventHandler()
        initHeroLabel()


        addChild(rtsPlayerTarget)
        rtsPlayerTarget.zPosition = 100
        for node in unitInformationPanel.components {
            self.addChild(node)
        }
    }

    var recycledTextures : [String:SKTexture] = [:]

    // ___________________________________________________________________________________________
    // NEW - AND MORE STABLE WEB SOCKET LOGIC:
    var messageQueue : [String] = [] {
        didSet {
            if messageQueue.count > 0 && self.socketIsBusy == false {
                self.broadcastMsgsQueue()
            }
        }
    }
    var socketIsBusy : Bool = false
    func appendMessageToQueue(_ message: String) {
        messageQueue.append(message)
    }
    func broadcastMsgsQueue() {
        if messageQueue.count > 0 {
            socketIsBusy = true
            socket.write(string: self.messageQueue[0], completion: { _ in
                self.socketIsBusy = false
                self.messageQueue.remove(at: 0)
            })
        }
        else if messageQueue.count == 0 {
            print("SOCKET WORK IS ALL FINISHED!")
        }
    }
    // ___________________________________________________________________________________________

    var commandCardView : UnitCommandCardView?
    func addDelegateCommandCard(cmdCard : UnitCommandCardView) {
        self.commandCardView = cmdCard
    }

    func commandBarAnyButtonWasTapped(sender : UIButton) {
        print("WORKS LIKE A NIGGA NIGGA!!!  \(sender.titleLabel!.text)")

        switch sender.titleLabel!.text! {
            case "ATTACK":
                self.playerDidTouchNewAttackButton()
            default:
                self.heroDidCastSpell2()
        }
    }

    /// Returns a "view" of `self` containing the same elements in gfg
    func heroDidCastSpell1() {

    }

    /// Returns a "view" of `self` containing the same elements in
    func heroDidCastSpell2() {
        recursiveUnitBroadcast()
    }

    /// Returns a "view" of `self` containing the same elements in
    func heroDidCastSpell3() {
//        fireMissileBombPlayerHelper()

    }
    func heroDidCastSpell4() {
//        playerCastBlizzardHelper()
    }

    func updateCommandBarTarget(_ location: CGPoint) {
        rtsPlayerTarget.position = location
    }
    

    // REMOVE THIS
    func UnitWasSelectedByThePlayer(_ unit: AbstractUnit) {
        self.loadSelectedUnitIntoGUI(unit)
    }
    
    // REMOVE THIS
    func loadSelectedUnitIntoGUI(_ unit: AbstractUnit) {
        self.spriteControlPanel?.labelUnitName.text = unit.nameGUI
    }
    
    
    func orderPlayerToMove() {
        if let plyr = self.playerSK {
            if let target = playerTarget {
                (plyr as! PathfinderUnit).issueMultiplayerAIOrderTargetingPoint(target.position,
                                                                                completionHandler: { finalDestination in
                    print("player was ordered to move!!")
                })
            }
        }
    }
    
    
    func updateDebugLabel() {
        //        debugLabel.position = playerSK.sprite.position
        //        debugLabel.text = String(playerSK.sprite.position)
        //        debugLabel.zPosition = 100
        //        debugLabel.fontSize = 19
    }
    

    func initPlayerTarget() {
        if let plyr = playerSK {
            playerTarget = SKPlayerTarget(imageNamed: "player-test")
            playerTarget!.xScale = GameSettings.spriteScale.Default
            playerTarget!.yScale = GameSettings.spriteScale.Default
            playerTarget!.zPosition = 15
            playerTarget!.position = plyr.sprite.position
            playerStartLocation = plyr.sprite.position
            addChild(playerTarget!)
//            plyr.sprite.name = "OFFLINE"
        }
    }
    
    
    func resetPlayerTarget() {
        if let target = playerTarget {
            target.position = playerSK.sprite.position
        }
    }
    
    var playerNumberInput = ""
    var multiplayerGameSocketId = "foobar" {
        didSet {
            let urlStr : String = "ws://\(HOST_SERVER):7002/ws/\(multiplayerGameSocketId)?subscribe-broadcast&publish-broadcast&echo"
            socket = WebSocket(url: URL(string: urlStr)!)
        }
    }
    
    var socket = WebSocket(url: URL(string: "ws://\(HOST_SERVER):7002/ws/foobar?subscribe-broadcast&publish-broadcast&echo")!)
    func connectGameSceneToWebSocket() {
        if socket.isConnected != true {
            socket.connect()
            print("WEBSOCKET CONNECTION HAS BEEN ESTABLISHED!")
        } else {
            print("THIS GAME SCENE IS ALREADY CONNECTED TO THE SOCKET!")
        }
    }
    
    func sendTestDebugPingToSocket() {
        if socket.isConnected == true {
            let strD = "Going to convert this to data."
            socket.write(string: strD)
            print("WEBSOCKET DID WRITE DATA!!!")
        } else {
            print("ERROR - SOCKET OFFLINE")
        }
    }
    
    func setPathsBlockedValueToNil(at: CGPoint) {
        let keyStr : String = "{\(at.x), \(at.y)}"
        self.PathsBlocked[keyStr] = nil
    }

    func setPathsBlockedValue(at: CGPoint, usingMatrixPoint: GamePathMatrixPoint) {
        let keyStr : String = "{\(at.x), \(at.y)}"
        self.PathsBlocked[keyStr] = usingMatrixPoint
    }
    
    //
    var rightClickEnabled : Bool = false;
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        //        playerTarget?.removeFromParent()
        
        for touch in touches {
            let location = touch.location(in: self)
            let selectedNodes = self.nodes(at: location)

            /*
            if let target = playerTarget {
                target.position = location
                target.position.x = PathFinder().roundToFifties(target.position.x)
                target.position.y = PathFinder().roundToFifties(target.position.y)
            } else {
                self.initPlayerTarget()
            }
            */
            
            self.updateCommandBarTarget(location)
            
            for node in selectedNodes {
                if self.rightClickEnabled == false {
                    if node is SKAbstractSprite {
                    } else if node is SKBlockMovementSpriteNode {
                        self.currentlySelectedUnit = (node as! SKBlockMovementSpriteNode).UnitReference
                        self.unitInformationPanel.loadUnitIntoView(unit: self.currentlySelectedUnit!, location)
                        print("Unit was selected! \(self.currentlySelectedUnit?.sprite.name)")
                    } else if node is CSKButtonNode {
                        self.forwardButtonEvent(node as! CSKButtonNode)
                    }
                } else {
                    print("UNIT WAS ISSUED AN ORDER TARGETING POINT: \(location)")
                    (self.currentlySelectedUnit as! PathfinderUnit).attackMoveOrderLocation = location
                }
            }
        }
    }


    var totalGameSecondsPassed: Int = 0
    var totalFramesRendered: Int = 0
    var guiPlacementDifference = CGPoint(x:0,y:0)
    override func update(_ currentTime: TimeInterval) {
        (self.viewControllerRef as! SocketedViewController).updateMiniMap(self.PathsBlocked)

        /* Called before each frame is rendered */
        if unitsUnderConstruction.count > 0 {
            for unit in unitsUnderConstruction {
                let updated : Int = unitsUnderConstruction[unit.key]! - 1
                unitsUnderConstruction[unit.key]! = updated
                self.AllUnitsInGameScene[unit.key]!.constructionTimeLeft = unit.value

//                print("testing currently selected unit")
                if currentlySelectedUnit != nil {
                    if unitInformationPanel.selectedUnitUUID == currentlySelectedUnit!.uuid {
//                        unitInformationPanel.progress = updated
                        unitInformationPanel.setProgressLabelValue(int: updated)
                    }
                }

                if unitsUnderConstruction[unit.key]! <= 0 {
                    unitsUnderConstruction[unit.key] = nil
                    unitConstructionCompleted(unit.key)
                }
            }
        } else if currentlySelectedUnit != nil {

            if let targetOfTarget = currentlySelectedUnit!.focusedTargetUnit {
                unitInformationPanel.updateLabels(
                        currentlySelectedUnit!.uuid,
                        currentlySelectedUnit!.sprite.name!,
                        targetOfTarget.sprite.name!)
            } else {
                unitInformationPanel.updateLabels(
                        currentlySelectedUnit!.uuid,
                        currentlySelectedUnit!.sprite.name!,
                        "_______")
            }
        }

        if playerSK != nil {
            let pos = playerSK.sprite.position



            heroLabel.position = CGPoint(x: pos.x, y: pos.y + 150)

            let sX : CGFloat = self.playerStartLocation.x
            let sY : CGFloat = self.playerStartLocation.y
            let cX : CGFloat = playerSK.sprite.position.x * -1
            let cY : CGFloat = playerSK.sprite.position.y * -1

            heroLabel.text = "totalFramesRendered: \(totalFramesRendered)"
            totalFramesRendered += 1
            heroLabel.fontColor = .black
            
            virtualGameTimeTick_Second(totalFramesRendered)

            heroLabelSubtitle.position = CGPoint(x: pos.x, y: pos.y + 100)
//            heroLabelSubtitle.text = "Current: \(playerSK.sprite.position.x * -1) \(playerSK.sprite.position.y * -1)"
            heroLabelSubtitle.text = "Current: \(playerSK.sprite.position.x * -1) \(playerSK.sprite.position.y * -1)"
            heroLabelSubtitle.fontColor = .red

            self.guiPlacementDifference = CGPoint(x:((sX+cX)),y:((sY+cY)))

            anchorPoint.x = ((playerSK.sprite.position.x * -1) / size.width) + 0.50
            anchorPoint.y = ((playerSK.sprite.position.y * -1) / size.height) + 0.50

//            if (playerSK as! PathfinderUnit).isMoving == true {
//                print("")
//                print("playerSK.sprite.position.x \(playerSK.sprite.position.x)")
//                print("playerSK.sprite.position.y \(playerSK.sprite.position.y) \n\n")
//                print("")
//                print("")
            if let selectedUnit = self.currentlySelectedUnit {
                self.commandBarDelegate?.didGetMessageFromScene(message: selectedUnit)
                self.commandCardView?.didGetMessageFromScene(message: selectedUnit)
                
            }
            if let pnl = spriteControlPanel {
                pnl.moveToFollowPlayerHero(playerSK.sprite.position)
            }

//            }
        }
    }

    func testCommandBarDelegate(_ text: String) {
        print(text)
    }
    
    func updateResourceBars() {
        let health = CGFloat(playerSK.HP) / CGFloat(playerSK.HP_MAX)
        self.spriteControlPanel?.updateResourceBar(health, resourceType: .hp)
        
        let mana = CGFloat(playerSK.MANA) / CGFloat(playerSK.MANA_MAX)
        self.spriteControlPanel?.updateResourceBar(mana, resourceType: .mana)
        
        let experience = CGFloat((spriteControlPanel?.heroStat!.XP)!) / CGFloat((spriteControlPanel?.heroStat?.XP_MAX)!)
        self.spriteControlPanel?.updateResourceBar(experience, resourceType: .exp)
    }

    
    var heroLabel = SKLabelNode(text: "Hero label ready")
    var heroLabelSubtitle = SKLabelNode(text: "Hero label ready")
    
    var currentGridSizeX: CGFloat = 0
    var currentGridSizeY: CGFloat = 0

    func virtualGameTimeTick_Second(_ framesRendered: Int) {
        let num : CGFloat = CGFloat(framesRendered)
        let result = num.truncatingRemainder(dividingBy: 60)
        if result == 0 {
            totalGameSecondsPassed += 1
            print("GAME SECOND HAS PASSED!")
        }
    }

    func initHeroLabel() {
        self.addChild(heroLabel)
        self.addChild(heroLabelSubtitle)
    }
    
    func updateDebugLabel(_ text: String) {
        debugLabel.text = text
        debugLabel.zPosition = 100
        debugLabel.fontSize = 19
        debugLabel.position = CGPoint(x:280, y:600)
        self.heroDidCastSpell1()
    }

    
    func heroDied() {
        if playerSK.HP <= 0 && self.playerSK.isDead == true {
            for timer in allTimers {
                timer.invalidate()
            }
            for unt in AllUnitsInGameScene {
                if unt.value is AbstractUnit {
                    unt.value.isDead = true
                    unt.value.sprite.removeFromParent()
                }
            }
            let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(0.1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
                let notificationName = "NSNExitGameControllerDefeat"
                let notification = Notification(
                    name: Notification.Name(rawValue: notificationName),
                    object: self,
                    userInfo: ["toastInfo":"doge!"])
                NotificationCenter.default.post(notification)
            })
        }
    }
    

    
    func resetMapEditor() {
        for node in plainGrassNodes {
            node.removeFromParent()
        }
        for node in autoCompleteGrassNodes {
            node.removeFromParent()
        }
        
        plainGrassNodes = [TileSpriteNode]()
        autoCompleteGrassNodes = [TileSpriteNode]()
    }
    var DIRT_BRUSH_ENABLED = false
    // 🔵
    
    



    
    // FOR HOST ONLY:
    func ThisUnitTookDamage(_ sprite: SKBlockMovementSpriteNode, fromUnit: AbstractUnit) {
        guard self.playerSK != nil else {
            return
        }
        guard self.playerSK.teamNumber == 1 else {
            return
        }
        let teamNumberOfUnitTakingDamage = sprite.UnitReference.teamNumber
        let DMG = fromUnit.DMG

        broadcast(unit: sprite.UnitReference, didTakeDamage: DMG, from: fromUnit)
        let UpdateScenarioListener = sprite.UnitReference.unitWillTakeDamageReturnIfUnitDies(DMG, fromUnit: sprite.UnitReference)
        
        updateResourceBars()
        
        if UpdateScenarioListener == true {
            
            if fromUnit.sprite.name == playerSK.sprite.name {
                //                self.spriteControlPanel?.heroStat?.addExperience(sprite.UnitReference)
                self.spriteControlPanel!.updateXP(sprite.UnitReference)
            }
            TotalPlayer2UnitsInGameScene -= 1;
            _ScenarioSceneListener._AllEnemyUnits -= 1;
        }
    }

    // FOR GUESTS ONLY:
    func applyDamage(_ victimUnit: AbstractUnit, amount: Int, fromUnit: AbstractUnit) {
        let UpdateScenarioListener = victimUnit.unitWillTakeDamageReturnIfUnitDies(amount, fromUnit: fromUnit)
    }
    
    
    func addChildTemporary(_ node: SKNode) {
//        temporaryNodes.append(node)
        self.addChild(node)
        node.run(SKAction.fadeOut(withDuration: 1.0))
    }
    
    
    func addChildTemporaryExpand(_ node: SKSpriteNode) {
        temporaryNodes.append(node)
        self.addChild(node)
        var oldSizeX = node.xScale
        var oldSizeY = node.yScale
        DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.low).async {
            Thread.sleep(forTimeInterval: 0.02);
            DispatchQueue.main.async {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
            }
            Thread.sleep(forTimeInterval: 0.02);
            DispatchQueue.main.async {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
            }
            Thread.sleep(forTimeInterval: 0.02);
            DispatchQueue.main.async {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
            }
            Thread.sleep(forTimeInterval: 0.02);
            DispatchQueue.main.async {
                oldSizeX += 1
                oldSizeY += 1
                node.xScale = oldSizeX
                node.yScale = oldSizeY
                node.run(SKAction.fadeOut(withDuration: 2.0))
            }
        }
    }
    
    
    func clearStaleSKNodes(_ node: SKSpriteNode) {
        //        for node in temporaryNodes {
        //            node.removeFromParent()
        //        }
    }

}
