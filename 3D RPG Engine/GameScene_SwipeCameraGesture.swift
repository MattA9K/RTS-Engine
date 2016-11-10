//
//  GameScene_SwipeCameraGesture.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/10/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



extension GameScene {
    
    func initializeSwipeToPanCameraEventHandler() {
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedRight))
        swipeRight.direction = .right
        view?.addGestureRecognizer(swipeRight)
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedLeft))
        swipeLeft.direction = .left
        view?.addGestureRecognizer(swipeLeft)
        
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedUp))
        swipeUp.direction = .up
        view?.addGestureRecognizer(swipeUp)
        
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedDown))
        swipeDown.direction = .down
        view?.addGestureRecognizer(swipeDown)

    }
    
    
    func moveUIUp() {
        func waitForCompletion(_ exitFunction: (Bool) -> ()) {
            self.anchorPoint.y += 50.0 / self.size.height
            self.spriteControlPanel?.moveByYNegative()
            exitFunction(true)
        }
        
        waitForCompletion({ _ in
            Thread.sleep(forTimeInterval: 0.1)
            waitForCompletion({ _ in
                Thread.sleep(forTimeInterval: 0.1)
                waitForCompletion({ _ in
                    
                })
            })
        })
        
    }
    func moveUIDown() {
        func waitForCompletion(_ exitFunction: (Bool) -> ()) {
            self.anchorPoint.y -= 50.0 / self.size.height
            self.spriteControlPanel?.moveByYPositive()
            exitFunction(true)
        }
        
        waitForCompletion({ _ in
            Thread.sleep(forTimeInterval: 0.1)
            waitForCompletion({ _ in
                Thread.sleep(forTimeInterval: 0.1)
                waitForCompletion({ _ in
                    
                })
            })
        })
        
    }
    func moveUILeft() {
        func waitForCompletion(_ exitFunction: (Bool) -> ()) {
            self.spriteControlPanel?.moveByXPositive()
            self.anchorPoint.x -= 50.0 / self.size.width
            exitFunction(true)
        }
        
        waitForCompletion({ _ in
            Thread.sleep(forTimeInterval: 0.1)
            waitForCompletion({ _ in
                Thread.sleep(forTimeInterval: 0.1)
                waitForCompletion({ _ in
                    
                })
            })
        })
        
        var totalSlides = 5
        while totalSlides > -1 {
            totalSlides -= 1
            
        }
        
    }
    func moveUIRight() {
        func waitForCompletion(_ exitFunction: (Bool) -> ()) {
            self.spriteControlPanel?.moveByXNegative()
            self.anchorPoint.x += 50.0 / self.size.width
            exitFunction(true)
        }
        
        waitForCompletion({ _ in
            Thread.sleep(forTimeInterval: 0.1)
            waitForCompletion({ _ in
                Thread.sleep(forTimeInterval: 0.1)
                waitForCompletion({ _ in
                    
                })
            })
        })
        var totalSlides = 5
        while totalSlides > -1 {
            totalSlides -= 1
            
        }
    }
    
    func swipedRight(_ sender:UISwipeGestureRecognizer) {
        swipeActivated += 1
        if self.swipeActivated > 6 {
            moveUIRight()
        }
    }
    func swipedLeft(_ sender:UISwipeGestureRecognizer) {
        swipeActivated += 1
        if self.swipeActivated > 6 {
            moveUILeft()
        }
        
    }
    func swipedUp(_ sender:UISwipeGestureRecognizer) {
        swipeActivated += 1
        if self.swipeActivated > 6 {
            moveUIUp()
        }
        
    }
    func swipedDown(_ sender:UISwipeGestureRecognizer) {
        swipeActivated += 1
        if self.swipeActivated > 6 {
            moveUIDown()
        }
        
    }
}
