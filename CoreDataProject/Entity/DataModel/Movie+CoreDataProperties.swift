//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/2/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var director: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16
    
    // Note: All of the above was already there from Editor/Create NSManagedClass...
    
    //1. To get rid of having to unwrap everywhere in our project, we could just delete the question marks '?' that CoreData assigns to the properties. But this is not recommend as it is now error prone, and can unwrap an optional-- causing app to crash.
    
    //2. Second method below, Create computed property that safely unwraps property for us.
    
    public var unwrappedDirector: String {
        director ?? "Unknown Director"
    }

}

extension Movie : Identifiable {

}
