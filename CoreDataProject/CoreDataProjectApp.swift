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
//    @StateObject private var shipDataModel  = ShipDataModel()
    @StateObject private var dataModel  = SingerDM()
    var body: some Scene {
        WindowGroup {
            DFContentView()
                .environment(\.managedObjectContext, dataModel.container.viewContext)
        }
    }
}
