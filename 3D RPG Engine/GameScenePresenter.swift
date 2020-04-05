//
//  GameScenePresenter.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 11/25/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import SpriteKit



struct GameScenePresenter {
    let gameScene : GameScene
    let mainView : SKView
    
    
    init(_ fromViewController: UIViewController) {
        gameScene = GameScene(fileNamed: "MapPreviewFromMenu")!
        mainView = SKView(frame: CGRect(x: 0, y: 0, width: SCREEN_BOUNDS.width*0.4, height: SCREEN_BOUNDS.height*0.9))
        
        mainView.scene?.size = mainView.frame.size;
        mainView.showsFPS = false;
        mainView.showsNodeCount = false;
//        mainView.center.y = SCREEN_BOUNDS.height / 2
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        mainView.ignoresSiblingOrder = true;
        /* Set the scale mode to scale to fit the window */
        gameScene.scaleMode = .aspectFill;
        gameScene.viewControllerRef = fromViewController
        mainView.presentScene(gameScene);
    }
    
    func startGameSceneAlertController() {
//        gameScene.willPresentStartupSettingsAlertController()
    }
    
    
    
    
    // 1.-- FIRST, THE HOST MUST GENERATE RANDOM TERRAIN
    func makeHostGenerateRandomMap() {
        gameScene.generateTerrainRandom()
    }
    
    

}
