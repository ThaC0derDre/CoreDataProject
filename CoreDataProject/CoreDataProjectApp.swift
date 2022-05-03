//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/2/22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
//    @StateObject private var dataModel  = DataModel()
    @StateObject private var shipDataModel  = ShipDataModel()
    var body: some Scene {
        WindowGroup {
            ShipContentView()
                .environment(\.managedObjectContext, shipDataModel.container.viewContext)
        }
    }
}
