//
//  GameScene_M.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/19/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene {
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
//        for unit in enemies {
            //            unit.sight.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(250, 250))
            //            unit.sight.physicsBody!.categoryBitMask = PlayerCategory[0]!
            //            unit.sight.physicsBody!.contactTestBitMask = PlayerCategory[unit.teamNumber!]!
            //            unit.sight.name = "SIGHT"
            //            unit.sight.physicsBody!.affectedByGravity = false
            //            unit.sight.physicsBody?.dynamic = false
            //            unit.sight.physicsBody!.collisionBitMask = 0
            
            
            //            if let sight = unit.sight {
            //                unit.sight.UnitReference = unit
            //            }
            //            func setPlayer1() {
            //                unit.sight.physicsBody!.categoryBitMask = Player_1_Sight_Category
            //                unit.sight.physicsBody!.contactTestBitMask = Player_2_Sprite_Category
            //
            //                unit.sprite.physicsBody!.categoryBitMask = Player_1_Sprite_Category
            //                unit.sprite.physicsBody!.contactTestBitMask = Player_2_Sight_Category
            //            }
            //            func setPlayer2() {
            //                unit.sight.physicsBody!.categoryBitMask = Player_2_Sight_Category
            //                unit.sight.physicsBody!.contactTestBitMask = Player_1_Sprite_Category
            //
            //                unit.sprite.physicsBody!.categoryBitMask = Player_2_Sprite_Category
            //                unit.sprite.physicsBody!.contactTestBitMask = Player_1_Sight_Category
            //            }
            //            func setPlayer0() {
            //            }
            
            //            unit.sprite.physicsBody = SKPhysicsBody(rectangleOfSize: unit.sprite.size)
            //            unit.sprite.physicsBody?.dynamic = false
            //            unit.sprite.physicsBody!.affectedByGravity = false
            
            //            switch unit.teamNumber! {
            //            case 1:
            //                setPlayer1()
            //            case 2:
            //                setPlayer2()
            //            default:
            //                setPlayer0()
            //            }
//        }
        
        var PlayerMovement = NSTimer.scheduledTimerWithTimeInterval(0.55, target: self, selector: Selector("orderPlayerToMove"), userInfo: nil, repeats: true)
        
        
