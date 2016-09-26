//
//  HeroStats.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 9/15/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import Foundation
import CoreData


protocol HeroStats {
    var unitReference: AbstractUnit { get set }
    
    var Level: Int { get set }
    var SpendPoints: Int { get set }
    var XP: Int { get set }
    var XP_MAX: Int { get set }
    
    var BonusDMG: Int { get set }
    var BonusARM: Int { get set }
    var BonusHP: Int { get set }
    var BonusMagic: Int { get set }
    
    var Strength: Int { get set }
    var Dexterity: Int { get set }
    var Stamina: Int { get set }
    var Magic: Int { get set }
    
    
}


class HeroStat: HeroStats {
    
//    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var unitReference: AbstractUnit
    
    var Level: Int = 1
    var SpendPoints: Int = 5
    var XP: Int = 0
    var XP_MAX: Int = 500
    
    var Strength: Int = 10
    var Dexterity: Int = 5
    var Stamina: Int = 10
    var Magic: Int = 5
    
    var Strength_MAX: Int = 10
    var Dexterity_MAX: Int = 5
    var Stamina_MAX: Int = 10
    var Magic_MAX: Int = 5
    
    var BonusDMG: Int = 0
    var BonusARM: Int = 0
    var BonusHP: Int = 0
    var BonusMagic: Int = 0
    
    init(unit: AbstractUnit) {
        self.unitReference = unit
        
        self.SpendPoints = readStatFromDocuments("SpendPoints")
        self.Strength = readStatFromDocuments("Strength")
        self.Dexterity = readStatFromDocuments("Dexterity")
        self.Stamina = readStatFromDocuments("Stamina")
        self.Magic = readStatFromDocuments("Magic")
        self.Level = readStatFromDocuments("Level")
        
        self.XP = readStatFromDocuments("XP")
        self.XP_MAX = readStatFromDocuments("XP_MAX")
        
        BonusDMG = Int(CGFloat(Strength) * 0.1)
        BonusARM = Int(CGFloat(Dexterity) * 0.1)
        BonusHP = Int(CGFloat(Stamina) * 0.1)
        BonusMagic = Int(CGFloat(Magic) * 0.5)
    }
    
    func addStrength() {
        Strength += 1
        SpendPoints -= 1
        BonusDMG = Int(CGFloat(Strength) * 0.1)
        autoHideLevelUpButton()
        writeStatToDocuments("Strength")
        writeStatToDocuments("SpendPoints")
    }
    
    func addDexterity() {
        Dexterity += 1
        SpendPoints -= 1
        BonusARM = Int(CGFloat(Dexterity) * 0.1)
        autoHideLevelUpButton()
        writeStatToDocuments("Dexterity")
        writeStatToDocuments("SpendPoints")
    }
    
    func addStamina() {
        Stamina += 1
        SpendPoints -= 1
        BonusHP = Int(CGFloat(Stamina) * 0.1)
        autoHideLevelUpButton()
        writeStatToDocuments("Stamina")
        writeStatToDocuments("SpendPoints")
    }
    
    func addMagic() {
        Magic += 1
        SpendPoints -= 1
        BonusMagic = Int(CGFloat(Magic) * 0.5)
        autoHideLevelUpButton()
        writeStatToDocuments("Magic")
        writeStatToDocuments("SpendPoints")
    }
    
    func addExperience(dyingUnit: AbstractUnit) -> Bool {
        let rewardXP = dyingUnit.HP_MAX
        XP += rewardXP
        if XP >= XP_MAX {
            Level += 1
            SpendPoints += 5
            XP_MAX = Int(CGFloat(XP_MAX) * 1.5)
            XP = 0
            unitReference.HP = unitReference.HP_MAX
            
            writeStatToDocuments("SpendPoints")
            writeStatToDocuments("XP")
            writeStatToDocuments("Level")
            writeStatToDocuments("XP_MAX")
            
            return true
        } else {
            return false
        }
    }
    
    func autoHideLevelUpButton() {
        if SpendPoints <= 0 {
            SpendPoints = 0
            unitReference.ReferenceOfGameScene.spriteControlPanel?.ralleyButton.hidden = true
        }
    }
    
    func readStatFromDocuments(property: String) -> Int {
        let file = property + ".txt"
        var strValue: NSString = ""
        if let dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file)
            
            //reading
            do {
                strValue = try NSString(contentsOfURL: path, encoding: NSUTF8StringEncoding)
            }
            catch {}
            
            // DEFAULT STATS
            //  (NEW GAME)
            if strValue == "" {
                if property == "Stamina" {
                    strValue = "10"
                }
                else if property == "Strength" {
                    strValue = "10"
                }
                else if property == "Dexterity" {
                    strValue = "5"
                }
                else if property == "Magic" {
                    strValue = "5"
                }
                else if property == "Level" {
                    strValue = "1"
                }
                else if property == "XP_MAX" {
                    strValue = "500"
                }
                else {
                    strValue = "0"
                }
                do {
                    try strValue.writeToURL(path, atomically: false, encoding: NSUTF8StringEncoding)
                }
                catch {/* error handling here */}
            }
        }
        return strValue.integerValue
    }
    
    func writeStatToDocuments(property: String) {
        let file = property + ".txt"
        var strValue: NSString = ""
        if let dir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file)
            if property == "Stamina" {
                strValue = String(self.Stamina)
            }
            else if property == "Strength" {
                strValue = String(self.Strength)
            }
            else if property == "Dexterity" {
                strValue = String(self.Dexterity)
            }
            else if property == "Magic" {
                strValue = String(self.Magic)
            }
            else if property == "XP" {
                strValue = String(self.XP)
            }
            else if property == "XP_MAX" {
                strValue = String(self.XP_MAX)
            }
            else if property == "SpendPoints" {
                strValue = String(self.SpendPoints)
            }
            else if property == "Level" {
                strValue = String(self.Level)
            }
            do {
                try strValue.writeToURL(path, atomically: false, encoding: NSUTF8StringEncoding)
            }
            catch {/* error handling here */}
        }
    }
    
    func removeOldFile(property: String) {
        let file = property + ".txt"
        var error: NSErrorPointer = nil
        let dir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file)
        
        do {
            let fuckoff = try NSFileManager.defaultManager().removeItemAtURL(NSURL(fileURLWithPath: dir).URLByAppendingPathComponent(file))
        }
        catch {}
    }
    
}




