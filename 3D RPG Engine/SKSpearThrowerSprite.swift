//
//  SKSpearThrowerSprite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class SKSpearThrowerSprite: SKAbstractSprite {
    
//    var UnitReference: SpearThrowerUnit!
    
    
    let AnimationDuration_WALK = 0.05
    
    // FRAMES FOR ANIMATION
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
    
    var deathUp_Frames: [SKTexture] = [];
    var deathDown_Frames: [SKTexture] = [];
    
    
    
    let AnimationDuration_ATTACK = 0.05
   
}





extension SKSpearThrowerSprite {
    
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
        
        deathUp_Frames = getDeathUpSequence_Frames()
        deathDown_Frames = getDeathDownSequence_Frames()
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
//        if unitIdentifier == "grunt" {
            return SKTexture(imageNamed: image)
//        }
//        else {
//            let oldImage = UIKit.UIImage(named: image)
//            if let img = oldImage {
//                let newImage = imageAlter(fromOriginalImage: oldImage!, withHue: 0.5)
//                return SKTexture(image: newImage)
//            } else {
//                return SKTexture(imageNamed: image)
//            }
//        }
    }
    
    
    // FACING
    override func playFaceDownAnimation() {
        let imageName = "spear_down_stand"
        self.texture = AlteredTexture(imageNamed: imageName)
    }
    override func playFaceUpAnimation() {
        let imageName = "spear_up_stand"
        self.texture = AlteredTexture(imageNamed: imageName)
    }
    override func playFaceLeftAnimation() {
        let imageName = "spear_left_stand"
        self.texture = AlteredTexture(imageNamed: imageName)
    }
    override func playFaceRightAnimation() {
        let imageName = "spear_right_stand"
        self.texture = AlteredTexture(imageNamed: imageName)
    }
    
    
    // WALKING
    override func playWalkUPAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkUpSequence()
        }
    }
    override func playWalkDOWNAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkDownSequence()
        }
    }
    override func playWalkLEFTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkLeftSequence()
        }
    }
    override func playWalkRIGHTAnimation() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            self.walkRightSequence()
        }
    }
    
    
    //DEATH
    override func playDeathAnimation() {
        //        super.playDeathAnimation()
        if self.UnitReference?.angleFacing == UnitFaceAngle.Up {
            self.runAction(SKAction.animateWithTextures(deathUp_Frames, timePerFrame: AnimationDuration_WALK))
        } else if self.UnitReference?.angleFacing == UnitFaceAngle.Down {
            self.runAction(SKAction.animateWithTextures(deathDown_Frames, timePerFrame: AnimationDuration_WALK))
        } else if self.UnitReference?.angleFacing == UnitFaceAngle.Right {
            self.runAction(SKAction.animateWithTextures(deathUp_Frames, timePerFrame: AnimationDuration_WALK))
        } else {
            self.runAction(SKAction.animateWithTextures(deathDown_Frames, timePerFrame: AnimationDuration_WALK))
        }
        
        
    }
    
    //
    override func playAttackUPLEFTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackUpLeft_Frames, timePerFrame: AnimationDuration_WALK))
        
    }
    
    //
    override func playAttackUPRIGHTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackUpRight_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    
    //
    override func playAttackDOWNAnimation() {
        self.runAction(SKAction.animateWithTextures(attackDown_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    
    //
    override func playAttackDOWNLEFTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackDownLeft_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    override func playAttackLEFTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackLeft_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    
    //
    override func playAttackRIGHTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackRight_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    override func walkUpSequence() {
        self.runAction(SKAction.animateWithTextures(walkUp_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    
   ////////////======== ---
    

    func getDeathDownSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        textures.append(AlteredTexture(imageNamed: "IMG_7066"))
        textures.append(AlteredTexture(imageNamed: "IMG_7067"))
        textures.append(AlteredTexture(imageNamed: "IMG_7068"))
        textures.append(AlteredTexture(imageNamed: "IMG_7069"))

        return textures
    }
    
    func getDeathUpSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        textures.append(AlteredTexture(imageNamed: "IMG_7070"))
        textures.append(AlteredTexture(imageNamed: "IMG_7071"))
        textures.append(AlteredTexture(imageNamed: "IMG_7072"))
        textures.append(AlteredTexture(imageNamed: "IMG_7073"))
        
        return textures
    }
    
    
    // ATTACKING
    func getAttackUPSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 5; i+=1 {
            let imageName = "spear_up_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spear_up_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    func getAttackUPLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 4; i+=1 {
            let imageName = "spear_ul_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spear_ul_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    
    func getAttackUPRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 4; i+=1 {
            let imageName = "spear_ur_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spear_ur_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackDOWNSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 4; i+=1 {
            let imageName = "spear_down_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spear_down_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackDOWNLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 4; i+=1 {
            let imageName = "spear_dl_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spear_dl_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    //
    override func playAttackDOWNRIGHTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackDownRight_Frames, timePerFrame: AnimationDuration_WALK))
    }
    func getAttackDOWNRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 4; i+=1 {
            let imageName = "spear_dr_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spear_dr_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    //
    
    func getAttackLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 4; i+=1 {
            let imageName = "spear_left_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spear_left_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 4; i+=1 {
            let imageName = "spear_right_attack0" + String(i)
            textures.append(AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spear_right_stand"
        textures.append(AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    //WALK FRAMES
    func getWalkUpSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = AlteredTexture(imageNamed: "spear_up_stand")
        let imageName2 = AlteredTexture(imageNamed: "spear_up_walk02")
        let imageName3 = AlteredTexture(imageNamed: "spear_up_walk01")
        let imageName4 = AlteredTexture(imageNamed: "spear_up_stand")
        let imageName5 = AlteredTexture(imageNamed: "spear_up_walk03")
        let imageName6 = AlteredTexture(imageNamed: "spear_up_stand")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        textures.append(imageName5)
        textures.append(imageName6)
        
        return textures
    }
    
    override func walkDownSequence() {
        self.runAction(SKAction.animateWithTextures(walkDown_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    func getWalkDownSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = AlteredTexture(imageNamed: "spear_down_stand")
        let imageName2 = AlteredTexture(imageNamed: "spear_down_walk02")
        let imageName3 = AlteredTexture(imageNamed: "spear_down_walk01")
        let imageName4 = AlteredTexture(imageNamed: "spear_down_stand")
        let imageName5 = AlteredTexture(imageNamed: "spear_down_walk03")
        let imageName6 = AlteredTexture(imageNamed: "spear_down_stand")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        textures.append(imageName5)
        textures.append(imageName6)
        
        return textures
    }
    
    override func walkLeftSequence() {
        self.runAction(SKAction.animateWithTextures(walkLeft_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    func getWalkLeftSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = AlteredTexture(imageNamed: "spear_left_stand")
        let imageName2 = AlteredTexture(imageNamed: "spear_left_walk02")
        let imageName3 = AlteredTexture(imageNamed: "spear_left_walk01")
        let imageName4 = AlteredTexture(imageNamed: "spear_left_stand")
        let imageName5 = AlteredTexture(imageNamed: "spear_left_walk03")
        let imageName6 = AlteredTexture(imageNamed: "spear_left_stand")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        textures.append(imageName5)
        textures.append(imageName6)
        
        return textures
    }
    
    
    override func walkRightSequence() {
        self.runAction(SKAction.animateWithTextures(walkRight_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    func getWalkRightSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = AlteredTexture(imageNamed: "spear_right_stand")
        let imageName2 = AlteredTexture(imageNamed: "spear_right_walk02")
        let imageName3 = AlteredTexture(imageNamed: "spear_right_walk01")
        let imageName4 = AlteredTexture(imageNamed: "spear_right_stand")
        let imageName5 = AlteredTexture(imageNamed: "spear_right_walk03")
        let imageName6 = AlteredTexture(imageNamed: "spear_right_stand")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        textures.append(imageName5)
        textures.append(imageName6)
        
        return textures
    }
}