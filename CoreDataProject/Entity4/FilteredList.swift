//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/3/22.
//

import SwiftUI

/* Custom Filter!
 1. Create fetchRequestVar
 2. Create an init, that passes the desired filter.
 3. Create the UI/View that can be passed onto the content view.
 
 4. Because this view will be used inside ContentView, we don’t even need to inject a managed object context into the environment – it will inherit the context from ContentView.
*/

struct FilteredList: View {
    
    enum FilterMethod: String {
        case beginsWith     = "BEGINSWITH"
        case contains       = "CONTAINS"
        case lessThan       = "<"
        case greaterThan    = ">"
    }
    
    
    // 1
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    var body: some View {
        // 3
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    // 2
    init(predicate: String, filterMethod: FilterMethod , filter: String, sortDescriptor: [SortDescriptor<Singer>]?){
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: sortDescriptor ?? [], predicate: NSPredicate(format: "\(predicate) \(filterMethod) %@", filter))
    }
}

