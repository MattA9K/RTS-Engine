//
//  SKAbstractSprite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/6/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



let ARRAY_OF_COLORS : [UIColor] = [.black, .green, .purple, .orange, .yellow]
let RANDOM_COLOR_1 : UIColor = ARRAY_OF_COLORS[Int(arc4random_uniform(UInt32(ARRAY_OF_COLORS.count)))]


class SKAbstractSprite: SKMapSprite, AbstractSpriteProtocol {

    var UnitReference: AbstractUnit?
    
    let AnimationDuration_WALK = 0.07
    let AnimationDuration_ATTACK = 0.07
    let AnimationDuration_DEATH = 0.09
    
    var deathSound = "Hdead.wav"
    
    // ATTACK
    var attackUp_Frames: [SKTexture] = [];
    var attackDown_Frames: [SKTexture] = [];
    var attackLeft_Frames: [SKTexture] = [];
    var attackRight_Frames: [SKTexture] = [];
    
    var attackUpRight_Frames: [SKTexture] = [];
    var attackUpLeft_Frames: [SKTexture] = [];
    
    var attackDownLeft_Frames: [SKTexture] = [];
    var attackDownRight_Frames: [SKTexture] = [];
    
    var walkUp_Frames: [SKTexture] = [];
    var walkDown_Frames: [SKTexture] = [];
    var walkLeft_Frames: [SKTexture] = [];
    var walkRight_Frames: [SKTexture] = [];
    
    var walkUL_Frames: [SKTexture] = [];
    var walkUR_Frames: [SKTexture] = [];
    
    var walkDL_Frames: [SKTexture] = [];
    var walkDR_Frames: [SKTexture] = [];
    
    var deathUp_Frames: [SKTexture] = [];
    var deathDown_Frames: [SKTexture] = [];
    
    // TODO:
    
    // do something like:
    
    //
    // if self is SKFootmanSprite
    //
    // var castedUnit = (self as! SKFootmanSprite)
    // castedUnit.playWalkUPAnimation()
    //
    
    
    
    func playFaceAnimation(direction: UnitFaceAngle) {
        
        switch direction {
            
        case .up:
            self.run(
                SKAction.animate(
                    with: [walkUp_Frames[0]],
                    timePerFrame: AnimationDuration_WALK
            ))
        case .down:
            self.run(
                SKAction.animate(
                    with: [walkDown_Frames[0]],
                    timePerFrame: AnimationDuration_WALK
            ))
        case .left:
            self.run(
                SKAction.animate(
                    with: [walkLeft_Frames[0]],
                    timePerFrame: AnimationDuration_WALK
            ))
        case .right:
            self.run(
                SKAction.animate(
                    with: [walkRight_Frames[0]],
                    timePerFrame: AnimationDuration_WALK
            ))
            
        case .ul:
            self.run(
                SKAction.animate(
                    with: [walkUL_Frames[0]],
                    timePerFrame: AnimationDuration_WALK
            ))
        case .ur:
            self.run(
                SKAction.animate(
                    with: [walkUR_Frames[0]],
                    timePerFrame: AnimationDuration_WALK
            ))
        case .dl:
            self.run(
                SKAction.animate(
                    with: [walkDL_Frames[0]],
                    timePerFrame: AnimationDuration_WALK
            ))
        case .dr:
            self.run(
                SKAction.animate(
                    with: [walkDR_Frames[0]],
                    timePerFrame: AnimationDuration_WALK
            ))
            
        default:
            print()
        }
    }
    
