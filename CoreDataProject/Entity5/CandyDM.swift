//
//  CandyDM.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/4/22.
//

import Foundation
import CoreData

class CandyDM: ObservableObject {
    let container   = NSPersistentContainer(name: "CandyCDM")
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Error loading Candy CoreDataModel Container: \(error.localizedDescription)")
                return
            }
            self.container.viewContext.mergePolicy  = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
