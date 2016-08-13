//
//  SKGruntLvl2_M.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


extension SKGruntLvl2 {
    
    
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
        //                    let oldImage = UIImage(named: image)
        //                    if let img = oldImage {
        //                        let ice = UIImageColorEffect()
        //                        let newImage = ice.imageByReplacingColor(UIColor.blueColor(), inTheImage: oldImage!, withMinTolerance: 0.8, withMaxTolerance: 0.9, withColor: UIColor.redColor())
        //                        return SKTexture(image: newImage)
        //                    } else {
        return SKTexture(imageNamed: image)
        //                    }
    }
    
    
    // ATTACKING
    func getAttackUPSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 6; i+=1 {
            let imageName = "gruntLvl2_up_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "gruntLvl2_up_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    func getAttackUPLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "gruntLvl2_ul_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "gruntLvl2_ul_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getDeathSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 5; i+=1 {
            let imageName = "gruntLvl2_dl_death0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        return textures
    }
    
    
    func getAttackUPRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "gruntLvl2_ur_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "gruntLvl2_ur_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackDOWNSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "gruntLvl2_down_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "gruntLvl2_down_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackDOWNLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "gruntLvl2_dl_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "gruntLvl2_dl_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    //
    
    func getAttackDOWNRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "gruntLvl2_dr_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "gruntLvl2_dr_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    //
    
    func getAttackLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "gruntLvl2_left_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "gruntLvl2_left_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for var i = 1; i < 7; i+=1 {
            let imageName = "gruntLvl2_right_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "gruntLvl2_right_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    
    
    //WALK FRAMES
    func getWalkUpSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "gruntLvl2_up_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "gruntLvl2_up_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "gruntLvl2_up_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "gruntLvl2_up_walk04")

        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        
        return textures
    }
    
    
    
    func getWalkDownSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "gruntLvl2_down_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "gruntLvl2_down_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "gruntLvl2_down_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "gruntLvl2_down_walk04")

        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        
        return textures
    }
    
    
    
    func getWalkLeftSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "gruntLvl2_left_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "gruntLvl2_left_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "gruntLvl2_left_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "gruntLvl2_left_walk04")

        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        
        return textures
    }
    
    
    
    
    func getWalkRightSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "gruntLvl2_right_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "gruntLvl2_right_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "gruntLvl2_right_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "gruntLvl2_right_walk04")

        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        
        return textures
    }
    
}