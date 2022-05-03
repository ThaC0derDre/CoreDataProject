//
//  ConditionalSaving.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/3/22.
//

import SwiftUI

struct ConditionalSaving: View {
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        Button("Save"){
            //adding conditional to check and see if CoreData actually needs to save anything new.
            if moc.hasChanges{
                try? moc.save()
            }
        }
    }
}

struct ConditionalSaving_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalSaving()
    }
}
