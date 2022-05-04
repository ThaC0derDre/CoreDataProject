//
//  ShipDataModel.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/3/22.
//

import Foundation
import CoreData

class ShipDataModel: ObservableObject {
    let container = NSPersistentContainer(name: "ShipModel")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load CoreData: \(error.localizedDescription)")
            }
        }
    }
}