    func playWalkAnimation(direction: UnitFaceAngle, completionHandler: @escaping (Void) -> ()) -> () {
        switch direction {
        case .up:
            let action = SKAction.animate(with: walkUp_Frames, timePerFrame: AnimationDuration_WALK)
            self.run(action, completion: { completionHandler() })
        case .down:
            let action = SKAction.animate(with: walkDown_Frames, timePerFrame: AnimationDuration_WALK)
            self.run(action, completion: { completionHandler() })
        case .left:
            let action = SKAction.animate(with: walkLeft_Frames, timePerFrame: AnimationDuration_WALK)
            self.run(action, completion: { completionHandler() })
        case .right:
            let action = SKAction.animate(with: walkRight_Frames, timePerFrame: AnimationDuration_WALK)
            self.run(action, completion: { completionHandler() })
        case .ul:
            let action = SKAction.animate(with: walkUL_Frames, timePerFrame: AnimationDuration_WALK)
            self.run(action, completion: { completionHandler() })
        case .ur:
            let action = SKAction.animate(with: walkUR_Frames, timePerFrame: AnimationDuration_WALK)
            self.run(action, completion: { completionHandler() })
        case .dl:
            let action = SKAction.animate(with: walkDL_Frames, timePerFrame: AnimationDuration_WALK)
            self.run(action, completion: { completionHandler() })
        case .dr:
            let action = SKAction.animate(with: walkDR_Frames, timePerFrame: AnimationDuration_WALK)
            self.run(action, completion: { completionHandler() })
        default:
            print("ohhh....")
        }
    }
    
    func playAttackAnimation(direction: UnitFaceAngle, completionHandler: @escaping (Void) -> ()) -> () {
        switch direction {
        case .up:
            let action = SKAction.animate(with: attackUp_Frames, timePerFrame: AnimationDuration_ATTACK)
            self.run(action, completion: { completionHandler() })
        case .down:
            let action = SKAction.animate(with: attackDown_Frames, timePerFrame: AnimationDuration_ATTACK)
            self.run(action, completion: { completionHandler() })
        case .left:
            let action = SKAction.animate(with: attackLeft_Frames, timePerFrame: AnimationDuration_ATTACK)
            self.run(action, completion: { completionHandler() })
        case .right:
            let action = SKAction.animate(with: attackRight_Frames, timePerFrame: AnimationDuration_ATTACK)
            self.run(action, completion: { completionHandler() })
        case .ul:
            let action = SKAction.animate(with: attackUpLeft_Frames, timePerFrame: AnimationDuration_ATTACK)
            self.run(action, completion: { completionHandler() })
        case .ur:
            let action = SKAction.animate(with: attackUpRight_Frames, timePerFrame: AnimationDuration_ATTACK)
            self.run(action, completion: { completionHandler() })
        case .dl:
            let action = SKAction.animate(with: attackDownLeft_Frames, timePerFrame: AnimationDuration_ATTACK)
            self.run(action, completion: { completionHandler() })
        case .dr:
            let action = SKAction.animate(with: attackDownRight_Frames, timePerFrame: AnimationDuration_ATTACK)
            self.run(action, completion: { completionHandler() })
        default:
            print("ohhh....")
        }
    }
    
    
    func playDeathAnimation(_ completionHandler: @escaping (Bool) -> ()) -> () {
        
        var deathSound = "Odead.wav";
        if self is SKFootmanSprite {
            deathSound = "Hdead.wav";
        }
        else if self is SKSpearThrowerSprite {
            deathSound = "Odead.wav";
        }
        else if self is SKGruntLvl1 {
            deathSound = "Odead.wav";
        }
        else if self is SKGruntLvl2 {
            deathSound = "Odead.wav";
        }
        
        let action = SKAction.animate(
            with: deathUp_Frames, timePerFrame:
            AnimationDuration_DEATH
        )
        
        self.UnitReference!.ReferenceOfGameScene.run(
            SKAction.playSoundFileNamed(
                deathSound,
                waitForCompletion: false
            )
        )
        
        self.run(action, completion: {
            completionHandler(true)
        })
    }
    
    func FixDeathAnimationHack() {

        let finalDeathFrame = self.deathUp_Frames.count - 1
        
        let DeadBodyActiom = SKAction.animate(
            with: [deathUp_Frames[finalDeathFrame]], timePerFrame:
            AnimationDuration_ATTACK
        )
        
        self.run(DeadBodyActiom, completion: {
            self.run(DeadBodyActiom)
            self.zPosition = 1
        })
        
        
        let delayAction = SKAction.wait(forDuration: 1.32)
        self.run(delayAction, completion: {
            self.run(DeadBodyActiom)
        })

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let unit = self.UnitReference {
            unit.ReferenceOfGameScene.UnitWasSelectedByThePlayer(unit)
        }
    }
    
    func walkUpSequence() {}
    func walkDownSequence() {}
    func walkLeftSequence() {}
    func walkRightSequence() {}
}
