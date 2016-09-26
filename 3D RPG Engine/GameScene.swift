//
//  GameScene.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 6/29/16.
//  Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    
    var debugLabel = SKLabelNode(fontNamed:"HoeflierText")
    var debugLabelCamera = SKLabelNode(fontNamed:"HoeflierText")
    
    var ControlPanel: UserInputControlsPanel?
    
    var allTimers = [NSTimer]()
    
    // HEROES
    var playerSK: AbstractUnit!
    let playerSpriteID = "sprite_player"
    
    // NON-HEROES
    var enemies = [AbstractUnit]()
    //    var allEnemyIDs: [String:BaseUnit] = [:]
    
    var tilesets = [SKGroundTileGeneric]()
    
    
    var playerTarget: SKPlayerTarget?
    var playerTarget2: SKSpriteNode?
    
    var map = GameMap()
    
    var AllUnitsInGameScene = [NSUUID:AbstractUnit]()
    var AllUnitGUIDs = [NSUUID]()
    
    var AllUnitsInGameScenePositions = [String:CGPoint]()
    var PathsBlocked = [String:Bool]()
    
    var TotalPlayer2UnitsInGameScene = 0
    
    let _ScenarioSceneListener = ScenarioSceneListener(ScenarioKind_: ScenarioKind.Deathmatch)
    
    var temporaryNodes = [SKSpriteNode]()
    
    var hackmapname = ""
    
    let DEBUG_AI_SIGHT = false
    
    
    let frozenOrbDamage = 100
    
    var swipeActivated: Int = 0 {
        didSet {
            if oldValue == 0 {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)) {
                    NSThread.sleepForTimeInterval(3.0)
                    dispatch_async(dispatch_get_main_queue()) {
                        self.swipeActivated = 0
                    }
                }
            }
        }
    }
    
    var spriteControlPanel: UIPlayerControlPanel?
    
    
    let searchArea_s5 =
        [
            //####################################################################################################################################################################################################################
            CGPointMake(-250, 250), CGPointMake(-200, 250), CGPointMake(-150, 250),CGPointMake(-100, 250),CGPointMake(-50, 250),CGPointMake(0, 250),CGPointMake(50, 250),CGPointMake(100, 250),CGPointMake(150, 250),CGPointMake(200, 250), CGPointMake(250, 250),
            //####################################################################################################################################################################################################################
            CGPointMake(-250, 200), CGPointMake(-200, 200), CGPointMake(-150, 200),    CGPointMake(-100, 200),         CGPointMake(-50, 200),      CGPointMake(0, 200),        CGPointMake(50, 200),       CGPointMake(100, 200),      CGPointMake(150, 200), CGPointMake(200, 200), CGPointMake(250, 200),
            //####################################################################################################################################################################################################################
            CGPointMake(-250, 150), CGPointMake(-200, 150), CGPointMake(-150, 150),    CGPointMake(-100, 150),         CGPointMake(-50, 150),      CGPointMake(0, 150),        CGPointMake(50, 150),       CGPointMake(100, 150),      CGPointMake(150, 150), CGPointMake(200, 150), CGPointMake(250, 150),
            //####################################################################################################################################################################################################################
            CGPointMake(-250, 100), CGPointMake(-200, 100), CGPointMake(-150, 100),    CGPointMake(-100, 100),         CGPointMake(-50, 100),      CGPointMake(0, 100),        CGPointMake(50, 100),       CGPointMake(100, 100),      CGPointMake(150, 100), CGPointMake(200, 100), CGPointMake(250, 100),
            //####################################################################################################################################################################################################################
            CGPointMake(-250, 50), CGPointMake(-200, 50), CGPointMake(-150, 50),     CGPointMake(-100, 50),                                                                                               CGPointMake(100, 50),       CGPointMake(150, 50), CGPointMake(200, 50), CGPointMake(250, 50),
            //####################################################################################################################################################################################################################
            CGPointMake(-250, 0), CGPointMake(-200, 0), CGPointMake(-150, 0),      CGPointMake(-100, 0),                                                                                                 CGPointMake(100, 0),        CGPointMake(150, 0), CGPointMake(200, 0), CGPointMake(250, 0),
            //####################################################################################################################################################################################################################
            CGPointMake(-250, -50), CGPointMake(-200, -50), CGPointMake(-150, -50),    CGPointMake(-100, -50),                                                                                             CGPointMake(100, -50),      CGPointMake(150, -50), CGPointMake(200, -50), CGPointMake(250, -50),
            //####################################################################################################################################################################################################################
            CGPointMake(-250, -100), CGPointMake(-200, -100), CGPointMake(-150, -100),   CGPointMake(-100, -100),        CGPointMake(-50, -100),     CGPointMake(0, -100),       CGPointMake(50, -100),      CGPointMake(100, -100),     CGPointMake(150, -100), CGPointMake(200, -100), CGPointMake(250, -100),
            //####################################################################################################################################################################################################################
            CGPointMake(-250, -150), CGPointMake(-200, -150), CGPointMake(-150, -150),   CGPointMake(-100, -150),        CGPointMake(-50, -150),     CGPointMake(0, -150),       CGPointMake(50, -150),      CGPointMake(100, -150),     CGPointMake(150, -150), CGPointMake(200, -150), CGPointMake(250, -150),
            //####################################################################################################################################################################################################################
            CGPointMake(-250, -200), CGPointMake(-200, -200), CGPointMake(-150, -200),   CGPointMake(-100, -200),        CGPointMake(-50, -200),     CGPointMake(0, -200),       CGPointMake(50, -200),      CGPointMake(100, -200),     CGPointMake(150, -200), CGPointMake(200, -200), CGPointMake(250, -200),
            //####################################################################################################################################################################################################################
            CGPointMake(-250, -250), CGPointMake(-200, -250), CGPointMake(-150, -250),   CGPointMake(-100, -250),        CGPointMake(-50, -250),     CGPointMake(0, -250),       CGPointMake(50, -250),      CGPointMake(100, -250),     CGPointMake(150, -250), CGPointMake(200, -250), CGPointMake(250, -250)
            //####################################################################################################################################################################################################################
    ];
    
    let searchArea_s4 =
        [
        //####################################################################################################################################################################################################################
         CGPointMake(-200, 200), CGPointMake(-150, 200),    CGPointMake(-100, 200),         CGPointMake(-50, 200),      CGPointMake(0, 200),        CGPointMake(50, 200),       CGPointMake(100, 200),      CGPointMake(150, 200), CGPointMake(200, 200),
         //####################################################################################################################################################################################################################
         CGPointMake(-200, 150), CGPointMake(-150, 150),    CGPointMake(-100, 150),         CGPointMake(-50, 150),      CGPointMake(0, 150),        CGPointMake(50, 150),       CGPointMake(100, 150),      CGPointMake(150, 150), CGPointMake(200, 150),
         //####################################################################################################################################################################################################################
         CGPointMake(-200, 100), CGPointMake(-150, 100),    CGPointMake(-100, 100),         CGPointMake(-50, 100),      CGPointMake(0, 100),        CGPointMake(50, 100),       CGPointMake(100, 100),      CGPointMake(150, 100), CGPointMake(200, 100),
         //####################################################################################################################################################################################################################
         CGPointMake(-200, 50), CGPointMake(-150, 50),     CGPointMake(-100, 50),                                                                                               CGPointMake(100, 50),       CGPointMake(150, 50), CGPointMake(200, 50),
         //####################################################################################################################################################################################################################
         CGPointMake(-200, 0), CGPointMake(-150, 0),      CGPointMake(-100, 0),                                                                                                 CGPointMake(100, 0),        CGPointMake(150, 0), CGPointMake(200, 0),
         //####################################################################################################################################################################################################################
         CGPointMake(-200, -50), CGPointMake(-150, -50),    CGPointMake(-100, -50),                                                                                             CGPointMake(100, -50),      CGPointMake(150, -50), CGPointMake(200, -50),
         //####################################################################################################################################################################################################################
         CGPointMake(-200, -100), CGPointMake(-150, -100),   CGPointMake(-100, -100),        CGPointMake(-50, -100),     CGPointMake(0, -100),       CGPointMake(50, -100),      CGPointMake(100, -100),     CGPointMake(150, -100), CGPointMake(200, -100),
         //####################################################################################################################################################################################################################
         CGPointMake(-200, -150), CGPointMake(-150, -150),   CGPointMake(-100, -150),        CGPointMake(-50, -150),     CGPointMake(0, -150),       CGPointMake(50, -150),      CGPointMake(100, -150),     CGPointMake(150, -150), CGPointMake(200, -150),
         CGPointMake(-200, -200), CGPointMake(-150, -200),   CGPointMake(-100, -200),        CGPointMake(-50, -200),     CGPointMake(0, -200),       CGPointMake(50, -200),      CGPointMake(100, -200),     CGPointMake(150, -200), CGPointMake(200, -200)
    //####################################################################################################################################################################################################################
    ];
    
    let searchArea_s3 =
        [
            //####################################################################################################################################################################################################################
            CGPointMake(-150, 150),    CGPointMake(-100, 150),         CGPointMake(-50, 150),      CGPointMake(0, 150),        CGPointMake(50, 150),       CGPointMake(100, 150),      CGPointMake(150, 150),
            //####################################################################################################################################################################################################################
            CGPointMake(-150, 100),    CGPointMake(-100, 100),         CGPointMake(-50, 100),      CGPointMake(0, 100),        CGPointMake(50, 100),       CGPointMake(100, 100),      CGPointMake(150, 100),
            //####################################################################################################################################################################################################################
            CGPointMake(-150, 50),     CGPointMake(-100, 50),          CGPointMake(-50, 50),       CGPointMake(0, 50),         CGPointMake(50, 50),        CGPointMake(100, 50),       CGPointMake(150, 50),
            //####################################################################################################################################################################################################################
            CGPointMake(-150, 0),      CGPointMake(-100, 0),           CGPointMake(-50, 0),        CGPointMake(0, 0),          CGPointMake(50, 0),         CGPointMake(100, 0),        CGPointMake(150, 0),
            //####################################################################################################################################################################################################################
            CGPointMake(-150, -50),    CGPointMake(-100, -50),         CGPointMake(-50, -50),      CGPointMake(0, -50),        CGPointMake(50, -50),       CGPointMake(100, -50),      CGPointMake(150, -50),
            //####################################################################################################################################################################################################################
            CGPointMake(-150, -100),   CGPointMake(-100, -100),        CGPointMake(-50, -100),     CGPointMake(0, -100),       CGPointMake(50, -100),      CGPointMake(100, -100),     CGPointMake(150, -100),
            //####################################################################################################################################################################################################################
            CGPointMake(-150, -150),   CGPointMake(-100, -150),        CGPointMake(-50, -150),     CGPointMake(0, -150),       CGPointMake(50, -150),      CGPointMake(100, -150),     CGPointMake(150, -150)
            //####################################################################################################################################################################################################################
    ];
    
    let searchArea_s2 =
        [CGPointMake(-100, 100),    CGPointMake(-50, 100),  CGPointMake(0, 100),  CGPointMake(50, 100), CGPointMake(100, 100),
         CGPointMake(-100, 50),     CGPointMake(-50, 50),   CGPointMake(0, 50),   CGPointMake(50, 50),  CGPointMake(100, 50),
         CGPointMake(-100, 0),      CGPointMake(-50, 0),    CGPointMake(0, 0),    CGPointMake(50, 0),   CGPointMake(100, 0),
         CGPointMake(-100, -50),     CGPointMake(-50, -50),   CGPointMake(0, -50),   CGPointMake(50, -50),  CGPointMake(100, -50),
         CGPointMake(-100, -100),    CGPointMake(-50, -100),  CGPointMake(0, -100),  CGPointMake(50, -100), CGPointMake(100, -100)];
    
    let searchArea_s1 =
        [
            CGPointMake(-50, 50),   CGPointMake(0, 50),   CGPointMake(50, 50),
            CGPointMake(-50, 0),    CGPointMake(0, 0),    CGPointMake(50, 0),
            CGPointMake(-50, -50),   CGPointMake(0, -50),   CGPointMake(50, -50),
            ];
}

