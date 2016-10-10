//
//  Joystick.swift
//  Swift-SpriteKit-Joystick
//
//  Created by Derrick Liu on 12/14/14.
//  Copyright (c) 2014 TheSneakyNarwhal. All rights reserved.
//

import Foundation
import SpriteKit

class Joystick : SKNode {
    let kThumbSpringBackDuration: Double =  0.3
    let backdropNode, thumbNode: SKSpriteNode
    var isTracking: Bool = false
    var velocity: CGPoint = CGPoint(x: 0, y: 0)
    var travelLimit: CGPoint = CGPoint(x: 0, y: 0)
    var angularVelocity: CGFloat = 0.0
    var size: Float = 0.0
    var playerIsMoving = false
    
    var AX: Double?
    var AY: Double?
    
    var gameSceneReference: GameScene?
    var JoystickTimer: Timer?
    
    func anchorPointInPoints() -> CGPoint {
        return CGPoint(x: 0, y: 0)
    }
    
    init(thumbNode: SKSpriteNode = SKSpriteNode(imageNamed: "joystick.png"), backdropNode: SKSpriteNode = SKSpriteNode(imageNamed: "dpad.png")) {
        self.thumbNode = thumbNode
        self.backdropNode = backdropNode
        
        self.thumbNode.xScale = 2.0
        self.thumbNode.yScale = 2.0
        
        self.backdropNode.xScale = 3.0
        self.backdropNode.yScale = 3.0
        
        super.init()
        
        self.addChild(self.backdropNode)
        self.addChild(self.thumbNode)
        
        self.isUserInteractionEnabled = true
        
        JoystickTimer = Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(Joystick.checkJoystickTimer),
            userInfo: nil,
            repeats: true
        );
    }
    
    func setGameSceneRef(_ gameScene: GameScene) {
        self.gameSceneReference = gameScene
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchPoint: CGPoint = touch.location(in: self)
            if self.isTracking == false && self.thumbNode.frame.contains(touchPoint) {
                self.isTracking = true
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchPoint: CGPoint = touch.location(in: self)
            
            let x = touchPoint.x
            let y = touchPoint.y
            

            
            if ((y > 0) && (x > -40)) &&
                ((y > 0) && (x < 40))
            {
                if playerIsMoving == false {
                    faceUP()
                }
                
            }
                
            // UP LEFT
            else if ((y < 0) && (x > -40)) &&
                ((y < 0) && (x < 40))
            {
                if playerIsMoving == false {
                    faceDOWN()
                }
                
                
            }
                //==================

            else if ((y < 40) && (x < 0)) &&
                ((y > -40) && (x < 0))
            {
                if playerIsMoving == false {
                    faceLEFT()
                }
                
                
            }
            else if ((y < 40) && (x > 0)) &&
                ((y > -40) && (x > 0))
            {
                if playerIsMoving == false {
                    faceRIGHT()
                }
                
            }
            else if ((y > 0) && (x < -40)) &&
                ((x < 0) && (y > 40))
            {
                if playerIsMoving == false {
                    faceUPLEFT()
                }
                
            }
            else if ((y > 0) && (x > 40)) &&
                ((x > 0) && (y > 40))
            {
                if playerIsMoving == false {
                    faceUPRIGHT()
                }
                
            }
            else if ((y < 0) && (x < -40)) &&
                ((x < 0) && (y < -40))
            {
                if playerIsMoving == false {
                    faceDOWNLEFT()
                }
                
            }
            else if ((y < 0) && (x > 40)) &&
                ((x > 0) && (y < -40))
            {
                if playerIsMoving == false {
                    faceDOWNRIGHT()
                }
                
            }
            
            if self.isTracking == true && sqrtf(powf((Float(touchPoint.x) - Float(self.thumbNode.position.x)), 2) + powf((Float(touchPoint.y) - Float(self.thumbNode.position.y)), 2)) < Float(self.thumbNode.size.width) {
                if sqrtf(powf((Float(touchPoint.x) - Float(self.anchorPointInPoints().x)), 2) + powf((Float(touchPoint.y) - Float(self.anchorPointInPoints().y)), 2)) <= Float(self.thumbNode.size.width) {
                    let moveDifference: CGPoint = CGPoint(x: touchPoint.x - self.anchorPointInPoints().x, y: touchPoint.y - self.anchorPointInPoints().y)
                    self.thumbNode.position = CGPoint(x: self.anchorPointInPoints().x + moveDifference.x, y: self.anchorPointInPoints().y + moveDifference.y)
                    
                } else {
                    let vX: Double = Double(touchPoint.x) - Double(self.anchorPointInPoints().x)
                    let vY: Double = Double(touchPoint.y) - Double(self.anchorPointInPoints().y)
                    let magV: Double = sqrt(vX*vX + vY*vY)
                    let aX: Double = Double(self.anchorPointInPoints().x) + vX / magV * Double(self.thumbNode.size.width)
                    let aY: Double = Double(self.anchorPointInPoints().y) + vY / magV * Double(self.thumbNode.size.width)
                    self.thumbNode.position = CGPoint(x: CGFloat(aX), y: CGFloat(aY))
                    
                    
                    
                    
                    self.AX = aX
                    self.AY = aY
                    
                    
                    //--
                    if ((aY > 0) && (aX > -40)) &&
                        ((aY > 0) && (aX < 40))
                    {

                        if aY > 75 {
//                            moveUP()
                        } else {
                            faceUP()
                        }
                    }
                        
                        
                    else if ((aY > 0) && (aX < -70)) &&
                        ((aX < 0) && (aY > 70))
                    {
                        if aY > 75 {
//                            moveUL()
                        }
                        
                    }
                    else if ((aY > 0) && (aX > 70)) &&
                        ((aX > 0) && (aY > 70))
                    {
                        if aY > 75 {
//                            moveUR()
                        }
                        
                    }
                    else if ((aY < 0) && (aX < -70)) &&
                        ((aX < 0) && (aY < -70))
                    {
                        if aY < -120 {
//                            moveDL()
                        }
                        
                    }
                    else if ((aY < 0) && (aX > 70)) &&
                        ((aX > 0) && (aY < -70))
                    {
                        if aY < -70 {
//                            moveDR()
                        }
                    }
                        
                    else if ((aY < 0) && (aX > -40)) &&
                        ((aY < 0) && (aX < 40))
                    {
                        if aY < -75 {
//                            moveDOWN()
                        } else {
                            faceDOWN()
                        }
                    }
                    else if ((aY < 40) && (aX < 0)) &&
                        ((aY > -40) && (aX < 0))
                    {
                        if aX < -75 {
//                            moveLEFT()
                        } else {
                            faceLEFT()
                        }
                    }
                    else if ((aY < 40) && (aX > 0)) &&
                        ((aY > -40) && (aX > 0))
                    {
                        if aX > 75 {
//                            moveRIGHT()
                        } else {
                            faceRIGHT()
                        }
                    }
                    
                    
                    
                }
            }
            self.velocity = CGPoint(x: ((self.thumbNode.position.x - self.anchorPointInPoints().x)), y: ((self.thumbNode.position.y - self.anchorPointInPoints().y)))
            self.angularVelocity = -atan2(self.thumbNode.position.x - self.anchorPointInPoints().x, self.thumbNode.position.y - self.anchorPointInPoints().y)
        }
    }

    override func removeFromParent() {
        JoystickTimer?.invalidate()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.resetVelocity()
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.resetVelocity()
    }
    
    func checkJoystickTimer() {
        
        if let x = AX {
            if let y = AY {

                if playerIsMoving != true {
                    if ((y > 0) && (x > -40)) &&
                        ((y > 0) && (x < 40))
                    {
                        moveUP()
                    }
                    else if ((y < 0) && (x > -40)) &&
                        ((y < 0) && (x < 40))
                    {
                        moveDOWN()
                    }
                    else if ((y < 40) && (x < 0)) &&
                        ((y > -40) && (x < 0))
                    {
                        print("LEFT: AX: \(AX), AY:\(AY)")
                        moveLEFT()
                    }
                    else if ((y < 40) && (x > 0)) &&
                        ((y > -40) && (x > 0))
                    {
                        moveRIGHT()
                    }
                        
                    else if ((y > 0) && (x < -90)) ||
                        ((x < 0) && (y > 90))
                    {
                        //                    if aY > 75 {
                        print("UL: AX: \(AX), AY:\(AY)")
                        moveUL()
                        //                    }
                        
                    }
                    else if ((y > 0) && (x > 90)) ||
                        ((x > 0) && (y > 90))
                    {
                        //                    if aY > 75 {
                        moveUR()
                        //                    }
                        
                    }
                    else if ((y < 0) && (x < -90)) ||
                        ((x < 0) && (y < -90))
                    {
                        //                    if aY < -120 {
                        moveDL()
                        print("DL: AX: \(AX), AY:\(AY)")
                        //                    }
                        
                    }
                    else if ((y < 0) && (x > 90)) ||
                        ((x > 0) && (y < -90))
                    {
                        moveDR()
                    }
                    
                    if let scene = gameSceneReference {
                        scene.updateDebugLabel()
                    }
                }

                
//                print("PLAYER LOCATION")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func faceUP() {
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-up", unitSuccessfullyMoved: { result in
                })
//            }
        }
    }
    func moveUP() {
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("up", unitSuccessfullyMoved: { result in
//                    self.playerIsMoving = false
            })
//            }
            runCoolDownTimer()
        }
    }
    
    func faceDOWN() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-down", unitSuccessfullyMoved: { result in
                })
            }
            
        }
    }
    func moveDOWN() {
//        self.playerIsMoving = true
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false {
            gameScene.didMoveJoystick("down", unitSuccessfullyMoved: { result in
//                self.playerIsMoving = false
            })
            }
            runCoolDownTimer()
        }
    }
    
    func faceLEFT() {
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-left", unitSuccessfullyMoved: { result in
//                    self.playerIsMoving = false
                })
