//
//  DataModel.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/2/22.
//

import Foundation
import CoreData

class DataModel: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init(){
        container.loadPersistentStores { descrpition , error in
            if let error = error {
                print("Failed to load CoreData: \(error.localizedDescription)")
            }
        }
    }
}
