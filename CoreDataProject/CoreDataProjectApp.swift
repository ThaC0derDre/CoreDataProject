//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/2/22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataModel  = DataModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataModel.container.viewContext)
        }
    }
}