//        var AllUnitsAttackTargets = NSTimer.scheduledTimerWithTimeInterval(UnitData.ScanForEnemySpeed(), target: self, selector: Selector("orderAllUnitsToAttackTheirTargets"), userInfo: nil, repeats: true)

        
//        var clearStaleSpriteNodes = NSTimer.scheduledTimerWithTimeInterval(3.50, target: self, selector: Selector("clearStaleSKNodes"), userInfo: nil, repeats: true)
//        
    }
    
    func orderPlayerToMove() {
        self.playerSK.issueOrderTargetingPoint(playerTarget!.position, unitOrder: .AttackMove)
        debugLabel.position = playerSK.sprite.position
        debugLabel.text = String(playerSK.sprite.position)
        debugLabel.zPosition = 100
        debugLabel.fontSize = 19
    }
    
    func initPlayerTarget() {
        playerTarget = SKPlayerTarget(imageNamed: "player-test")
        playerTarget!.xScale = GameSettings.SpriteScale.Default
        playerTarget!.yScale = GameSettings.SpriteScale.Default
        playerTarget!.zPosition = SpritePositionZ.AliveUnit.Z
        playerTarget!.position = playerSK.sprite.position
        addChild(playerTarget!)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        playerTarget?.removeFromParent()
        

        
        for touch in touches {
            let location = touch.locationInNode(self)
            let selectedNode = self.nodeAtPoint(location)
            playerTarget?.position = location
            addChild(playerTarget!)
            if selectedNode is SKAbstractSprite {
                self.playerSK.issueOrderTargetingUnit((selectedNode as! SKAbstractSprite).UnitReference!)
            } else {
//                selectedNode.hidden = true
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
                    NSThread.sleepForTimeInterval(0.4);
                    dispatch_async(dispatch_get_main_queue()) {
//                        selectedNode.hidden = false
                        self.playerSK.issueOrderTargetingPoint(location, unitOrder: .Move)
                    }
                }
            }
        }
 
        

    }
    
    func debugFindUnitToMoveTowards(sender: NSTimer) {
//        print(sender.userInfo)
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
            var targetFound = false
            unitTargetFound: for unit in self.AllUnitsInGameScene {
                

                let unitSelf = sender.userInfo! as! String
//                print("")
//                print("Debugging Unit Sight for unit: " + unitSelf)
//                print("has spotted the unit: " + unit.sprite.name!)
//                print("")
                
                if unit.isPlayer != true && targetFound == false && unit.sprite.name! == unitSelf {
                    
//                    self.scanRangeLongAndGetUnit(unit, completionHandler: { (target) in
//                        if let targetWasAquired = target {
//                            unit.currentAITarget = targetWasAquired
//                            print("⏩ MOVING !!! !! ! ! ! ! !! ! !  ! ! ! ! ! ! ! ! ! !  ! ! ! ! ! ")
//                            unit.issueOrderTargetingPoint(targetWasAquired.sprite.position, unitOrder: .Move)
//                            targetFound = true
//                        }
//                    })
                    
                    let target = scanRangeLongAndGetUnit(unit)
                    unit.currentAITarget = target
                    unit.issueOrderTargetingPoint(target.sprite.position, unitOrder: .Move)
                    targetFound = true
                    
                }
                
                if targetFound == true {
                    break unitTargetFound
                }
            }
//        }
    }
    
    
    func orderAllUnitsToAttackTheirTargets() {
        for unit in self.AllUnitsInGameScene {
            if let target = unit.currentAITarget {
                if target.isDead == false {
                    unit.issueOrderTargetingPoint(target.sprite.position, unitOrder: .Move)
                }
            }
        }
    }
    
    
    func attackUnitClosestToSender(sender: NSTimer) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
        let unitSelf = sender.userInfo! as! String
            for unit in self.AllUnitsInGameScene {
                
                
                if unit.isPlayer != true && unit.sprite.name! == unitSelf {
                    
                    self.scanRangeAndGetUnit(unit, completionHandler: { (target) in
                        
                        if let targetWasAquired = target {
//                            print("GOT A TARGET !!! !! ! ! ! ! !! ! !  ! ! ! ! ! ! ! ! ! !  ! ! ! ! ! ")
                            unit.fireAttackMelee(targetWasAquired)
                        }
                        
                    })
//                    break
                }
            }
