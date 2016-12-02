//
// Created by Mateusz Andrzejczuk on 12/1/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit




struct SpriteTextureSet {
    let attackUp_Frames: [SKTexture];
    let attackDown_Frames: [SKTexture];
    let attackLeft_Frames: [SKTexture];
    let attackRight_Frames: [SKTexture];

    let attackUpRight_Frames: [SKTexture];
    let attackUpLeft_Frames: [SKTexture];

    let attackDownLeft_Frames: [SKTexture];
    let attackDownRight_Frames: [SKTexture];

    let walkUp_Frames: [SKTexture];
    let walkDown_Frames: [SKTexture];
    let walkLeft_Frames: [SKTexture];
    let walkRight_Frames: [SKTexture];

    let walkUL_Frames: [SKTexture];
    let walkUR_Frames: [SKTexture];

    let walkDL_Frames: [SKTexture];
    let walkDR_Frames: [SKTexture];

    let deathUp_Frames: [SKTexture];
    let deathDown_Frames: [SKTexture];
}



struct SpriteTextureSet_Balrog {
    let actor : SpriteTextureSet
    let imageFileNamePart : String

    init(actorName: String) {
        imageFileNamePart = actorName
        actor = SpriteTextureSet(
                attackUp_Frames: getAttackUPSequence_Frames_GLOBAL_Balrog(actorName),
                attackDown_Frames: getAttackDOWNSequence_Frames_GLOBAL_Balrog(actorName),
                attackLeft_Frames: getAttackLEFTSequence_Frames_GLOBAL_Balrog(actorName),
                attackRight_Frames: getAttackRIGHTSequence_Frames_GLOBAL_Balrog(actorName),
                attackUpRight_Frames: getAttackUPRIGHTSequence_Frames_GLOBAL_Balrog(actorName),
                attackUpLeft_Frames: getAttackUPLEFTSequence_Frames_GLOBAL_Balrog(actorName),
                attackDownLeft_Frames: getAttackDOWNLEFTSequence_Frames_GLOBAL_Balrog(actorName),
                attackDownRight_Frames: getAttackDOWNRIGHTSequence_Frames_GLOBAL_Balrog(actorName),
                walkUp_Frames: getWalkUpSequence_Frames_GLOBAL_Balrog(actorName),
                walkDown_Frames: getWalkDownSequence_Frames_GLOBAL_Balrog(actorName),
                walkLeft_Frames: getWalkLeftSequence_Frames_GLOBAL_Balrog(actorName),
                walkRight_Frames: getWalkRightSequence_Frames_GLOBAL_Balrog(actorName),
                walkUL_Frames: getWalkULSequence_Frames_GLOBAL_Balrog(actorName),
                walkUR_Frames: getWalkURSequence_Frames_GLOBAL_Balrog(actorName),
                walkDL_Frames: getWalkDLSequence_Frames_GLOBAL_Balrog(actorName),
                walkDR_Frames: getWalkDRSequence_Frames_GLOBAL_Balrog(actorName),
                deathUp_Frames: getDeathULSequence_Frames_GLOBAL_Balrog(actorName),
                deathDown_Frames: getDeathDLSequence_Frames_GLOBAL_Balrog(actorName))
    }
}

struct SpriteTextureSet_HeroFootman {
    let actor : SpriteTextureSet
    let imageFileNamePart : String

    init(actorName: String) {
        imageFileNamePart = actorName
        let overrideName : String = "footmanCenturionLvl1"
        actor = SpriteTextureSet(
                attackUp_Frames: getAttackUPSequence_Frames_GLOBAL_Balrog(overrideName),
                attackDown_Frames: getAttackDOWNSequence_Frames_GLOBAL_Balrog(overrideName),
                attackLeft_Frames: getAttackLEFTSequence_Frames_GLOBAL_Balrog(overrideName),
                attackRight_Frames: getAttackRIGHTSequence_Frames_GLOBAL_Balrog(overrideName),
                attackUpRight_Frames: getAttackUPRIGHTSequence_Frames_GLOBAL_Balrog(overrideName),
                attackUpLeft_Frames: getAttackUPLEFTSequence_Frames_GLOBAL_Balrog(overrideName),
                attackDownLeft_Frames: getAttackDOWNLEFTSequence_Frames_GLOBAL_Balrog(overrideName),
                attackDownRight_Frames: getAttackDOWNRIGHTSequence_Frames_GLOBAL_Balrog(overrideName),
                walkUp_Frames: getWalkUpSequence_Frames_GLOBAL_Balrog(overrideName),
                walkDown_Frames: getWalkDownSequence_Frames_GLOBAL_Balrog(overrideName),
                walkLeft_Frames: getWalkLeftSequence_Frames_GLOBAL_Balrog(overrideName),
                walkRight_Frames: getWalkRightSequence_Frames_GLOBAL_Balrog(overrideName),
                walkUL_Frames: getWalkULSequence_Frames_GLOBAL_Balrog(overrideName),
                walkUR_Frames: getWalkURSequence_Frames_GLOBAL_Balrog(overrideName),
                walkDL_Frames: getWalkDLSequence_Frames_GLOBAL_Balrog(overrideName),
                walkDR_Frames: getWalkDRSequence_Frames_GLOBAL_Balrog(overrideName),
                deathUp_Frames: getDeathULSequence_Frames_GLOBAL_Balrog(overrideName),
                deathDown_Frames: getDeathDLSequence_Frames_GLOBAL_Balrog(overrideName)
        )
    }
}


