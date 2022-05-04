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
//    @StateObject private var dataModel  = SingerDM()
    @StateObject private var dataModel  = CandyDM()
    var body: some Scene {
        WindowGroup {
            CandyCV()
                .environment(\.managedObjectContext, dataModel.container.viewContext)
        }
    }
}
