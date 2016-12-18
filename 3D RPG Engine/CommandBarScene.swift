//
// Created by Mateusz Andrzejczuk on 12/16/16.
// Copyright (c) 2016 Core Prime Inc. All rights reserved.
//

import Foundation



struct CommandBar {

    let attackButton : UIButton
    let spellButton01 : UIButton

    let txtView : UITextView

    let mainView : UIView
    let delegate : GameScene


    init(scene: GameScene) {
        let height : CGFloat = SCREEN_BOUNDS.height * 0.1
        let frame : CGRect = CGRect(
                x:150,
                y:SCREEN_BOUNDS.size.height - height,
                width:SCREEN_BOUNDS.width * 0.75,
                height:SCREEN_BOUNDS.height * 0.1
        )

        mainView = UIView(frame: frame)

        delegate = scene

        attackButton = UIButton(type: .system)
        attackButton.setTitle("ATTACK", for: .normal)
        attackButton.addTarget(scene, action: #selector(scene.commandBarAnyButtonWasTapped), for: .touchUpInside)
        attackButton.frame.origin.x = 0
        attackButton.frame.origin.y = 0
        attackButton.frame.size.width = 90
        attackButton.frame.size.height = 40
        attackButton.setTitleColor(.blue, for: .normal)
        attackButton.backgroundColor = .white

        spellButton01 = UIButton(type: .system)
        spellButton01.setTitle("SPELL01", for: .normal)
        spellButton01.addTarget(scene, action: #selector(scene.commandBarAnyButtonWasTapped), for: .touchUpInside)
        spellButton01.frame.origin.x = 90
        spellButton01.frame.origin.y = 0
        spellButton01.frame.size.width = 90
        spellButton01.frame.size.height = 40
        spellButton01.setTitleColor(.blue, for: .normal)
        spellButton01.backgroundColor = .white

        mainView.backgroundColor = .red
        mainView.addSubview(attackButton)
        mainView.addSubview(spellButton01)

        let txtFrame : CGRect = CGRect(
                x:-150,
                y:((SCREEN_BOUNDS.size.height - height) * -1) + 150,
                width:150,
                height:100
        )

        txtView = UITextView(frame: txtFrame)
        txtView.text = "HELLO EVERYBODY!!"
        txtView.textColor = .cyan
        mainView.addSubview(txtView)
    }


    func addSubviews() {
//        mainView.addSubview(attackButton)
//        attackButton.addTarget(self, action: #selector(GameScene.commandBarAnyButtonWasTapped), for: .touchUpInside)
    }


    func didGetMessageFromScene(message: Any) {

        if message is AbstractUnit {
            var mainLine : String! = "\((message as! AbstractUnit).sprite.name!)\n"
            let line2 : String = "HP: \((message as! AbstractUnit).HP)/\((message as! AbstractUnit).HP)"

            mainLine.append(line2)
            self.txtView.text = mainLine
        }

    }

}