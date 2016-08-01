//
//  SKFootmanSprite_C.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/18/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


extension SKFootmanSprite {
    
    func loadTextures() {
        attackUp_Frames = getAttackUPSequence_Frames()
        attackDown_Frames = getAttackDOWNSequence_Frames()
        attackLeft_Frames = getAttackLEFTSequence_Frames()
        attackRight_Frames = getAttackRIGHTSequence_Frames()
        
        attackUpRight_Frames = getAttackUPRIGHTSequence_Frames()
        attackUpLeft_Frames = getAttackUPLEFTSequence_Frames()
        
        attackDownLeft_Frames = getAttackDOWNLEFTSequence_Frames()
        attackDownRight_Frames = getAttackDOWNRIGHTSequence_Frames()
        
        
        walkUp_Frames = getWalkUpSequence_Frames()
        walkDown_Frames = getWalkDownSequence_Frames()
        walkLeft_Frames = getWalkLeftSequence_Frames()
        walkRight_Frames = getWalkRightSequence_Frames()
        
        deathUp_Frames = getDeathSequence_Frames()
    }


    private func imageAlter(fromOriginalImage image: UIImage, withHue hue: CGFloat) -> UIImage
    {
        let rect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: image.size)

        UIGraphicsBeginImageContext(image.size)

        let context = UIGraphicsGetCurrentContext()

        CGContextTranslateCTM(context, 0.0, image.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)

        CGContextDrawImage(context, rect, image.CGImage)

        CGContextSetBlendMode(context, CGBlendMode.Hue)

        CGContextClipToMask(context, rect, image.CGImage)

        CGContextSetFillColorWithColor(context,
                UIColor(red:1.00, green:1.00, blue:0.00, alpha:1.0).CGColor
        )

        CGContextFillRect(context, rect)

        let colouredImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()


