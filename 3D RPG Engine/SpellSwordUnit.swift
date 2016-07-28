
//
//  SpellSwordUnit.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/11/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit

class SpellSwordUnit: RangedUnit {
    

    override func referenceSpriteToSelf() {
        (sprite as! SKSpellSword).UnitReference = self
    }
}