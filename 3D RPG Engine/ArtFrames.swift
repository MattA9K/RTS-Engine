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
    let UnitReference : AbstractUnit

    init(unitDelegate: AbstractUnit, actorName: String) {

        UnitReference = unitDelegate
        imageFileNamePart = actorName

        actor = SpriteTextureSet(
                attackUp_Frames: getAttackUPSequence_Frames_GLOBAL(),
                attackDown_Frames: getAttackDOWNSequence_Frames_GLOBAL(),
                attackLeft_Frames: getAttackLEFTSequence_Frames_GLOBAL(),
                attackRight_Frames: getAttackRIGHTSequence_Frames_GLOBAL(),
                attackUpRight_Frames: getAttackUPRIGHTSequence_Frames_GLOBAL(),
                attackUpLeft_Frames: getAttackUPLEFTSequence_Frames_GLOBAL(),
                attackDownLeft_Frames: getAttackDOWNLEFTSequence_Frames_GLOBAL(),
                attackDownRight_Frames: getAttackDOWNRIGHTSequence_Frames_GLOBAL(),
                walkUp_Frames: getWalkUpSequence_Frames_GLOBAL(),
                walkDown_Frames: getWalkDownSequence_Frames_GLOBAL(),
                walkLeft_Frames: getWalkLeftSequence_Frames_GLOBAL(),
                walkRight_Frames: getWalkRightSequence_Frames_GLOBAL(),
                walkUL_Frames: getWalkULSequence_Frames_GLOBAL(),
                walkUR_Frames: getWalkURSequence_Frames_GLOBAL(),
                walkDL_Frames: getWalkDLSequence_Frames_GLOBAL(),
                walkDR_Frames: getWalkDRSequence_Frames_GLOBAL(),
                deathUp_Frames: getDeathULSequence_Frames_GLOBAL(),
                deathDown_Frames: getDeathDLSequence_Frames_GLOBAL())
    }
}


/*
public func imageAlter(fromOriginalImage image: UIImage, withHue hue: CGFloat) -> UIImage
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
*/

//    fileprivate func AlteredTexture_GLOBAL(imageNamed image: String) -> SKTexture {
//                let oldImage = UIImage(named: image)
//                    if let img = oldImage {
//                                let ice = UIImageColorEffect()
//                                        let newImage = ice.image(byReplacing: .blue, inTheImage: oldImage!, withMinTolerance: 0.8, withMaxTolerance: 0.9, with: .orange)
//                                        return SKTexture(image: newImage!)
//                                    } else {
//        return SKTexture(imageNamed: image)
//                                    }
//    }

public func AlteredTexture_GLOBAL(imageNamed image: String) -> SKTexture {
    Thread.sleep(forTimeInterval: 0.01)
//        if self.UnitReference!.ReferenceOfGameScene.socket.isConnected {


//    print("self.UnitReference!.ReferenceOfGameScene: \(self.UnitReference.ReferenceOfGameScene)")
//    print("image: \(image)")
//    print("self.UnitReference: \(self.UnitReference)")
//    print("recycledTextures[image]" + "\(self.UnitReference.ReferenceOfGameScene.recycledTextures[image])")
//
//
//    if let texture = self.UnitReference.ReferenceOfGameScene.recycledTextures[image] {
//        print("RECYCLING IMAGE: \(image)")
//        return texture
//    } else {
//        let oldImage = UIImage(named: image)
//        if let img = oldImage {
//            let ice = UIImageColorEffect()
//            let newImage : UIImage = ice.image(
//                    byReplacing: .blue,
//                    inTheImage: oldImage!,
//                    withMinTolerance: 0.1,
//                    withMaxTolerance: 0.2,
//                    with: RANDOM_COLOR_1)
//
//            print("RENDERING IMAGE: \(image)")
//            self.UnitReference.ReferenceOfGameScene.recycledTextures[image] = SKTexture(image: newImage)
//            if image == "balrog_dl_death05" || image == "balrog_up_attack02" {
//                for kv in self.UnitReference.ReferenceOfGameScene.recycledTextures {
//                    print("key: \(kv.key)")
//                }
//                print("array: \n \(self.UnitReference.ReferenceOfGameScene.recycledTextures[image])")
//            }
//            return SKTexture(image: newImage)
//        } else {
//                print("WARNING - FATAL IMAGE RENDER")
//            return SKTexture(imageNamed: image)
//        }
//    }
//        } else {
//        print("WON'T DO ANY RENDERING")
    return SKTexture(imageNamed: image)
//        }

}


