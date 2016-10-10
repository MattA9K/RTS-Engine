//
//  SKHeroFootmanSprite.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 9/12/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//


import Foundation
import SpriteKit


// ANIMATIONS
class SKHeroFootmanSprite: SKFootmanSprite {
    
    override func getDeathSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 4 {
            let imageName = "footmanCenturionLvl1_dl_death0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        return textures
    }
    
    // ATTACKING
    override func getAttackUPSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanCenturionLvl1_up_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanCenturionLvl1_up_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    override func getAttackUPLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanCenturionLvl1_ul_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanCenturionLvl1_ul_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    override func getAttackUPRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanCenturionLvl1_ur_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanCenturionLvl1_ur_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    override func getAttackDOWNSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanCenturionLvl1_down_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanCenturionLvl1_down_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    override func getAttackDOWNLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanCenturionLvl1_dl_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanCenturionLvl1_dl_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    //
    
    override func getAttackDOWNRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanCenturionLvl1_dr_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanCenturionLvl1_dr_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    //
    
    override func getAttackLEFTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanCenturionLvl1_left_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanCenturionLvl1_left_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    override func getAttackRIGHTSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "footmanCenturionLvl1_right_attack0" + String(i)
            textures.append(self.AlteredTexture(imageNamed: imageName))
        }
        let imageName = "footmanCenturionLvl1_right_stand"
        textures.append(self.AlteredTexture(imageNamed: imageName))
        return textures
    }
    
    
    
    
    //WALK FRAMES
    override func getWalkUpSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_up_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_up_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_up_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_up_walk04")
        //        let imageName5 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_up_stand")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        //        textures.append(imageName5)
        
        return textures
    }
    
    
    
    override func getWalkDownSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_down_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_down_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_down_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_down_walk04")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        
        return textures
    }
    
    
    
    override func getWalkLeftSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_left_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_left_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_left_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_left_walk04")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    
    
    
    
    override func getWalkRightSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_right_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_right_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_right_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_right_walk04")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        
        return textures
    }
    
    
    // ------
    override func getWalkULSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_ul_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_ul_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_ul_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_ul_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    override func getWalkURSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_ur_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_ur_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_ur_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_ur_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    
    
    override func getWalkDLSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_dl_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_dl_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_dl_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_dl_walk04")
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    override func getWalkDRSequence_Frames() -> [SKTexture] {
        var textures = [SKTexture]()
        
        let imageName1 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_dr_walk01")
        let imageName2 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_dr_walk02")
        let imageName3 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_dr_walk03")
        let imageName4 = self.AlteredTexture(imageNamed: "footmanCenturionLvl1_dr_walk04")
        
        
        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)
        
        return textures
    }
    
}
