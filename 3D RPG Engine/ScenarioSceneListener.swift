//
//  ScenarioSceneListener.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/27/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import UIKit
import AudioToolbox


class ScenarioSceneListener: NSObject {

    var _ScenarioKind: ScenarioKind!
    
    init(ScenarioKind_: ScenarioKind) {
        _ScenarioKind = ScenarioKind_
    }
    
    // CONDITIONS FOR VICTORY:
    var _EnemyUnit: Int?
    var _CircleOfPowerCompleted: Bool?
    var _AllEnemyUnits = 0;
    var _Stopped = false
    
    func PresentVictoryScoreScreen() {
        if _Stopped == false {
            let notificationName = "NSNPresentVictoryController"
            let notification = NSNotification(
                name: notificationName,
                object: self,
                userInfo: ["toastInfo":"doge!"]
            )
            NSNotificationCenter.defaultCenter().postNotification(notification)
        }

    }
    
    
    func Tick() {
        switch _ScenarioKind! {
        case .Campaign:
            CheckCampaignVictoryConditions()
        default:
            CheckDeathmatchVictoryConditions()
        }
    }
    
    func Tick(totalRemainingEnemies: Int) {
        switch _ScenarioKind! {
        case .Campaign:
            CheckCampaignVictoryConditions()
        default:
            CheckDeathmatchVictoryConditionsNEW(totalRemainingEnemies)
        }
    }
    
    func CheckDeathmatchVictoryConditions() {
        if _AllEnemyUnits < 0 {
            PresentVictoryScoreScreen()
        }
    }
    
    func CheckDeathmatchVictoryConditionsNEW(totalRemainingEnemies: Int) {
        if totalRemainingEnemies <= 0 &&
        _Stopped == false {
            //PresentVictoryScoreScreen()
            //AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        }
    }
    
    func CheckCampaignVictoryConditions() {
        
    }
    
}

enum ScenarioKind {
    case Deathmatch, Campaign;
}