//            }
        }
    }
    func moveLEFT() {
//        self.playerIsMoving = true
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("left", unitSuccessfullyMoved: { result in
//                    self.playerIsMoving = false
            })
//            }
            runCoolDownTimer()
        }
    }
    
    func faceRIGHT() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-right", unitSuccessfullyMoved: { result in
                })
            }
        }
    }
    func moveRIGHT() {
//        self.playerIsMoving = true
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false { gameScene.didMoveJoystick("right", unitSuccessfullyMoved: { result in
//                self.playerIsMoving = false
            })
            }
            runCoolDownTimer()
        }
    }
    
    
    
    func moveUL() {
//        self.playerIsMoving = true
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("ul", unitSuccessfullyMoved: { result in
//                    self.playerIsMoving = false
                })
//            }
        }
    }
    func moveUR() {
//        self.playerIsMoving = true
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("ur", unitSuccessfullyMoved: { result in
//                    self.playerIsMoving = false
                })
//            }

            

        }
    }
    
    func moveDL() {
//        self.playerIsMoving = true
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("dl", unitSuccessfullyMoved: { result in
//                    self.playerIsMoving = false
                })
//            }
        }
    }
    func moveDR() {
//        self.playerIsMoving = true
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("dr", unitSuccessfullyMoved: { result in
//                    self.playerIsMoving = false
                })
//            }
        }
    }
    
    //--
    func faceUPLEFT() {
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-ul", unitSuccessfullyMoved: { result in
                })
