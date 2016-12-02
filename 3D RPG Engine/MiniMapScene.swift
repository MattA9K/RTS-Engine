//
//  GameScene.swift
//  GameSceneMiniMap
//
//  Created by Mateusz Andrzejczuk on 12/1/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit
import GameplayKit



struct GamePathMatrixPoint {

    let keyStringValue : String  // i.e. "{600, 350}"
    let cgPoint : CGPoint
    let contents : String
    let isBlockedLand : Bool
    let isBlockedSea : Bool
    let isBlockedAir : Bool

    init(location: CGPoint, spaceTime:String) {
        keyStringValue = "{\(location.x), \(location.y)}" // i.e. "{600, 350}"
        cgPoint = location
        contents = spaceTime
        isBlockedLand = true
        isBlockedSea = false
        isBlockedAir = false
    }

    init(LandPoint: CGPoint, IsBlocked: Bool, spaceTime:String) {
        keyStringValue = "{\(LandPoint.x), \(LandPoint.y)}" // i.e. "{600, 350}"
        cgPoint = LandPoint
        contents = spaceTime
        isBlockedLand = IsBlocked
        isBlockedSea = false
        isBlockedAir = false
    }

    init(_keyStringValue:String, _cgPoint: CGPoint, _contents: String,
         _isBlockedLand: Bool, _isBlockedSea: Bool, _isBlockedAir: Bool) {

        keyStringValue = _keyStringValue // i.e. "{600, 350}"
        cgPoint = _cgPoint
        contents = _contents
        isBlockedLand = _isBlockedLand
        isBlockedSea = _isBlockedSea
        isBlockedAir = _isBlockedAir
    }

    func blockPathfinders(point: CGPoint) -> GamePathMatrixPoint {
        let oldKeyStringValue : String = self.keyStringValue
        let oldCgPoint : CGPoint = self.cgPoint
        let oldContents : String = self.contents
        let oldBlockedLand : Bool = self.isBlockedLand
        let oldBlockedSea : Bool = self.isBlockedSea
        let oldBlockedAir : Bool = self.isBlockedAir

        let replacementMatrixPoint : GamePathMatrixPoint = GamePathMatrixPoint(
                _keyStringValue: oldKeyStringValue,
                _cgPoint: point,
                _contents: oldContents,
                _isBlockedLand: false,
                _isBlockedSea: oldBlockedSea,
                _isBlockedAir: oldBlockedAir
        )
        return replacementMatrixPoint
    }

    func unblockPathfinders(point: CGPoint) -> GamePathMatrixPoint {
        let oldKeyStringValue : String = self.keyStringValue
        let oldCgPoint : CGPoint = self.cgPoint
        let oldContents : String = self.contents
        let oldBlockedLand : Bool = self.isBlockedLand
        let oldBlockedSea : Bool = self.isBlockedSea
        let oldBlockedAir : Bool = self.isBlockedAir

        let replacementMatrixPoint : GamePathMatrixPoint = GamePathMatrixPoint(
                _keyStringValue: oldKeyStringValue,
                _cgPoint: point,
                _contents: oldContents,
                _isBlockedLand: false,
                _isBlockedSea: oldBlockedSea,
                _isBlockedAir: oldBlockedAir
        )
        return replacementMatrixPoint
    }




    func pathfinderWillLeave(point: CGPoint) -> GamePathMatrixPoint {
        let oldKeyStringValue : String = self.keyStringValue
        let oldCgPoint : CGPoint = self.cgPoint
        let oldContents : String = self.contents
        let oldBlockedLand : Bool = self.isBlockedLand
        let oldBlockedSea : Bool = self.isBlockedSea
        let oldBlockedAir : Bool = self.isBlockedAir

        let replacementMatrixPoint : GamePathMatrixPoint = GamePathMatrixPoint(
                _keyStringValue: oldKeyStringValue,
                _cgPoint: oldCgPoint,
                _contents: oldContents,
                _isBlockedLand: false,
                _isBlockedSea: oldBlockedSea,
                _isBlockedAir: oldBlockedAir
        )
        return replacementMatrixPoint
    }


