//
//  SingerDM.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/3/22.
//

import Foundation
import CoreData

class SingerDM: ObservableObject {
    let container   = NSPersistentContainer(name: "DynamicFilterOfSingers")
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed loading Singer CoreData: \(error.localizedDescription)")
            }
        }
    }
}