public func logg(line: Any) {
    //print(line)
}

public func print123(line: Any) {
//    print("[GENERAL]: ", terminator:"")
//    print(line)
}

public func printsp(line: Any) {
//    print("[SPEARTHROWER]: ", terminator:"")
//    print(line)
}

public func printgs(line: Any) {
//    print("[GAMESCENE]: ", terminator:"")
//    print(line)
}

public func printn(line: Any) {
//        print("[NEW]: ", terminator:"")
//        print(line)
}

public func printRAM(line: Any) {
//    print("[RAM]: ", terminator:"")
//    print(line)
}

public func printPlayer(line: Any) {
//    print("[PLAYER UNIT]: ", terminator:"")
//    print(line)
}

public func printUnitLog(line: Any) {
//    print("[UNIT LOG]: \(line)")
}





/*
 
 let searchArea_s4 =
 [
 //####################################################################################################################################################################################################################
 CGPointMake(-200, 200), CGPointMake(-150, 200),    CGPointMake(-100, 200),         CGPointMake(-50, 200),      CGPointMake(0, 200),        CGPointMake(50, 200),       CGPointMake(100, 200),      CGPointMake(150, 200), CGPointMake(200, 200),
 //####################################################################################################################################################################################################################
 CGPointMake(-200, 150), CGPointMake(-150, 150),    CGPointMake(-100, 150),         CGPointMake(-50, 150),      CGPointMake(0, 150),        CGPointMake(50, 150),       CGPointMake(100, 150),      CGPointMake(150, 150), CGPointMake(200, 150),
 //####################################################################################################################################################################################################################
 CGPointMake(-200, 100), CGPointMake(-150, 100),    CGPointMake(-100, 100),         CGPointMake(-50, 100),      CGPointMake(0, 100),        CGPointMake(50, 100),       CGPointMake(100, 100),      CGPointMake(150, 100), CGPointMake(200, 100),
 //####################################################################################################################################################################################################################
 CGPointMake(-200, 50), CGPointMake(-150, 50),     CGPointMake(-100, 50),          CGPointMake(-50, 50),       CGPointMake(0, 50),         CGPointMake(50, 50),        CGPointMake(100, 50),       CGPointMake(150, 50), CGPointMake(200, 50),
 //####################################################################################################################################################################################################################
 CGPointMake(-200, 0), CGPointMake(-150, 0),      CGPointMake(-100, 0),           CGPointMake(-50, 0),        CGPointMake(0, 0),          CGPointMake(50, 0),         CGPointMake(100, 0),        CGPointMake(150, 0), CGPointMake(200, 0),
 //####################################################################################################################################################################################################################
 CGPointMake(-200, -50), CGPointMake(-150, -50),    CGPointMake(-100, -50),         CGPointMake(-50, -50),      CGPointMake(0, -50),        CGPointMake(50, -50),       CGPointMake(100, -50),      CGPointMake(150, -50), CGPointMake(200, -50),
 //####################################################################################################################################################################################################################
 CGPointMake(-200, -100), CGPointMake(-150, -100),   CGPointMake(-100, -100),        CGPointMake(-50, -100),     CGPointMake(0, -100),       CGPointMake(50, -100),      CGPointMake(100, -100),     CGPointMake(150, -100), CGPointMake(200, -100),
 //####################################################################################################################################################################################################################
 CGPointMake(-200, -150), CGPointMake(-150, -150),   CGPointMake(-100, -150),        CGPointMake(-50, -150),     CGPointMake(0, -150),       CGPointMake(50, -150),      CGPointMake(100, -150),     CGPointMake(150, -150), CGPointMake(200, -150),
 CGPointMake(-200, -200), CGPointMake(-150, -200),   CGPointMake(-100, -200),        CGPointMake(-50, -200),     CGPointMake(0, -200),       CGPointMake(50, -200),      CGPointMake(100, -200),     CGPointMake(150, -200), CGPointMake(200, -200)
 //####################################################################################################################################################################################################################
 ];
 
 */