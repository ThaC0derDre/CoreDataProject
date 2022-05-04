//
//  Country+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/4/22.
//
//

import Foundation
import CoreData

/*
 1. Change NSSet to Set to Array, so that we can use in ForEach Loop
    As of now, NSSet has ANY type. Goal is to make NSSet to a Set of 'Candy's'
 
 2. Sorting a Set, automatically returns an Array.
 */
extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?

    public var wrappedFullName: String {
        fullName ?? "Unknown Full Name"
    }
    
    public var wrappedShortName: String {
        shortName ?? "Unknown Short Name"
    }
    
    // 1. Wrapping and changing to sorted set aka array
    public var candyArray: [Candy] {
        
        // TypeCase NSSet to Set. NilCoalese like other properties.
        let set = candy as? Set<Candy> ?? []
        
        // 2. Change Set to an Array by sorting. Return.
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

    
    
}

extension Country : Identifiable {

}
