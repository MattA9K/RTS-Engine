//
//  CorePlayerStats+CoreDataProperties.swift
//  
//
//  Created by Mateusz Andrzejczuk on 9/19/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CorePlayerStats {

    @NSManaged var coreStamina: NSNumber?
    @NSManaged var coreStrength: NSNumber?
    @NSManaged var coreDexterity: NSNumber?
    @NSManaged var coreMagic: NSNumber?
    @NSManaged var coreUnitLevel: NSNumber?

}
