//
// Created by Mateusz Andrzejczuk on 12/2/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation



/// **Player** is required to determine all GameScene unit colors
///     - playerNumber
///     - groupNumber
///     - color
struct Player {
    let playerNumber : Int
    let groupNumber : Int
    let color : UIColor = ARRAY_OF_COLORS[Int(arc4random_uniform(UInt32(ARRAY_OF_COLORS.count)))]
}

