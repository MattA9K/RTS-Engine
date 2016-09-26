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
    
    
    
    
    // FRAMES FOR ANIMATION
//    var attackUp_Frames: [SKTexture] = [];
//    var attackDown_Frames: [SKTexture] = [];
//    var attackLeft_Frames: [SKTexture] = [];
//    var attackRight_Frames: [SKTexture] = [];
//    
//    var attackUpRight_Frames: [SKTexture] = [];
//    var attackUpLeft_Frames: [SKTexture] = [];
//    
//    var attackDownLeft_Frames: [SKTexture] = [];
//    var attackDownRight_Frames: [SKTexture] = [];
//    
//    var walkUp_Frames: [SKTexture] = [];
//    var walkDown_Frames: [SKTexture] = [];
//    var walkLeft_Frames: [SKTexture] = [];
//    var walkRight_Frames: [SKTexture] = [];
//    
//    var deathUp_Frames: [SKTexture] = [];
//    var deathDown_Frames: [SKTexture] = [];
    
    
//    let AnimationDuration_WALK = 0.05
//    let AnimationDuration_ATTACK = 0.05
   
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
        
        walkUL_Frames = getWalkULSequence_Frames()
        walkUR_Frames = getWalkURSequence_Frames()
        walkDL_Frames = getWalkDLSequence_Frames()
        walkDR_Frames = getWalkDRSequence_Frames()
        
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
    
    /*
    // FACING
    override func playFaceDownAnimation() {
        let imageName = "spearThrower_down_stand"
        self.texture = AlteredTexture(imageNamed: imageName)
    }
    override func playFaceUpAnimation() {
        let imageName = "spearThrower_up_stand"
        self.texture = AlteredTexture(imageNamed: imageName)
    }
    override func playFaceLeftAnimation() {
        let imageName = "spearThrower_left_stand"
        self.texture = AlteredTexture(imageNamed: imageName)
    }
    override func playFaceRightAnimation() {
        let imageName = "spearThrower_right_stand"
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
    
    
    override func playAttackUPLEFTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackUpLeft_Frames, timePerFrame: AnimationDuration_WALK))
        
    }
    
    override func playAttackUPRIGHTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackUpRight_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    override func playAttackDOWNAnimation() {
        self.runAction(SKAction.animateWithTextures(attackDown_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    override func playAttackDOWNLEFTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackDownLeft_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    override func playAttackLEFTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackLeft_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    override func playAttackRIGHTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackRight_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    override func walkUpSequence() {
        self.runAction(SKAction.animateWithTextures(walkUp_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    override func walkRightSequence() {
        self.runAction(SKAction.animateWithTextures(walkRight_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    override func walkLeftSequence() {
        self.runAction(SKAction.animateWithTextures(walkLeft_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    override func playAttackDOWNRIGHTAnimation() {
        self.runAction(SKAction.animateWithTextures(attackDownRight_Frames, timePerFrame: AnimationDuration_WALK))
    }
    
    override func walkDownSequence() {
        self.runAction(SKAction.animateWithTextures(walkDown_Frames, timePerFrame: AnimationDuration_WALK))
    }
    */
   ////////////======== ---
    

    func getDeathDownSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        textures.append(self.AlteredTexture(imageNamed: "spearThrower_dl_death01"))
        textures.append(self.AlteredTexture(imageNamed: "spearThrower_dl_death02"))
        textures.append(self.AlteredTexture(imageNamed: "spearThrower_dl_death03"))
        textures.append(self.AlteredTexture(imageNamed: "spearThrower_dl_death04"))

        return textures
    }
    
    func getDeathUpSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        textures.append(self.AlteredTexture(imageNamed: "spearThrower_ul_death01"))
        textures.append(self.AlteredTexture(imageNamed: "spearThrower_ul_death02"))
        textures.append(self.AlteredTexture(imageNamed: "spearThrower_ul_death03"))
        textures.append(self.AlteredTexture(imageNamed: "spearThrower_ul_death04"))
        
        return textures
    }
    
    
    // ATTACKING
    func getAttackUPSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "spearThrower_up_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spearThrower_up_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    func getAttackUPLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "spearThrower_ul_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spearThrower_ul_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    
    func getAttackUPRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "spearThrower_ur_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spearThrower_ur_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackDOWNSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "spearThrower_down_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spearThrower_down_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackDOWNLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "spearThrower_dl_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spearThrower_dl_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    //

    func getAttackDOWNRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "spearThrower_dr_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spearThrower_dr_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    //
    
    func getAttackLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "spearThrower_left_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spearThrower_left_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "spearThrower_right_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "spearThrower_right_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    //WALK FRAMES
    func getWalkUpSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "spearThrower_up_stand")
        let imageName2 = self.AlteredTexture(imageNamed: "spearThrower_up_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "spearThrower_up_walk01")
        let imageName4 = self.AlteredTexture(imageNamed: "spearThrower_up_stand")
        let imageName5 = self.AlteredTexture(imageNamed: "spearThrower_up_walk03")
        let imageName6 = self.AlteredTexture(imageNamed: "spearThrower_up_stand")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        textures.append(imageName5)
        textures.append(imageName6)
        
        return textures
    }

    
    func getWalkDownSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "spearThrower_down_stand")
        let imageName2 = self.AlteredTexture(imageNamed: "spearThrower_down_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "spearThrower_down_walk01")
        let imageName4 = self.AlteredTexture(imageNamed: "spearThrower_down_stand")
        let imageName5 = self.AlteredTexture(imageNamed: "spearThrower_down_walk03")
        let imageName6 = self.AlteredTexture(imageNamed: "spearThrower_down_stand")
        
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
        
        let imageName1 = self.AlteredTexture(imageNamed: "spearThrower_left_stand")
        let imageName2 = self.AlteredTexture(imageNamed: "spearThrower_left_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "spearThrower_left_walk01")
        let imageName4 = self.AlteredTexture(imageNamed: "spearThrower_left_stand")
        let imageName5 = self.AlteredTexture(imageNamed: "spearThrower_left_walk03")
        let imageName6 = self.AlteredTexture(imageNamed: "spearThrower_left_stand")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        textures.append(imageName5)
        textures.append(imageName6)
        
        return textures
    }
    
    

    func getWalkRightSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "spearThrower_right_stand")
        let imageName2 = self.AlteredTexture(imageNamed: "spearThrower_right_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "spearThrower_right_walk01")
        let imageName4 = self.AlteredTexture(imageNamed: "spearThrower_right_stand")
        let imageName5 = self.AlteredTexture(imageNamed: "spearThrower_right_walk03")
        let imageName6 = self.AlteredTexture(imageNamed: "spearThrower_right_stand")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        textures.append(imageName5)
        textures.append(imageName6)
        
        return textures
    }
    
    // ------
    func getWalkULSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "spearThrower_ul_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "spearThrower_ul_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "spearThrower_ul_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "spearThrower_ul_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    func getWalkURSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "spearThrower_ur_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "spearThrower_ur_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "spearThrower_ur_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "spearThrower_ur_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    
    
    func getWalkDLSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "spearThrower_dl_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "spearThrower_dl_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "spearThrower_dl_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "spearThrower_dl_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    func getWalkDRSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "spearThrower_dr_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "spearThrower_dr_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "spearThrower_dr_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "spearThrower_dr_walk04")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
}