// ATTACKING
public func getAttackUPSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 6 {
        let imageName = "balrog_up_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "balrog_up_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}


public func getAttackUPLEFTSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "balrog_ul_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "balrog_ul_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}

public func getDeathULSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 6 {
        let imageName = "balrog_ul_death0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    return textures
}

public func getDeathDLSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 6 {
        let imageName = "balrog_dl_death0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    return textures
}


public func getAttackUPRIGHTSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "balrog_ur_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "balrog_ur_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}

public func getAttackDOWNSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "balrog_down_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "balrog_down_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}

public func getAttackDOWNLEFTSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "balrog_dl_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "balrog_dl_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}
//

public func getAttackDOWNRIGHTSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "balrog_dr_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "balrog_dr_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}
//

public func getAttackLEFTSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "balrog_left_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "balrog_left_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}

public func getAttackRIGHTSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()
    for i in 1 ..< 7 {
        let imageName = "balrog_right_attack0" + String(i)
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    }
    let imageName = "balrog_right_stand"
    textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
    return textures
}




//WALK FRAMES
public func getWalkUpSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()

    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_up_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_up_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_up_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_up_walk04")


    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)

    return textures
}



public func getWalkDownSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()

    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_down_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_down_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_down_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_down_walk04")


    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)

    return textures
}



public func getWalkLeftSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()

    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_left_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_left_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_left_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_left_walk04")

    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)

    return textures
}




public func getWalkRightSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()

    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_right_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_right_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_right_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_right_walk04")



    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)


    return textures
}

// ------
public func getWalkULSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()

    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_ul_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_ul_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_ul_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_ul_walk04")

    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)

    return textures
}
public func getWalkURSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()

    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_ur_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_ur_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_ur_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_ur_walk04")

    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)

    return textures
}


public func getWalkDLSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()

    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_dl_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_dl_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_dl_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_dl_walk04")

    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)

    return textures
}
public func getWalkDRSequence_Frames_GLOBAL() -> [SKTexture] {
    var textures = [SKTexture]()

    let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_dr_walk01")
    let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_dr_walk02")
    let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_dr_walk03")
    let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_dr_walk04")


    textures.append(imageName1)
    textures.append(imageName2)
    textures.append(imageName3)
    textures.append(imageName4)

    return textures
}





struct ArtFrames {

    let imageFileNamePart: String
    let UnitReference: AbstractUnit

    fileprivate func imageAlter(fromOriginalImage image: UIImage, withHue hue: CGFloat) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: image.size)

        UIGraphicsBeginImageContext(image.size)

        let context = UIGraphicsGetCurrentContext()

        context?.translateBy(x: 0.0, y: image.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)

        context?.draw(image.cgImage!, in: rect)

        context?.setBlendMode(CGBlendMode.hue)

        context?.clip(to: rect, mask: image.cgImage!)

        context?.setFillColor(UIColor(red: 1.00, green: 1.00, blue: 0.00, alpha: 1.0).cgColor
        )

        context?.fill(rect)

        let colouredImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()


        return colouredImage!
    }


