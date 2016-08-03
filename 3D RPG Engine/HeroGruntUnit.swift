//
// Created by Mateusz Andrzejczuk on 7/20/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

/*
class HeroGruntUnit: MeleeUnit {

    override init(player: Int) {
        let imageName = "grunt_down_stand"

        super.init(player: player)


        let CastClassUnit = SKGruntSprite(imageNamed: imageName)
        CastClassUnit.xScale = GameSettings.SpriteScale.Default
        CastClassUnit.yScale = GameSettings.SpriteScale.Default
        CastClassUnit.zPosition = SpritePositionZ.AliveUnit.Z
        sprite = CastClassUnit
        sprite.texture = SKTexture(imageNamed: imageName)
        HP = 5
        referenceSpriteToSelf()
        CastUnitReference()
        (sprite as! SKGruntSprite).unitIdentifier = "hero"
        (sprite as! SKGruntSprite).loadTextures()


        // OPTIONAL HACK:
        let oldImage = UIImage(named: imageName)
        let newImage = imageAlter(fromOriginalImage: oldImage!, withHue: 0.5)
        let tempSprite = SKTexture(image: newImage)
        let changeTexture = SKAction.setTexture(SKTexture(image: newImage))
        sprite.runAction(changeTexture)
    }

    override func referenceSpriteToSelf() {
        (sprite as! SKGruntSprite).UnitReference = self
    }

    override func attackAllUnitsInBuffer() {
        super.attackAllUnitsInBuffer()
    }


    func CastUnitReference() {
        sprite.UnitReference = self
    }


    // THE REST OF OPTIONAL HACK:
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
                UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.0).CGColor
        )

        CGContextFillRect(context, rect)

        let colouredImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()


        return colouredImage
    }


}
*/