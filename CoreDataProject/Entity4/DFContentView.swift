//
//  DynamicFilteredCV.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/3/22.
//

import SwiftUI
import CoreData

struct DFContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var isDisabled       = false
    @State private var filteredLastName = "A"
    var body: some View {
        VStack{
            // Custom Filter!
            FilteredList(filter: filteredLastName)
            
            Button("Add Examples"){
                let taylor  = Singer(context: moc)
                taylor.firstName    = "Taylor"
                taylor.lastName     = "Swift"
                
                let adele  = Singer(context: moc)
                adele.firstName    = "Adele"
                adele.lastName     = "Adkins"
                
                let ed  = Singer(context: moc)
                ed.firstName    = "Ed"
                ed.lastName     = "Sheeran"
                
                try? moc.save()
                isDisabled  = true
            }
            .disabled(isDisabled)
            
            Button("Show A's"){
                filteredLastName    = "A"
            }
            .padding()
            
            Button("Show S's"){
                filteredLastName    = "S"
            }
            .padding()
        }
    }
}

struct DynamicFilteredCV_Previews: PreviewProvider {
    static var previews: some View {
        DFContentView()
    }
}