//        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func updateDebugLabel(text: String) {
        debugLabel.text = text
        debugLabel.zPosition = 100
        debugLabel.fontSize = 19
        debugLabel.position = CGPoint(x:280, y:600)
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let contactBodyA: SKPhysicsBody = contact.bodyA
        let contactBodyB: SKPhysicsBody = contact.bodyB
        
        ControlPanel?.printToConsole(" \n")
        ControlPanel?.printToConsole("⎶⎶⎶⎶⎶⎶⎶⎶⎶⎶⎶⎶⎶⎶")
        ControlPanel?.printToConsole("Some contact occured.")
        //        ControlPanel?.printToConsole(String(Int(sightBody.categoryBitMask)))
        
        ControlPanel?.printToConsole("Player 2 spotted player 1")
        
        ControlPanel?.printToConsole("")
        ControlPanel?.printToConsole("contactBodyA,")
        ControlPanel?.printToConsole(String(contactBodyA.node!.name!))
        ControlPanel?.printToConsole("")
        ControlPanel?.printToConsole("contactBodyB,")
        ControlPanel?.printToConsole(String(contactBodyB.node!.name!))
        ControlPanel?.printToConsole("")
        ControlPanel?.printToConsole("")
    }
    
    
    
    
    
    func generateUnitsFromMap(mapName: String) {
        
        AllUnitsInGameScene = map.generateGameSceneBasedFromMap(mapName)
        map.generateGameTilesetSceneBasedFromMap(mapName)
        
        print("UNITS IN MAP: ")
        print(map.UnitsInMap)
        
        
        
        var unitI = 0
        for unit in AllUnitsInGameScene {
            if unit is BaseUnit {
                
                let mirror = Mirror(reflecting: unit)
                let classname = String(mirror.subjectType)
                unit.sprite.UnitReference = unit
                unit.sprite.name = classname + "|" + "Plyr:" + String(unit.teamNumber!) + "|" + String(unitI)
                unit.ReferenceOfGameScene = self
                self.addChild(unit.sprite)
                self.addChild(unit.spriteMovementBlocker)
                if let sight = unit.sight {
                    sight.position = unit.sprite.position
                    self.addChild(sight)
                }
                unit.updateMovementBlockerPosition()
                enemies.append(unit)
                //                allEnemyIDs[unit.sprite.name!] = unit
                unit.spriteMovementBlocker.UnitReference = unit
                
                if (unit as! BaseUnit).isPlayer == true {
                    playerSK = unit
                }
                else {
                    NSThread.sleepForTimeInterval(0.20);
                    unit.sightTimer = NSTimer.scheduledTimerWithTimeInterval(UnitData.MovementSpeed(), target: self, selector: #selector(GameScene.debugFindUnitToMoveTowards), userInfo: String(unit.sprite.name!), repeats: true)
                    unit.attackTimer = NSTimer.scheduledTimerWithTimeInterval(UnitData.AttackSpeed(), target: self, selector: #selector(GameScene.attackUnitClosestToSender), userInfo: String(unit.sprite.name!), repeats: true)
                }
                unitI += 1
            } else if unit is BaseStructure {
                self.addChild(unit.sprite)
            }
            
        }
        
        for tile in map.TilesInMap {
            print(tile)
            self.addChild(tile)
        }
        
        initPlayerTarget()
        self.addChild(debugLabel)
        
        
    }
    func ThisUnitTookDamage(unit: SKBlockMovementSpriteNode) {
        unit.UnitReference.unitDidTakeDamage(1)
    }
    
    
    
    
    
//    func patchDescription() {
//        self.scanRangeAndGetUnit(playerSK){ (responseWasSuccess) in
//            if responseWasSuccess != nil {
//
//            } else {
//                // Handle error / nil value
//            }
//        }
//    }
    
    // going to use this one:
    func scanRangeAndGetUnit(unit: BaseUnit, completionHandler: (BaseUnit?) -> ()) -> () {

//        var unitsReturned = [BaseUnit]()
        let positionOfSearchingUnit = unit.sprite.position
        for pos in self.searchArea_s1 {
            
            var posFinal = pos
            posFinal.x = pos.x + positionOfSearchingUnit.x
            posFinal.y = pos.y + positionOfSearchingUnit.y
            
            let spritesAtPoint = self.nodesAtPoint(posFinal)
            
//            var targetAquired = false
            
            spritesInNodeLoop: for sprite in spritesAtPoint {
                if spritesAtPoint.count > 1 {
                    //                        print("FOUND LOTS OF SPRITES!")
                    //                        print(spritesAtPoint)
                }
                
                //                    print("nodes total: " + String(spritesAtPoint.count))
                if sprite is SKBlockMovementSpriteNode {
//                    targetAquired = true
                    
                    /*
                    var markerName = "player-test"
                    if targetAquired == true {
                        markerName = "Enemy"
                    }
                    let targetNode = SKSpriteNode(imageNamed: markerName)
                    dispatch_async(dispatch_get_main_queue()) {
                        targetNode.xScale = GameSettings.SpriteScale.Default
                        targetNode.yScale = GameSettings.SpriteScale.Default
                        targetNode.zPosition = SpritePositionZ.AliveUnit.Z + 50
                        targetNode.position = posFinal
                        self.addChildTemporary(targetNode)
                    }
                    */
                    
                    if (sprite as! SKBlockMovementSpriteNode).UnitReference.teamNumber != unit.teamNumber{
                        completionHandler((sprite as! SKBlockMovementSpriteNode).UnitReference)
//                        unitsReturned.append((sprite as! SKBlockMovementSpriteNode).UnitReference)
                    }
                    
                }
            }
        }
        completionHandler(nil)
//        completionHandler(unitsReturned)
    }
    
    
    func scanRangeLongAndGetUnit_Closure(unit: BaseUnit, completionHandler: (BaseUnit?) -> ()) -> () {
        
        //        var unitsReturned = [BaseUnit]()
        let positionOfSearchingUnit = unit.sprite.position
        for pos in self.searchArea_s4 {
            
            var posFinal = pos
            posFinal.x = pos.x + positionOfSearchingUnit.x
            posFinal.y = pos.y + positionOfSearchingUnit.y
            
            let spritesAtPoint = self.nodesAtPoint(posFinal)
            
            

           
            
            spritesInNodeLoop: for sprite in spritesAtPoint {
                if spritesAtPoint.count > 1 {
                    //                        print("FOUND LOTS OF SPRITES!")
                    //                        print(spritesAtPoint)
                }
                
                
                //                    print("nodes total: " + String(spritesAtPoint.count))
                if sprite is SKBlockMovementSpriteNode {
                    
//                    print("TEAM NUMBERS TO COMPARE")
//                    print("")
//                    print("This is Sprite " + unit.sprite.name!)
//                    print((sprite as! SKBlockMovementSpriteNode).UnitReference.teamNumber!)
//                    print(unit.teamNumber!)
                    
                    if (sprite as! SKBlockMovementSpriteNode).UnitReference.teamNumber! != unit.teamNumber! {
                        
//                        print("")
//                        print("")
//                        print("This is Sprite " + unit.sprite.name!)
//                        print("Analyzing myself and target.")
//                        print("My teamNumber: " + String(unit.teamNumber))
//                        print("############## #########: ")
//                        print("My enemy's teamNumber: " + String((sprite as! SKBlockMovementSpriteNode).UnitReference.teamNumber))
//                        print("My enemy's name: " + String((sprite as! SKBlockMovementSpriteNode).UnitReference.sprite.name!))
//                        print("")
//                        var markerName = "player-test"
//                        let targetNode = SKSpriteNode(imageNamed: "Enemy")
//                        targetNode.xScale = GameSettings.SpriteScale.Default
//                        targetNode.yScale = GameSettings.SpriteScale.Default
//                        targetNode.zPosition = SpritePositionZ.AliveUnit.Z + 50
//                        targetNode.position = posFinal
//                        self.addChild(targetNode)
//                        targetNode.runAction(SKAction.fadeOutWithDuration(0.02))
                        
                        completionHandler((sprite as! SKBlockMovementSpriteNode).UnitReference)
                        //                        unitsReturned.append((sprite as! SKBlockMovementSpriteNode).UnitReference)
                    }
                    
                } else {
//                    let targetNode = SKSpriteNode(imageNamed: "player-test")
//                    targetNode.xScale = GameSettings.SpriteScale.Default
//                    targetNode.yScale = GameSettings.SpriteScale.Default
//                    targetNode.zPosition = SpritePositionZ.AliveUnit.Z + 50
//                    targetNode.position = posFinal
//                    self.addChild(targetNode)
//                    targetNode.runAction(SKAction.fadeOutWithDuration(0.02))
                }
            }
        }
        completionHandler(nil)
        //        completionHandler(unitsReturned)
    }
    
    
    
    func scanRangeLongAndGetUnit(unit: BaseUnit) -> BaseUnit {
        
        //        var unitsReturned = [BaseUnit]()
        let positionOfSearchingUnit = unit.sprite.position
        for pos in self.searchArea_s4 {
            
            var posFinal = pos
            posFinal.x = pos.x + positionOfSearchingUnit.x
            posFinal.y = pos.y + positionOfSearchingUnit.y
            
            let spritesAtPoint = self.nodesAtPoint(posFinal)
            
            
            
            
            
            spritesInNodeLoop: for sprite in spritesAtPoint {
                if spritesAtPoint.count > 1 {
                    //                        print("FOUND LOTS OF SPRITES!")
                    //                        print(spritesAtPoint)
                }
                
                
                //                    print("nodes total: " + String(spritesAtPoint.count))
                if sprite is SKBlockMovementSpriteNode {
                    
                    //                    print("TEAM NUMBERS TO COMPARE")
                    //                    print("")
                    //                    print("This is Sprite " + unit.sprite.name!)
                    //                    print((sprite as! SKBlockMovementSpriteNode).UnitReference.teamNumber!)
                    //                    print(unit.teamNumber!)
                    
                    if (sprite as! SKBlockMovementSpriteNode).UnitReference.teamNumber! != unit.teamNumber! {
                        
                        //                        print("")
                        //                        print("")
                        //                        print("This is Sprite " + unit.sprite.name!)
                        //                        print("Analyzing myself and target.")
                        //                        print("My teamNumber: " + String(unit.teamNumber))
                        //                        print("############## #########: ")
                        //                        print("My enemy's teamNumber: " + String((sprite as! SKBlockMovementSpriteNode).UnitReference.teamNumber))
                        //                        print("My enemy's name: " + String((sprite as! SKBlockMovementSpriteNode).UnitReference.sprite.name!))
                        //                        print("")
                        //                        var markerName = "player-test"
                        //                        let targetNode = SKSpriteNode(imageNamed: "Enemy")
                        //                        targetNode.xScale = GameSettings.SpriteScale.Default
                        //                        targetNode.yScale = GameSettings.SpriteScale.Default
                        //                        targetNode.zPosition = SpritePositionZ.AliveUnit.Z + 50
                        //                        targetNode.position = posFinal
                        //                        self.addChild(targetNode)
                        //                        targetNode.runAction(SKAction.fadeOutWithDuration(0.02))
                        
                        return (sprite as! SKBlockMovementSpriteNode).UnitReference
                        //                        unitsReturned.append((sprite as! SKBlockMovementSpriteNode).UnitReference)
                    }
                    
                } else {
                    //                    let targetNode = SKSpriteNode(imageNamed: "player-test")
                    //                    targetNode.xScale = GameSettings.SpriteScale.Default
                    //                    targetNode.yScale = GameSettings.SpriteScale.Default
                    //                    targetNode.zPosition = SpritePositionZ.AliveUnit.Z + 50
                    //                    targetNode.position = posFinal
                    //                    self.addChild(targetNode)
                    //                    targetNode.runAction(SKAction.fadeOutWithDuration(0.02))
                }
            }
        }
        return unit
        //        completionHandler(unitsReturned)
    }
    
    
    
    func addChildTemporary(node: SKSpriteNode) {
        temporaryNodes.append(node)
        self.addChild(node)
    }
    func clearStaleSKNodes(node: SKSpriteNode) {
        for node in temporaryNodes {
            node.removeFromParent()
        }
    }
    
    
    func makeUnitScanCurrentPosition(unit: BaseUnit) {
        let positionOfSearchingUnit = unit.sprite.position
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            for pos in self.searchArea_s1 {
                NSThread.sleepForTimeInterval(0.09);
                
                var posFinal = pos
                posFinal.x = pos.x + positionOfSearchingUnit.x
                posFinal.y = pos.y + positionOfSearchingUnit.y
                
                let spritesAtPoint = self.nodesAtPoint(posFinal)
                
                var targetAquired = false
                
                spritesInNodeLoop: for sprite in spritesAtPoint {
                    if spritesAtPoint.count > 1 {
//                        print("FOUND LOTS OF SPRITES!")
//                        print(spritesAtPoint)
                    }
                    
//                    print("nodes total: " + String(spritesAtPoint.count))
                    if sprite is SKBlockMovementSpriteNode {
                        targetAquired = true
                        break spritesInNodeLoop
                    }
                }
                
                var markerName = "player-test"
                if targetAquired == true {
                    markerName = "Enemy"
                }
                
                let targetNode = SKSpriteNode(imageNamed: markerName)
                
                
                
                
                dispatch_async(dispatch_get_main_queue()) {
                    targetNode.xScale = GameSettings.SpriteScale.Default
                    targetNode.yScale = GameSettings.SpriteScale.Default
                    targetNode.zPosition = SpritePositionZ.AliveUnit.Z + 50
                    
                    targetNode.position = posFinal
                    self.addChild(targetNode)
                }
                NSThread.sleepForTimeInterval(0.09);
                dispatch_async(dispatch_get_main_queue()) {
                    targetNode.removeFromParent()
                }
            }
        }
    }
}