    func pathfinderWillEnter(point: CGPoint, withSpaceTime: String) -> GamePathMatrixPoint {
        let oldKeyStringValue : String = self.keyStringValue
        let oldCgPoint : CGPoint = self.cgPoint
        let oldContents : String = self.contents
        let oldBlockedLand : Bool = self.isBlockedLand
        let oldBlockedSea : Bool = self.isBlockedSea
        let oldBlockedAir : Bool = self.isBlockedAir

        let replacementMatrixPoint : GamePathMatrixPoint = GamePathMatrixPoint(
                _keyStringValue: oldKeyStringValue,
                _cgPoint: point,
                _contents: withSpaceTime,
                _isBlockedLand: true,
                _isBlockedSea: oldBlockedSea,
                _isBlockedAir: oldBlockedAir
        )
        return replacementMatrixPoint
    }
}



class MiniMapScene: SKScene {
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?

    var PathsBlocked : [String:GamePathMatrixPoint] = [:]
    var nodeCount : Int = 0
    var frameCount : Int = 0

    let dummyPathsBlocked : [String] = [
            "{650, 400}",
            "{800, 400}",
            "{200, 0}",
            "{250, 150}",
            "{600, 350}",
            "{750, 400}",
            "{200, 50}",
            "{0, 0}",
            "{-700, -450}"
    ]


    override func didMove(to view: SKView) {
        setInitialBlockedPaths()

    }


    func touchDown(atPoint pos : CGPoint) {

    }

    func touchMoved(toPoint pos : CGPoint) {

    }

    func touchUp(atPoint pos : CGPoint) {

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateBlockedPaths_Debug()
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }



    func setInitialBlockedPaths() {
        for i in 0...(dummyPathsBlocked.count - 1) {
//            PathsBlocked[dummyPathsBlocked[i]]!.is = false
        }

//        PathsBlocked[dummyPathsBlocked[1]] = true
//        PathsBlocked[dummyPathsBlocked[3]] = true
//        PathsBlocked[dummyPathsBlocked[6]] = true
//        PathsBlocked[dummyPathsBlocked[7]] = true
//        PathsBlocked[dummyPathsBlocked[8]] = true
    }

    func updateBlockedPaths_Debug() {
//        self.PathsBlocked[self.dummyPathsBlocked[1]] = false
//        self.PathsBlocked[self.dummyPathsBlocked[3]] = false
//        self.PathsBlocked[self.dummyPathsBlocked[6]] = false
//        self.PathsBlocked[self.dummyPathsBlocked[7]] = false
//        self.PathsBlocked[self.dummyPathsBlocked[8]] = false

//        self.PathsBlocked[self.dummyPathsBlocked[0]] = true
//        self.PathsBlocked[self.dummyPathsBlocked[4]] = true
//        self.PathsBlocked[self.dummyPathsBlocked[2]] = true
//        self.PathsBlocked[self.dummyPathsBlocked[3]] = true
//        self.PathsBlocked[self.dummyPathsBlocked[5]] = true
    }

    func updateBlockedPaths(pathsBlocked : [String:GamePathMatrixPoint]) {
        self.PathsBlocked = pathsBlocked
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered

        for path in PathsBlocked {
            let BLOCKED : SKSpriteNode = SKSpriteNode(color: .red, size: CGSize(width:49,height:49))
            let BLOCKED2 : SKSpriteNode = SKSpriteNode(color: .green, size: CGSize(width:49,height:49))
            let BLOCKED3 : SKSpriteNode = SKSpriteNode(color: .black, size: CGSize(width:49,height:49))
            let BLOCKED4 : SKSpriteNode = SKSpriteNode(color: .black, size: CGSize(width:49,height:49))
            let BLOCKED5 : SKSpriteNode = SKSpriteNode(color: .black, size: CGSize(width:49,height:49))

            BLOCKED.position = CGPointFromString(path.key)
            BLOCKED2.position = CGPointFromString(path.key)
            BLOCKED3.position = CGPointFromString(path.key)
            BLOCKED4.position = CGPointFromString(path.key)
            BLOCKED5.position = CGPointFromString(path.key)

            if path.value.isBlockedLand == true {
                self.addChild(BLOCKED)
                nodeCount += 1
            } else if path.value.contents == "HOST" {
                self.addChild(BLOCKED3)
                nodeCount += 1
            } else if path.value.contents == "CPU" {
                self.addChild(BLOCKED3)
                nodeCount += 1
            } else if path.value.contents == "MISC" {
                self.addChild(BLOCKED3)
                nodeCount += 1
            } else {
                self.addChild(BLOCKED2)
                nodeCount += 1
            }
        }
    }

    override func addChild(_ node: SKNode) {
        let action : SKAction = SKAction.fadeOut(withDuration: 0.1)
        super.addChild(node)
        node.run(action, completion: { _ in
            node.removeFromParent()
        })
    }



}



