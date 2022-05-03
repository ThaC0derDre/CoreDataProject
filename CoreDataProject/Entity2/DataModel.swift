//
//  DataModel.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/2/22.
//

import Foundation
import CoreData

class DataModel: ObservableObject {
    let container = NSPersistentContainer(name: "WizardModel")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load CoreData: \(error.localizedDescription)")
                //2. add return to back out
                return
            }
            //2. When a duplicate value is attempted, merge will create a single property, avoiding errors and duplicates.
                self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
            
        }
    }
}