//            }
        }
    }
    func faceUPRIGHT() {
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-ur", unitSuccessfullyMoved: { result in
                })
//            }
        }
    }
    
    func faceDOWNLEFT() {
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-dl", unitSuccessfullyMoved: { result in
                })
//            }
        }
    }
    func faceDOWNRIGHT() {
        if let gameScene = self.gameSceneReference {
//            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-dr", unitSuccessfullyMoved: { result in
                })
//            }
        }
    }
    
    
    
    
    
    
    
    
    //==========================================
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func runCoolDownTimer() {
        if playerIsMoving == false {
            self.playerIsMoving = true
            Timer.scheduledTimer(
                timeInterval: 0.1,
                target: self,
                selector: #selector(Joystick.playerJustStoppedMoving),
                userInfo: nil,
                repeats: false
            );
        }
    }
    
    
    func playerJustStoppedMoving() {
        self.playerIsMoving = false
    }
    
    
    func resetVelocity() {
        self.isTracking = false
        self.velocity = CGPoint.zero
        let easeOut: SKAction = SKAction.move(to: self.anchorPointInPoints(), duration: kThumbSpringBackDuration)
        easeOut.timingMode = SKActionTimingMode.easeOut
        self.thumbNode.run(easeOut)
        
        self.AX = 0.0
        self.AY = 0.0
        
        if let gameScene = self.gameSceneReference {
            gameScene.resetPlayerTarget()
        }
    }
}
