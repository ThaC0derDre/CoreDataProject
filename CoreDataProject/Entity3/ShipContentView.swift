//
//  ShipContentView.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/3/22.
//

import SwiftUI
/*
 Predicate and NSFiltering!
 Below are different ways of filtering/querying our results.
 */
struct ShipContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name CONTAINS %@", "e")) var ships: FetchedResults<Ship>
    /* For predicate:, try the following:
     1. NSPredicate(format: "universe == 'Star Wars'")
        Alternatively, (format: "universe == %@", "Star Wars")
            '%@', subs the String following the comma.
     
     2. NSPredicate(format: "name < %@", "F")
            This will show what ship name's that begin with A-E (less than F).
                '<', less than symbol here brings back all values for key 'name' the begin with letter before the letter specified.
     
     3. NSPredicate(format: "universe IN %@", ["Aliens", "FireFly", "Star Trek"])
            'IN', sorts value for key 'universe' in the given array.
     
     4. NSPredicate(format: "name BEGINSWITH %@", "E")
            'BEGINSWITH', obviously brings back all values for key 'name' that begin with letter specified.
                This is case-sensitive! "E" is not the same as "e". To bring back case-INsensitive results, use [c], like so..
        - NSPredicate(format: "name BEGINSWITH[c] %@", "E")
     
     5. NSPredicate(format: "name CONTAINS %@", "E")
            'CONTAINS', brings back all values that contain the CASE-SENSITIVES letter specified. [c] to make Case-INsensitive.
     
     6. NSPredicate(format: "NOT name CONTAINS %@", "E")
            'NOT', is equivelent to the ! symbol in the example: !false.
     
     7. NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)
            '%K', K = Key. Use this to pass a key if using a custom Filter/ @FetchRequest, like we do in FilteredList()
     
     */
    
    
    var body: some View {
        VStack{
            List(ships, id: \.self){ ship in
                Text(ship.name ?? "Unknown Ship name")
            }
            Button("Add Ships"){
                let ship1       = Ship(context: moc)
                ship1.name      = "Enterprise"
                ship1.universe  = "Star Trek"
                
                let ship2       = Ship(context: moc)
                ship2.name      = "Defiant"
                ship2.universe  = "Star Trek"
                
                let ship3       = Ship(context: moc)
                ship3.name      = "Millennium Falcon"
                ship3.universe  = "Star Wars"
                
                let ship4       = Ship(context: moc)
                ship4.name      = "Executor"
                ship4.universe  = "Star Wars"
                
                try? moc.save()
            }
        }
    }
}

struct ShipContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShipContentView()
    }
}
