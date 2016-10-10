//
//  GameConfigGUICopy.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 7/28/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import UIKit


public enum AntiochAlertType {
    case credits, exitGame;
    
    var Title: String {
        get {
            switch (self) {
            case .credits:
                return "Scion: Command & Control";
            case .exitGame:
                return "Surrender";
            default:
                return "";
            }
        }
    }
    
    var Body: String {
        get {
            switch (self) {
            case .credits:
                return "Art, Design, and Engineering done by Matt Andrzejczuk.";
            case .exitGame:
                return "Return to main menu?";
            default:
                return "Art, Design, and Engineering done by Matt Andrzejczuk.";
            }
        }
    }
    
    var RejectButton: String {
        get {
            switch (self) {
            case .exitGame:
                return "No";
            default:
                return "Cancel";
            }
        }
    }
    
    var AcceptButton: String {
        get {
            switch (self) {
            case .credits:
                return "Close";
            case .exitGame:
                return "Yes";
            default:
                return "Art, Design, and Engineering done by Matt Andrzejczuk.";
            }
        }
    }
    
}