public func AlteredTexture_GLOBAL(imageNamed image: String) -> SKTexture {
    Thread.sleep(forTimeInterval: 0.01)
        let oldImage = UIImage(named: image)
        if let img = oldImage {

            if image.contains("footmanCenturionLvl1") {
//                print("\(image) CONTAINS: footmanCenturionLvl1")
                let colorToReplace: UIColor = .red
                let newReplacementColor: UIColor = .black
                let ice = UIImageColorEffect()

                let footmanColor: UIColor = UIColor(hue: 0.3556, saturation: 1, brightness: 0.61, alpha: 1.0)

                let newImage : UIImage = ice.image(
                        byReplacing: .red,
                        inTheImage: oldImage!,
                        withMinTolerance: 0.2,
                        withMaxTolerance: 0.3,
                        with: footmanColor
                )

                print("RENDERING footmanCenturionLvl1: \(image)")
                return SKTexture(image: newImage)
            }
            else if image.contains("balrog") {
//                print("\(image) CONTAINS: balrog")
                let colorToReplace: UIColor = .blue
                let newReplacementColor: UIColor = .black
                let ice = UIImageColorEffect()

                let balrogColor: UIColor = UIColor(hue: 0.6194, saturation: 1, brightness: 1, alpha: 1.0)
                let newColor: UIColor = UIColor(hue: 0.9972, saturation: 0.72, brightness: 0, alpha: 0.75)

                let newImage: UIImage = ice.image(
                        byReplacing: balrogColor,
                        inTheImage: oldImage!,
                        withMinTolerance: 0.1,
                        withMaxTolerance: 0.35,
                        with: newColor)

                print("RENDERING balrog: \(image)")
                return SKTexture(image: newImage)
            } else {
                return SKTexture(imageNamed: image)
            }

        } else {
                print("WARNING - FATAL IMAGE RENDER")
            return SKTexture(imageNamed: image)
        }
}


// ATTACKING
public func getAttackUPSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 6 {
        let imageName = "\(imageFileNamePart)_up_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "\(imageFileNamePart)_up_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}
public func getAttackUPLEFTSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "\(imageFileNamePart)_ul_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "\(imageFileNamePart)_ul_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}
public func getDeathULSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 6 {
        let imageName = "\(imageFileNamePart)_ul_death0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    return textures
}
public func getDeathDLSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 6 {
        let imageName = "\(imageFileNamePart)_dl_death0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    return textures
}
public func getAttackUPRIGHTSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "\(imageFileNamePart)_ur_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "\(imageFileNamePart)_ur_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}
public func getAttackDOWNSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "\(imageFileNamePart)_down_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "\(imageFileNamePart)_down_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}
public func getAttackDOWNLEFTSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "\(imageFileNamePart)_dl_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "\(imageFileNamePart)_dl_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}
public func getAttackDOWNRIGHTSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "\(imageFileNamePart)_dr_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "\(imageFileNamePart)_dr_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}
public func getAttackLEFTSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "\(imageFileNamePart)_left_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "\(imageFileNamePart)_left_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}
public func getAttackRIGHTSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "\(imageFileNamePart)_right_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "\(imageFileNamePart)_right_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}
public func getWalkUpSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_up_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_up_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_up_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_up_walk04")
    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)
    return textures
}
public func getWalkDownSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_down_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_down_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_down_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_down_walk04")
    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)
    return textures
}
public func getWalkLeftSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_left_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_left_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_left_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_left_walk04")
    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)
    return textures
}
public func getWalkRightSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_right_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_right_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_right_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_right_walk04")
    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)
    return textures
}
public func getWalkULSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_ul_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_ul_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_ul_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_ul_walk04")
    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)
    return textures
}
public func getWalkURSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_ur_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_ur_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_ur_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_ur_walk04")
    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)
    return textures
}
public func getWalkDLSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_dl_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_dl_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_dl_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_dl_walk04")
    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)
    return textures
}
public func getWalkDRSequence_Frames_GLOBAL_Balrog(_ imageFileNamePart: String) -> [SKTexture] {
    var textures = [SKTexture]()
    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_dr_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_dr_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_dr_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "\(imageFileNamePart)_dr_walk04")
    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)
    return textures
}


