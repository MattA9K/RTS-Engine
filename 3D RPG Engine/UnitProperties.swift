//
//  UnitProperties.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 8/4/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation


// Important unit values related to gameplay, not buisness logic.
protocol UnitProperties {
    var nameGUI: String { get set }
    var HP: Int { get set }
    var MANA: Int { get set }
    var Armor: Int { get set }
    var DMG: Int { get set }
    
    var HP_MAX: Int { get set }
    var MANA_MAX: Int { get set }
    
    var DMG_MAX: Int { get set }
    var Armor_MAX: Int { get set }
}