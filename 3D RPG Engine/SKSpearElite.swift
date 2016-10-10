//
//  SKSpearElite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 9/20/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class SKSpearElite : SKAbstractSprite {
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
        
        deathUp_Frames = getDeathSequence_Frames()
    }
    
    
    fileprivate func imageAlter(fromOriginalImage image: UIImage, withHue hue: CGFloat) -> UIImage
    {
        let rect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: image.size)
        
        UIGraphicsBeginImageContext(image.size)
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.translateBy(x: 0.0, y: image.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        context?.draw(image.cgImage!, in: rect)
        
        context?.setBlendMode(CGBlendMode.hue)
        
        context?.clip(to: rect, mask: image.cgImage!)
        
        context?.setFillColor(UIColor(red:1.00, green:1.00, blue:0.00, alpha:1.0).cgColor
        )
        
        context?.fill(rect)
        
        let colouredImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        return colouredImage!
    }
    
    
    fileprivate func AlteredTexture(imageNamed image: String) -> SKTexture {
        //        let oldImage = UIImage(named: image)
        //            if let img = oldImage {
        //                        let ice = UIImageColorEffect()
        //                                let newImage = ice.imageByReplacingColor(UIColor.greenColor(), inTheImage: oldImage!, withMinTolerance: 0.8, withMaxTolerance: 0.9, withColor: UIColor.orangeColor())
        //                                return SKTexture(image: newImage)
        //                            } else {
        return SKTexture(imageNamed: image)
        //                            }
    }
    
    
    // ATTACKING
    func getAttackUPSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 6 {
            let imageName = "SpearElite_up_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "SpearElite_up_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    func getAttackUPLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "SpearElite_ul_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "SpearElite_ul_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getDeathSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 5 {
            let imageName = "SpearElite_dl_death0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        return textures
    }
    
    
    func getAttackUPRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "SpearElite_ur_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "SpearElite_ur_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackDOWNSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "SpearElite_down_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "SpearElite_down_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackDOWNLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "SpearElite_dl_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "SpearElite_dl_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    //
    
    func getAttackDOWNRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "SpearElite_dr_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "SpearElite_dr_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    //
    
    func getAttackLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "SpearElite_left_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "SpearElite_left_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "SpearElite_right_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "SpearElite_right_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    
    
    //WALK FRAMES
    func getWalkUpSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "SpearElite_up_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "SpearElite_up_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "SpearElite_up_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "SpearElite_up_walk04")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        
        return textures
    }
    
    
    
    func getWalkDownSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "SpearElite_down_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "SpearElite_down_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "SpearElite_down_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "SpearElite_down_walk04")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        
        return textures
    }
    
    
    
    func getWalkLeftSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "SpearElite_left_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "SpearElite_left_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "SpearElite_left_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "SpearElite_left_walk04")
        
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        
        return textures
    }
    
    
    
    
    func getWalkRightSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "SpearElite_right_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "SpearElite_right_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "SpearElite_right_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "SpearElite_right_walk04")
        
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        
        return textures
    }
    
    // ------
    func getWalkULSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "SpearElite_ul_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "SpearElite_ul_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "SpearElite_ul_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "SpearElite_ul_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    func getWalkURSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "SpearElite_ur_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "SpearElite_ur_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "SpearElite_ur_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "SpearElite_ur_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    
    
    func getWalkDLSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "SpearElite_dl_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "SpearElite_dl_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "SpearElite_dl_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "SpearElite_dl_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    func getWalkDRSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "SpearElite_dr_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "SpearElite_dr_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "SpearElite_dr_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "SpearElite_dr_walk04")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
}
