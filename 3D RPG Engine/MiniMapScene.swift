//
//  GameScene.swift
//  GameSceneMiniMap
//
//  Created by Mateusz Andrzejczuk on 12/1/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import SpriteKit
import GameplayKit



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
//        for i in 0...(dummyPathsBlocked.count - 1) {
//            PathsBlocked[dummyPathsBlocked[i]]!.is = false
//        }

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
            let BLOCKED : SKSpriteNode = SKSpriteNode(color: .red, size: CGSize(width:100,height:100))

            let BLOCKED2 : SKSpriteNode = SKSpriteNode(color: path.value.color, size: CGSize(width:100,height:100))

            let BLOCKED3 : SKSpriteNode = SKSpriteNode(color: .black, size: CGSize(width:100,height:100))
            let BLOCKED4 : SKSpriteNode = SKSpriteNode(color: .purple, size: CGSize(width:100,height:100))
            let BLOCKED5 : SKSpriteNode = SKSpriteNode(color: .blue, size: CGSize(width:100,height:100))
            let BLOCKED6 : SKSpriteNode = SKSpriteNode(color: .blue, size: CGSize(width:100,height:100))

            BLOCKED.position = CGPointFromString(path.key)
            BLOCKED2.position = CGPointFromString(path.key)
            BLOCKED3.position = CGPointFromString(path.key)
            BLOCKED4.position = CGPointFromString(path.key)
            BLOCKED5.position = CGPointFromString(path.key)
            BLOCKED6.position = CGPointFromString(path.key)


//            print("SOME path.value.contents NIGGA: \(path.value.contents)")
            if path.value.contents == "HOST" {
//                self.addChild(BLOCKED5)
//                nodeCount += 1
            }
            else if path.value.contents == "CPU" {
//                self.addChild(BLOCKED4)
//                nodeCount += 1
            }
            else if path.value.contents == "MISC" {
//                self.addChild(BLOCKED3)
//                nodeCount += 1
            }
            else if path.value.isBlockedLand == true && path.value.contents == "HOST" {
//                self.addChild(BLOCKED5)
//                nodeCount += 1
            }
            else if path.value.isBlockedLand == true && path.value.contents == "CPU" {
//                self.addChild(BLOCKED4)
//                nodeCount += 1
            }
            else if path.value.isBlockedLand == true && path.value.contents == "MISC" {
//                self.addChild(BLOCKED3)
//                nodeCount += 1
            }
            else {
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



