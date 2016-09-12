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
    var velocity: CGPoint = CGPointMake(0, 0)
    var travelLimit: CGPoint = CGPointMake(0, 0)
    var angularVelocity: CGFloat = 0.0
    var size: Float = 0.0
    
    var AX: Double?
    var AY: Double?
    
    var gameSceneReference: GameScene?
    var JoystickTimer: NSTimer?
    
    func anchorPointInPoints() -> CGPoint {
        return CGPointMake(0, 0)
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
        
        self.userInteractionEnabled = true
        
        JoystickTimer = NSTimer.scheduledTimerWithTimeInterval(
            0.50,
            target: self,
            selector: Selector("checkJoystickTimer"),
            userInfo: nil,
            repeats: true
        );
    }
    
    func setGameSceneRef(gameScene: GameScene) {
        self.gameSceneReference = gameScene
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let touchPoint: CGPoint = touch.locationInNode(self)
            if self.isTracking == false && CGRectContainsPoint(self.thumbNode.frame, touchPoint) {
                self.isTracking = true
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let touchPoint: CGPoint = touch.locationInNode(self)
            print("touch point: \(touchPoint)")
            
            let x = touchPoint.x
            let y = touchPoint.y
            
            if ((y > 0) && (x > -40)) &&
                ((y > 0) && (x < 40))
            {
                if y > 75 {
//                    moveUP()
                } else {
                    faceUP()
                }
            }
            else if ((y < 0) && (x > -40)) &&
                ((y < 0) && (x < 40))
            {
                if y < -75 {
//                    moveDOWN()
                } else {
                    faceDOWN()
                }
            }
            else if ((y < 40) && (x < 0)) &&
                ((y > -40) && (x < 0))
            {
                if x < -75 {
//                    moveLEFT()
                } else {
                    faceLEFT()
                }
            }
            else if ((y < 40) && (x > 0)) &&
                ((y > -40) && (x > 0))
            {
                if x > 75 {
//                    moveRIGHT()
                } else {
                    faceRIGHT()
                }
            }
            
            
            if self.isTracking == true && sqrtf(powf((Float(touchPoint.x) - Float(self.thumbNode.position.x)), 2) + powf((Float(touchPoint.y) - Float(self.thumbNode.position.y)), 2)) < Float(self.thumbNode.size.width) {
                if sqrtf(powf((Float(touchPoint.x) - Float(self.anchorPointInPoints().x)), 2) + powf((Float(touchPoint.y) - Float(self.anchorPointInPoints().y)), 2)) <= Float(self.thumbNode.size.width) {
                    let moveDifference: CGPoint = CGPointMake(touchPoint.x - self.anchorPointInPoints().x, touchPoint.y - self.anchorPointInPoints().y)
                    self.thumbNode.position = CGPointMake(self.anchorPointInPoints().x + moveDifference.x, self.anchorPointInPoints().y + moveDifference.y)
                    
                    print("YOOOOO")
                } else {
                    let vX: Double = Double(touchPoint.x) - Double(self.anchorPointInPoints().x)
                    let vY: Double = Double(touchPoint.y) - Double(self.anchorPointInPoints().y)
                    let magV: Double = sqrt(vX*vX + vY*vY)
                    let aX: Double = Double(self.anchorPointInPoints().x) + vX / magV * Double(self.thumbNode.size.width)
                    let aY: Double = Double(self.anchorPointInPoints().y) + vY / magV * Double(self.thumbNode.size.width)
                    self.thumbNode.position = CGPointMake(CGFloat(aX), CGFloat(aY))
                    
                    
                    
                    
                    self.AX = aX
                    self.AY = aY
                    
                    
                    //--
                    if ((aY > 0) && (aX > -40)) &&
                        ((aY > 0) && (aX < 40))
                    {
                        print(" \(aX) \(aY) ")
                        if aY > 75 {
                            moveUP()
                        } else {
                            faceUP()
                        }
                    }
                    else if ((aY < 0) && (aX > -40)) &&
                        ((aY < 0) && (aX < 40))
                    {
                        if aY < -75 {
                            moveDOWN()
                        } else {
                            faceDOWN()
                        }
                    }
                    else if ((aY < 40) && (aX < 0)) &&
                        ((aY > -40) && (aX < 0))
                    {
                        if aX < -75 {
                            moveLEFT()
                        } else {
                            faceLEFT()
                        }
                    }
                    else if ((aY < 40) && (aX > 0)) &&
                        ((aY > -40) && (aX > 0))
                    {
                        if aX > 75 {
                            moveRIGHT()
                        } else {
                            faceRIGHT()
                        }
                    }
                    
                    //--
                    
                    
//                    if aY > 0 && aY < 20 {
//                        faceUP()
//                    } else if aY > 20 {
//                        moveUP()
//                    }
//                    else if aY < 0 && aY > -20{
//                        faceDOWN()
//                    }
//                    else if aY < -20 {
//                        moveDOWN()
//                    }
//                    else if aX > 0 && aX < 20 {
//                        faceRIGHT()
//                    }
//                    else if aX > 20 {
//                        moveRIGHT()
//                    }
//                    else if aX < 0 && aX > -20 {
//                        faceLEFT()
//                    }
//                    else if aX < -20 {
//                        moveLEFT()
//                    }
                }
            }
            self.velocity = CGPointMake(((self.thumbNode.position.x - self.anchorPointInPoints().x)), ((self.thumbNode.position.y - self.anchorPointInPoints().y)))
            self.angularVelocity = -atan2(self.thumbNode.position.x - self.anchorPointInPoints().x, self.thumbNode.position.y - self.anchorPointInPoints().y)
        }
    }

    override func removeFromParent() {
        JoystickTimer?.invalidate()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.resetVelocity()
    }

    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        self.resetVelocity()
    }
    
    func checkJoystickTimer() {
        if let x = AX {
            if let y = AY {

                
                if ((y > 0) && (x > -40)) &&
                    ((y > 0) && (x < 40))
                {
//                    if y > 75 {
                        moveUP()
//                    } else {
//                        faceUP()
//                    }
                }
                else if ((y < 0) && (x > -40)) &&
                    ((y < 0) && (x < 40))
                {
//                    if y < -75 {
                        moveDOWN()
//                    } else {
//                        faceDOWN()
//                    }
                }
                else if ((y < 40) && (x < 0)) &&
                    ((y > -40) && (x < 0))
                {
//                    if x < -75 {
                        moveLEFT()
//                    } else {
//                        faceLEFT()
//                    }
                }
                else if ((y < 40) && (x > 0)) &&
                    ((y > -40) && (x > 0))
                {
//                    if x > 75 {
                        moveRIGHT()
//                    } else {
//                        faceRIGHT()
//                    }
                }

                /*
                if y > 80 {
                    moveUP()
                }
                
//                else if y > 80 {
//                    moveUP()
//                }
                
                    
//                else if y < -19 && y > -20{
//                    faceDOWN()
//                }
                else if y < -80 {
                    moveDOWN()
                }
                
//                else if x > 10 {
//                    faceRIGHT()
//                }
                else if x > 80 {
                    moveRIGHT()
                }
                
//                else if x < -10 {
//                    faceLEFT()
//                }
                else if x < -80 {
                    moveLEFT()
                }
 */
            }
        }
    }
    
    var playerIsMoving = false
    
    
    func faceUP() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-up")
            }
        }
    }
    func moveUP() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false { gameScene.didMoveJoystick("up") }
            runCoolDownTimer()
        }
    }
    
    func faceDOWN() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-down")
            }
        }
    }
    func moveDOWN() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false { gameScene.didMoveJoystick("down") }
            runCoolDownTimer()
        }
    }
    
    func faceLEFT() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-left")
            }
        }
    }
    func moveLEFT() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false { gameScene.didMoveJoystick("left") }
            runCoolDownTimer()
        }
    }
    
    func faceRIGHT() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-right")
            }
        }
    }
    func moveRIGHT() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false { gameScene.didMoveJoystick("right") }
            runCoolDownTimer()
        }
    }
    //--
    func faceUPLEFT() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-ul")
            }
        }
    }
    func faceUPRIGHT() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-ur")
            }
        }
    }
    
    func faceUPLEFT() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-ul")
            }
        }
    }
    func faceUPRIGHT() {
        if let gameScene = self.gameSceneReference {
            if self.playerIsMoving == false {
                gameScene.didMoveJoystick("face-ur")
            }
        }
    }
    
    
    
    func runCoolDownTimer() {
        if playerIsMoving == false {
            self.playerIsMoving = true
            NSTimer.scheduledTimerWithTimeInterval(
                0.20,
                target: self,
                selector: Selector("playerJustStoppedMoving"),
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
        self.velocity = CGPointZero
        var easeOut: SKAction = SKAction.moveTo(self.anchorPointInPoints(), duration: kThumbSpringBackDuration)
        easeOut.timingMode = SKActionTimingMode.EaseOut
        self.thumbNode.runAction(easeOut)
        
        self.AX = 0.0
        self.AY = 0.0
        
        if let gameScene = self.gameSceneReference {
            gameScene.resetPlayerTarget()
        }
    }
}