        return colouredImage
    }
    private func AlteredTexture(imageNamed image: String) -> SKTexture {
        if unitIdentifier == "footman" {
            return SKTexture(imageNamed: image)
        } else {
            let oldImage = UIKit.UIImage(named: image)
            if let img = oldImage {
                let newImage = imageAlter(fromOriginalImage: oldImage!, withHue: 0.5)
                return SKTexture(image: newImage)
            } else {
                return SKTexture(imageNamed: image)
            }
        }
    }
    
    
    // DEATH HACK
    func playDeathHackAnimation() {
        
        print123("")
        print123("deathUp_Frames : \(deathUp_Frames) \n " +
        "deathUp_Frames.endIndex : \(deathUp_Frames.endIndex) \n " +
        "deathUp_Frames.count : \(deathUp_Frames.count) \n ")

        
        self.runAction(
            SKAction.animateWithTextures(
                [deathUp_Frames[deathUp_Frames.endIndex - 1]],
                timePerFrame: AnimationDuration_WALK)
        );
    }

    
    // WALKING
    override func playWalkUPAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                walkUp_Frames, timePerFrame: AnimationDuration_WALK))
    }
    override func playWalkDOWNAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                walkDown_Frames, timePerFrame: AnimationDuration_WALK))
    }
    override func playWalkLEFTAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                walkLeft_Frames, timePerFrame: AnimationDuration_WALK))
    }
    override func playWalkRIGHTAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                walkRight_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    
    // --------------------------------------------------------------------------------------------------------
    
    
    override func playFaceDownAnimation() {
        let imageName = "footman_down_down"
        self.texture = AlteredTexture(imageNamed: imageName)
    }
    override func playFaceUpAnimation() {
        let imageName = "footman_up_stand"
        self.texture = AlteredTexture(imageNamed: imageName)
    }
    override func playFaceLeftAnimation() {
        let imageName = "footman_left_walk03"
        self.texture = AlteredTexture(imageNamed: imageName)
    }
    override func playFaceRightAnimation() {
        let imageName = "footman_right_stand"
        self.texture = AlteredTexture(imageNamed: imageName)
    }
    
    
    // --------------------------------------------------------------------------------------------------------
    
    

    
    // ATTACKING
    func getAttackUPSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "footman_attack_up0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footman_up_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackUPLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 8; i+=1 {
            let imageName = "footman_ul_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footman_ul_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    

    func getAttackUPRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 8; i+=1 {
            let imageName = "footman_ur_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footman_ur_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    

    func getAttackDOWNSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 8; i+=1 {
            let imageName = "footman_attack_down0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footman_down_down"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    

    func getAttackDOWNLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 8; i+=1 {
            let imageName = "footman_dl_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footman_dl_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    

    func getAttackDOWNRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 8; i+=1 {
            let imageName = "footman_attack_dr0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footman_dr_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    

    func getAttackLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 8; i+=1 {
            let imageName = "footman_left_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footman_left_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 8; i+=1 {
            let imageName = "footman_right_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footman_right_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    override func playAttackUPRIGHTAnimation() {
        runAction(
            SKAction.animateWithTextures(
                attackUpRight_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    
    override func playAttackUPAnimation() {
        self.runAction(
            SKAction.animateWithTextures(
                attackUp_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    
    override func playAttackUPLEFTAnimation() {
        runAction(
            SKAction.animateWithTextures(
                attackUpLeft_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    
    override func playAttackDOWNAnimation() {
        runAction(
            SKAction.animateWithTextures(
                attackDown_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    
    override func playAttackDOWNLEFTAnimation() {
        runAction(
            SKAction.animateWithTextures(
                attackDownLeft_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    
    override func playAttackDOWNRIGHTAnimation() {
        runAction(
            SKAction.animateWithTextures(
                attackDownRight_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    
    override func playAttackLEFTAnimation() {
        runAction(
            SKAction.animateWithTextures(
                attackLeft_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    
    override func playAttackRIGHTAnimation() {
        
        runAction(
            SKAction.animateWithTextures(
                attackRight_Frames, timePerFrame: AnimationDuration_ATTACK))
    }
    
    func getAttackSequence(inTheDirection: Walk) -> [SKTexture] {
        switch inTheDirection {
        case .Up:
            return getWalkUpSequence_Frames()
        default:
            return getWalkUpSequence_Frames()
        }
    }
    
    
    // --------------------------------------------------------------------------------------------------------
    
    
    //DEATH
    override func playDeathAnimation() {
//        super.playDeathAnimation()
        runAction(
            SKAction.animateWithTextures(
                deathUp_Frames, timePerFrame:
                AnimationDuration_ATTACK
            )
        )
        
    }
    

    func getDeathSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 5; i+=1 {
            let imageName = "footman_death_up0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        return textures
    }

    // --------------------------------------------------------------------------------------------------------
    
    enum Walk {
        case Up, Down, Left, Right, UpL, UpR, DownL, DownR;
    }
    
    func getWalkSequence(inTheDirection: Walk) -> [SKTexture] {
        switch inTheDirection {
        case .Up:
            return getWalkUpSequence_Frames()
        default:
            return getWalkUpSequence_Frames()
        }
    }
    //WALK FRAMES
    func getWalkUpSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = AlteredTexture(imageNamed: "footman_up_walk01")
        let imageName2 = AlteredTexture(imageNamed: "footman_up_walk02")
        let imageName3 = AlteredTexture(imageNamed: "footman_up_walk01")
        let imageName4 = AlteredTexture(imageNamed: "footman_up_stand")
        let imageName5 = AlteredTexture(imageNamed: "footman_up_walk03")
        let imageName6 = AlteredTexture(imageNamed: "footman_up_walk04")
        let imageName7 = AlteredTexture(imageNamed: "footman_up_walk03")
        let imageName8 = AlteredTexture(imageNamed: "footman_up_stand")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        textures.append(imageName5)
        textures.append(imageName6)
        textures.append(imageName7)
        textures.append(imageName8)
        
        return textures
    }
    
    
    func getWalkDownSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = AlteredTexture(imageNamed: "footman_walk_down01")
        let imageName2 = AlteredTexture(imageNamed: "footman_walk_down02")
        let imageName3 = AlteredTexture(imageNamed: "footman_down_down")
        let imageName4 = AlteredTexture(imageNamed: "footman_walk_down03")
        let imageName5 = AlteredTexture(imageNamed: "footman_walk_down04")
        let imageName6 = AlteredTexture(imageNamed: "footman_down_down")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        textures.append(imageName5)
        textures.append(imageName6)
        
        return textures
    }
    
    
    func getWalkLeftSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = AlteredTexture(imageNamed: "footman_left_walk01")
        let imageName2 = AlteredTexture(imageNamed: "footman_left_walk02")
        let imageName3 = AlteredTexture(imageNamed: "footman_left_walk01")
        let imageName4 = AlteredTexture(imageNamed: "footman_left_walk03")
        let imageName5 = AlteredTexture(imageNamed: "footman_left_walk04")
        let imageName6 = AlteredTexture(imageNamed: "footman_left_walk05")
        let imageName7 = AlteredTexture(imageNamed: "footman_left_walk04")
        let imageName8 = AlteredTexture(imageNamed: "footman_left_walk03")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        textures.append(imageName5)
        textures.append(imageName6)
        textures.append(imageName7)
        textures.append(imageName8)
        
        return textures
    }
    
    func getWalkRightSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = AlteredTexture(imageNamed: "footman_right_walk01")
        let imageName2 = AlteredTexture(imageNamed: "footman_right_walk02")
        let imageName3 = AlteredTexture(imageNamed: "footman_right_walk03")
        let imageName4 = AlteredTexture(imageNamed: "footman_right_walk04")
        let imageName5 = AlteredTexture(imageNamed: "footman_right_walk05")
        let imageName6 = AlteredTexture(imageNamed: "footman_right_stand")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        textures.append(imageName5)
        textures.append(imageName6)
        
        return textures
    }
}