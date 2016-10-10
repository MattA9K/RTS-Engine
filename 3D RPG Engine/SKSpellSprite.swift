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
        
        self.run(
            SKAction.repeat(SKAction.animate(with: allFrames, timePerFrame: 0.05), count: 20)
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
        
        self.run(
            SKAction.animate(with: allFrames, timePerFrame: 0.05), completion: {
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
        
        self.run(
            SKAction.animate(with: allFrames, timePerFrame: 0.05), completion: {
                self.removeFromParent()
        })
    }
    
    func engageTargetAndWait(_ target: CGPoint, duration: Double, completion: @escaping () -> Void) {
        self.run(SKAction.move(to: target, duration: duration), completion: {
            completion()
        })
    }
}

class SKFrostBolt: SKSpellSprite {
    func animateFrostBolt(_ direction: MissileDirection) {
        var stringNameDirection : String
        if direction == .up {
            stringNameDirection = "up"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.run(
                SKAction.repeat(SKAction.animate(with: allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .down {
            stringNameDirection = "down"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.run(
                SKAction.repeat(SKAction.animate(with: allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .left {
            stringNameDirection = "left"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.run(
                SKAction.repeat(SKAction.animate(with: allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .right {
            stringNameDirection = "right"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.run(
                SKAction.repeat(SKAction.animate(with: allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .ul {
            stringNameDirection = "ul"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.run(
                SKAction.repeat(SKAction.animate(with: allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .ur {
            stringNameDirection = "ur"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.run(
                SKAction.repeat(SKAction.animate(with: allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .dl {
            stringNameDirection = "dl"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.run(
                SKAction.repeat(SKAction.animate(with: allFrames, timePerFrame: 0.05), count: 40)
            )
        }
        else if direction == .dr {
            stringNameDirection = "dr"
            let frame1Name = "bolt-" + stringNameDirection + "-1"
            let frame2Name = "bolt-" + stringNameDirection + "-2"
            self.texture = SKTexture(imageNamed: frame1Name)
            let frame1 = SKTexture(imageNamed: frame1Name)
            let frame2 = SKTexture(imageNamed: frame2Name)
            let allFrames = [frame1, frame2]
            self.run(
                SKAction.repeat(SKAction.animate(with: allFrames, timePerFrame: 0.05), count: 40)
            )
        }
    }
    
    func engageTarget(_ target: CGPoint) {
        self.run(SKAction.move(to: target, duration: 1.0), completion: {
            self.texture = SKTexture(imageNamed: "AttackBullet6")
            self.size = CGSize(width: 20, height: 20)
            self.run(SKAction.fadeOut(withDuration: 0.3))
        })
    }
}























enum MissileDirection {
    case up, down, left, right,
    ul, ur, dl, dr;
}

struct MissleDestinationCalculator {
    var FinalDestination: CGPoint = CGPoint(x: 0, y: 0)
    var Distance: CGFloat = 0
    
    
    init(x: CGFloat, y: CGFloat, distance: CGFloat, movingInDirection: MissileDirection) {
        self.Distance = distance
        if movingInDirection == .up {
            self.FinalDestination.x = x
            self.FinalDestination.y = (y + self.Distance)
        }
        else if movingInDirection == .down {
            self.FinalDestination.x = x
            self.FinalDestination.y = (self.Distance - y) * -1
        }
        else if movingInDirection == .left {
            self.FinalDestination.x = (self.Distance - x) * -1
            self.FinalDestination.y = y
        }
        else if movingInDirection == .right {
            self.FinalDestination.x = (x + self.Distance)
            self.FinalDestination.y = y
        }
        else if movingInDirection == .ul {
            self.FinalDestination.x = (self.Distance - x) * -1
            self.FinalDestination.y = (y + self.Distance)
        }
        else if movingInDirection == .ur {
            self.FinalDestination.x = (x + self.Distance)
            self.FinalDestination.y = (y + self.Distance)
        }
        else if movingInDirection == .dl {
            self.FinalDestination.x = (self.Distance - x) * -1
            self.FinalDestination.y = (self.Distance - y) * -1
        }
        else if movingInDirection == .dr {
            self.FinalDestination.x = (x + self.Distance)
            self.FinalDestination.y = (self.Distance - y) * -1
        }
    }
    
}
