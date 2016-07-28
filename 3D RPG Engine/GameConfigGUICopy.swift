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
    case Credits, ExitGame;
    
    var Title: String {
        get {
            switch (self) {
            case .Credits:
                return "Scion: Command & Control";
            case .ExitGame:
                return "Surrender";
            default:
                return "";
            }
        }
    }
    
    var Body: String {
        get {
            switch (self) {
            case .Credits:
                return "Art, Design, and Engineering done by Matt Andrzejczuk.";
            case .ExitGame:
                return "Return to main menu?";
            default:
                return "Art, Design, and Engineering done by Matt Andrzejczuk.";
            }
        }
    }
    
    var RejectButton: String {
        get {
            switch (self) {
            case .ExitGame:
                return "No";
            default:
                return "Cancel";
            }
        }
    }
    
    var AcceptButton: String {
        get {
            switch (self) {
            case .Credits:
                return "Close";
            case .ExitGame:
                return "Yes";
            default:
                return "Art, Design, and Engineering done by Matt Andrzejczuk.";
            }
        }
    }
    
}