//    fileprivate func AlteredTexture_GLOBAL(imageNamed image: String) -> SKTexture {
//                let oldImage = UIImage(named: image)
//                    if let img = oldImage {
//                                let ice = UIImageColorEffect()
//                                        let newImage = ice.image(byReplacing: .blue, inTheImage: oldImage!, withMinTolerance: 0.8, withMaxTolerance: 0.9, with: .orange)
//                                        return SKTexture(image: newImage!)
//                                    } else {
//        return SKTexture(imageNamed: image)
//                                    }
//    }
/*
    public func AlteredTexture_GLOBAL(imageNamed image: String) -> SKTexture {
        Thread.sleep(forTimeInterval: 0.01)
//        if self.UnitReference!.ReferenceOfGameScene.socket.isConnected {


        print("self.UnitReference!.ReferenceOfGameScene: \(self.UnitReference.ReferenceOfGameScene)")
        print("image: \(image)")
        print("self.UnitReference: \(self.UnitReference)")
        print("recycledTextures[image]" + "\(self.UnitReference.ReferenceOfGameScene.recycledTextures[image])")


        if let texture = self.UnitReference.ReferenceOfGameScene.recycledTextures[image] {
            print("RECYCLING IMAGE: \(image)")
            return texture
        } else {
            let oldImage = UIImage(named: image)
            if let img = oldImage {
                let ice = UIImageColorEffect()
                let newImage: UIImage = ice.image(
                        byReplacing: .blue,
                        inTheImage: oldImage!,
                        withMinTolerance: 0.1,
                        withMaxTolerance: 0.2,
                        with: RANDOM_COLOR_1)

                print("RENDERING IMAGE: \(image)")
                self.UnitReference.ReferenceOfGameScene.recycledTextures[image] = SKTexture(image: newImage)
                if image == "balrog_dl_death05" || image == "balrog_up_attack02" {
                    for kv in self.UnitReference.ReferenceOfGameScene.recycledTextures {
                        print("key: \(kv.key)")
                    }
                    print("array: \n \(self.UnitReference.ReferenceOfGameScene.recycledTextures[image])")
                }
                return SKTexture(image: newImage)
            } else {
//                print("WARNING - FATAL IMAGE RENDER")
                return SKTexture(imageNamed: image)
            }
        }
//        } else {
//        print("WON'T DO ANY RENDERING")
        return SKTexture(imageNamed: image)
//        }

    }


    // ATTACKING
    public func getAttackUPSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 6 {
            let imageName = "balrog_up_attack0" + String(i)
            textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        }
        let imageName = "balrog_up_stand"
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        return textures
    }


    public func getAttackUPLEFTSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "balrog_ul_attack0" + String(i)
            textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        }
        let imageName = "balrog_ul_stand"
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        return textures
    }

    public func getDeathSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 6 {
            let imageName = "balrog_dl_death0" + String(i)
            textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        }
        return textures
    }


    public func getAttackUPRIGHTSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "balrog_ur_attack0" + String(i)
            textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        }
        let imageName = "balrog_ur_stand"
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        return textures
    }

    public func getAttackDOWNSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "balrog_down_attack0" + String(i)
            textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        }
        let imageName = "balrog_down_stand"
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        return textures
    }

    public func getAttackDOWNLEFTSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "balrog_dl_attack0" + String(i)
            textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        }
        let imageName = "balrog_dl_stand"
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        return textures
    }
    //

    public func getAttackDOWNRIGHTSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "balrog_dr_attack0" + String(i)
            textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        }
        let imageName = "balrog_dr_stand"
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        return textures
    }
    //

    public func getAttackLEFTSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "balrog_left_attack0" + String(i)
            textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        }
        let imageName = "balrog_left_stand"
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        return textures
    }

    public func getAttackRIGHTSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()
        for i in 1 ..< 7 {
            let imageName = "balrog_right_attack0" + String(i)
            textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        }
        let imageName = "balrog_right_stand"
        textures.append(AlteredTexture_GLOBAL(imageNamed: imageName))
        return textures
    }




    //WALK FRAMES
    public func getWalkUpSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()

        let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_up_walk01")
        let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_up_walk02")
        let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_up_walk03")
        let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_up_walk04")


        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        return textures
    }


    public func getWalkDownSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()

        let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_down_walk01")
        let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_down_walk02")
        let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_down_walk03")
        let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_down_walk04")


        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        return textures
    }


    public func getWalkLeftSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()

        let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_left_walk01")
        let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_left_walk02")
        let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_left_walk03")
        let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_left_walk04")

        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        return textures
    }


    public func getWalkRightSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()

        let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_right_walk01")
        let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_right_walk02")
        let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_right_walk03")
        let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_right_walk04")



        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)


        return textures
    }

    // ------
    public func getWalkULSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()

        let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_ul_walk01")
        let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_ul_walk02")
        let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_ul_walk03")
        let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_ul_walk04")

        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        return textures
    }

    public func getWalkURSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()

        let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_ur_walk01")
        let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_ur_walk02")
        let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_ur_walk03")
        let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_ur_walk04")

        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        return textures
    }


    public func getWalkDLSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()

        let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_dl_walk01")
        let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_dl_walk02")
        let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_dl_walk03")
        let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_dl_walk04")

        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        return textures
    }

    public func getWalkDRSequence_Frames_GLOBAL() -> [SKTexture] {
        var textures = [SKTexture]()

        let imageName1 = AlteredTexture_GLOBAL(imageNamed: "balrog_dr_walk01")
        let imageName2 = AlteredTexture_GLOBAL(imageNamed: "balrog_dr_walk02")
        let imageName3 = AlteredTexture_GLOBAL(imageNamed: "balrog_dr_walk03")
        let imageName4 = AlteredTexture_GLOBAL(imageNamed: "balrog_dr_walk04")


        textures.append(imageName1)
        textures.append(imageName2)
        textures.append(imageName3)
        textures.append(imageName4)

        return textures
    }
    */
}