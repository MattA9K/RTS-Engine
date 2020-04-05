//
//  UnitCommandCard.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 12/18/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit


struct CommandCard {
    let name : String
    let commands : [UnitCommand]
    
    init (named: String, withCommands: [UnitCommand]) {
        name = named
        commands = withCommands
    }
}
