//
//  WizardContentView.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/3/22.
//

import SwiftUI

struct WizardContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                    // will throw error, since we added constraint to prevent duplicates. But will not throw error if we add merge policy to dataModel. Instead, a single property will be added, with no dups!
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct WizardContentView_Previews: PreviewProvider {
    static var previews: some View {
        WizardContentView()
    }
}
