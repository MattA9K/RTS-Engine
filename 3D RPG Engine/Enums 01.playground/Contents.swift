//: Playground - noun: a place where people can play

import Cocoa


public enum Config {
    
    case SprintMovement;
    
    
    var Displacement: CGFloat {
        get {
            switch (self) {
            case .SprintMovement:
                return 10
            }
        }
    }
}


let config = Config.SprintMovement.Displacement

print(config)