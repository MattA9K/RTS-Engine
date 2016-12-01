
import SpriteKit
import Foundation




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


    func AlteredTexture(imageNamed image: String) -> SKTexture {
        Thread.sleep(forTimeInterval: 0.01)
//        if self.UnitReference!.ReferenceOfGameScene.socket.isConnected {
        print("self is footman hero \(self.UnitReference!.ReferenceOfGameScene.recycledTextures[image])")
        if let texture = self.UnitReference!.ReferenceOfGameScene.recycledTextures[image] {
            print("RECYCLING IMAGE: \(image)")
            return texture
        } else {
            let oldImage = UIImage(named: image)
            if let img = oldImage {
                let ice = UIImageColorEffect()
                let newImage : UIImage = ice.image(
                        byReplacing: .red,
                        inTheImage: oldImage!,
                        withMinTolerance: 0.2,
                        withMaxTolerance: 0.3,
                        with: RANDOM_COLOR_1)

                print("RENDERING IMAGE: \(image)")
                self.UnitReference!.ReferenceOfGameScene.recycledTextures[image] = SKTexture(image: newImage)
//            (self as! SKHeroFootmanSprite).recycledTextures[image] = SKTexture(image: newImage)
                if image == "footmanCenturionLvl1_dl_death03" || image == "footmanCenturionLvl1_up_attack01" {
                    for kv in self.UnitReference!.ReferenceOfGameScene.recycledTextures {
                        print("key: \(kv.key)")
                    }
                    print("array: \n \(self.UnitReference!.ReferenceOfGameScene.recycledTextures[image])")
                }
                return SKTexture(image: newImage)
            } else {
                print("WARNING - FATAL IMAGE RENDER")
                return SKTexture(imageNamed: image)
            }
        }
//        } else {
        print("WON'T DO ANY RENDERING")
        return SKTexture(imageNamed: image)
    }
    
    
    func getDeathSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 4 {
            let imageName = "footmanLvl1_dl_death0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        return textures
    }
    
    // ATTACKING
    func getAttackUPSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanLvl1_up_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanLvl1_up_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    func getAttackUPLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanLvl1_ul_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanLvl1_ul_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    func getAttackUPRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanLvl1_ur_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanLvl1_ur_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackDOWNSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanLvl1_down_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanLvl1_down_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackDOWNLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanLvl1_dl_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanLvl1_dl_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    //
    
    func getAttackDOWNRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanLvl1_dr_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanLvl1_dr_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    //
    
    func getAttackLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanLvl1_left_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanLvl1_left_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    func getAttackRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanLvl1_right_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanLvl1_right_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    
    
    //WALK FRAMES
    func getWalkUpSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanLvl1_up_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanLvl1_up_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanLvl1_up_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanLvl1_up_walk04")
//        let imageName5 = self.AlteredTexture(imageNamed: "footmanLvl1_up_stand")

        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
//        textures.append(imageName5)
        
        return textures
    }
    
    
    
    func getWalkDownSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanLvl1_down_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanLvl1_down_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanLvl1_down_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanLvl1_down_walk04")

        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        
        return textures
    }
    
    
    
    func getWalkLeftSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanLvl1_left_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanLvl1_left_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanLvl1_left_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanLvl1_left_walk04")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    
    
    
    
    func getWalkRightSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanLvl1_right_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanLvl1_right_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanLvl1_right_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanLvl1_right_walk04")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        
        return textures
    }
    
    
    // ------
    func getWalkULSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanLvl1_ul_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanLvl1_ul_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanLvl1_ul_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanLvl1_ul_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    func getWalkURSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanLvl1_ur_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanLvl1_ur_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanLvl1_ur_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanLvl1_ur_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    
    
    func getWalkDLSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanLvl1_dl_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanLvl1_dl_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanLvl1_dl_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanLvl1_dl_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    func getWalkDRSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanLvl1_dr_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanLvl1_dr_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanLvl1_dr_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanLvl1_dr_walk04")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
}
