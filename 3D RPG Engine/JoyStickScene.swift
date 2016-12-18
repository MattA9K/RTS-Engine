//
// Created by Mateusz Andrzejczuk on 12/16/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



class JoyStickScene : SKScene {

    var joyStick: Joystick = Joystick()


    override func didMove(to view: SKView) {
        /* Setup your scene here */
        addChild(joyStick)
    }

}