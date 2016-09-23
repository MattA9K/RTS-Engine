//
//  SKSpellSprite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 9/22/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


class SKSpellSprite: SKSpriteNode {
    
    func animateLoop() {
        
    }
    
    func animateOnce() {
        
    }
}

class SKIceTimedBomb: SKSpellSprite {

    override func animateLoop() {
        self.texture = SKTexture(imageNamed: "bomb-blue-4")
        
        let frame1 = SKTexture(imageNamed: "bomb-blue-1")
        let frame2 = SKTexture(imageNamed: "bomb-blue-2")
        let frame3 = SKTexture(imageNamed: "bomb-blue-3")
        let frame4 = SKTexture(imageNamed: "bomb-blue-4")
        let allFrames = [frame1, frame2, frame3, frame4]
        
        self.runAction(
            SKAction.repeatAction(SKAction.animateWithTextures(allFrames, timePerFrame: 0.05), count: 20)
        )
    }
    
    override func animateOnce() {
        self.texture = SKTexture(imageNamed: "bomb-blue-1")
        
        let frame1 = SKTexture(imageNamed: "")
        let frame2 = SKTexture(imageNamed: "")
        let frame3 = SKTexture(imageNamed: "")
        let frame4 = SKTexture(imageNamed: "")
        let frame5 = SKTexture(imageNamed: "")
        let frame6 = SKTexture(imageNamed: "")
        let frame7 = SKTexture(imageNamed: "")
        let frame8 = SKTexture(imageNamed: "")
    }
}



class SKFrostExplosion: SKSpellSprite {
    
    override func animateOnce() {
        self.texture = SKTexture(imageNamed: "explosion-blue-1")
        
        let frame1 = SKTexture(imageNamed: "explosion-blue-1")
        let frame2 = SKTexture(imageNamed: "explosion-blue-2")
        let frame3 = SKTexture(imageNamed: "explosion-blue-3")
        let frame4 = SKTexture(imageNamed: "explosion-blue-4")
        let frame5 = SKTexture(imageNamed: "explosion-blue-5")
        let frame6 = SKTexture(imageNamed: "explosion-blue-6")
        let frame7 = SKTexture(imageNamed: "explosion-blue-7")
        let frame8 = SKTexture(imageNamed: "explosion-blue-8")
        let allFrames = [frame1, frame2, frame3, frame4, frame5, frame6, frame7, frame8]
        
        self.runAction(
            SKAction.animateWithTextures(allFrames, timePerFrame: 0.05), completion: {
                self.removeFromParent()
        })
    }
}

class SKIcicleExplosion: SKSpellSprite {
    override func animateOnce() {
        self.texture = SKTexture(imageNamed: "iceicle-blue-crashed-1")
        
        let frame1 = SKTexture(imageNamed: "iceicle-blue-crashed-1")
        let frame2 = SKTexture(imageNamed: "iceicle-blue-crashed-2")
        let frame3 = SKTexture(imageNamed: "iceicle-blue-crashed-3")
        let frame4 = SKTexture(imageNamed: "iceicle-blue-crashed-4")

        let allFrames = [frame1, frame2, frame3, frame4]
        
        self.runAction(
            SKAction.animateWithTextures(allFrames, timePerFrame: 0.05), completion: {
                self.removeFromParent()
        })
    }
    
    func engageTargetAndWait(target: CGPoint, duration: Double, completion: () -> Void) {
        self.runAction(SKAction.moveTo(target, duration: duration), completion: {
            completion()
        })
    }
}

class SKFrostBolt: SKSpellSprite {
    func animateFrostBolt(direction: MissileDirection) {
        var stringNameDirection : String
        if direction == .UP {
            stringNameDirection = "up"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.runAction(
                SKAction.repeatAction(SKAction.animateWithTextures(allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .DOWN {
            stringNameDirection = "down"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.runAction(
                SKAction.repeatAction(SKAction.animateWithTextures(allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .LEFT {
            stringNameDirection = "left"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.runAction(
                SKAction.repeatAction(SKAction.animateWithTextures(allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .RIGHT {
            stringNameDirection = "right"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.runAction(
                SKAction.repeatAction(SKAction.animateWithTextures(allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .UL {
            stringNameDirection = "ul"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.runAction(
                SKAction.repeatAction(SKAction.animateWithTextures(allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .UR {
            stringNameDirection = "ur"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.runAction(
                SKAction.repeatAction(SKAction.animateWithTextures(allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .DL {
            stringNameDirection = "dl"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.runAction(
                SKAction.repeatAction(SKAction.animateWithTextures(allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .DR {
            stringNameDirection = "dr"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.runAction(
                SKAction.repeatAction(SKAction.animateWithTextures(allFrames, timePerFrame: 0.05), count: 40)
            )
        }
    }
    
    func engageTarget(target: CGPoint) {
        self.runAction(SKAction.moveTo(target, duration: 1.0), completion: {
            self.texture = SKTexture(imageNamed: "AttackBullet6")
            self.size = CGSizeMake(20, 20)
            self.runAction(SKAction.fadeOutWithDuration(0.3))
        })
    }
}























enum MissileDirection {
    case UP, DOWN, LEFT, RIGHT,
    UL, UR, DL, DR;
}

struct MissleDestinationCalculator {
    var FinalDestination: CGPoint = CGPointMake(0, 0)
    var Distance: CGFloat = 0
    
    
    init(x: CGFloat, y: CGFloat, distance: CGFloat, movingInDirection: MissileDirection) {
        self.Distance = distance
        if movingInDirection == .UP {
            self.FinalDestination.x = x
            self.FinalDestination.y = (y + self.Distance)
        }
        else if movingInDirection == .DOWN {
            self.FinalDestination.x = x
            self.FinalDestination.y = (self.Distance - y) * -1
        }
        else if movingInDirection == .LEFT {
            self.FinalDestination.x = (self.Distance - x) * -1
            self.FinalDestination.y = y
        }
        else if movingInDirection == .RIGHT {
            self.FinalDestination.x = (x + self.Distance)
            self.FinalDestination.y = y
        }
        else if movingInDirection == .UL {
            self.FinalDestination.x = (self.Distance - x) * -1
            self.FinalDestination.y = (y + self.Distance)
        }
        else if movingInDirection == .UR {
            self.FinalDestination.x = (x + self.Distance)
            self.FinalDestination.y = (y + self.Distance)
        }
        else if movingInDirection == .DL {
            self.FinalDestination.x = (self.Distance - x) * -1
            self.FinalDestination.y = (self.Distance - y) * -1
        }
        else if movingInDirection == .DR {
            self.FinalDestination.x = (x + self.Distance)
            self.FinalDestination.y = (self.Distance - y) * -1
        }
    }
    
}