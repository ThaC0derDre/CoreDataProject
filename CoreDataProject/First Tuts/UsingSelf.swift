//
//  UsingSelf.swift
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/2/22.
//

import SwiftUI

/*
 
 TLDR:
 \.self looks up HashValues. CoreData entites conform to Hashable, and therefore can be used with \.self.
 
 
 /.self locates and returns all of an object, it's properties and all. But what makes this work, is that an object be Hashable.
 Hashes are unique hexidecimal characters, also called Hash Values, that refer to an object. I imagine like a receipt. A unique reference to a specific object.
 Swift will automatically generate these Hash Values for us if an object conforms to Hashable. \.self then looks for hash and reports back it's reference.
 
 An example, say you wanted to listen to a specific song from your ipod. Rather than pressing 'next track' hundreds of times until you find a song, you can save time by searching a reference, ie, the song title. Since a hecidecimal is so unique, It can immediately locate a object, and also know that it wont be confused with any other object.
 
 */



struct UsingSelf: View {
    // 2. Using custom Hashable struct
    var devs    = [Devs(name: "Paul Hudson"), Devs(name: "Sean Allen")]
    // 3. Using a non-Hashable Struct, with the same property
    
    var nonHashDevs    = [NonHashDevs(name: "Paul Hudson"), NonHashDevs(name: "Sean Allen")]
    
    var body: some View {
        VStack{
            List{
                Section{
                    ForEach([2,4,6,8,10], id: \.self) {
                        Text("\($0) is even")
                        // since each object is unique here, .self will work. But if an object is repeated, you have an issue.
                    }
                } header: {
                    Text("Even Numbers")
                }
            // 2.
                Section{
                    ForEach(devs, id: \.self){ dev in
                        Text(dev.name)
                    }
                } header: {
                    Text("Developers")
                }
                
                // 3. Code wont run. "ForEach req's that 'NonHashDevs' conforms to 'Hashable'"
//                Section{
//                    ForEach(nonHashDevs, id: \.self){ dev in
//                        Text(dev.name)
//                    }
//                } header: {
//                    Text("Developers")
//                }
            }
        }
        
    }
}

//MARK: - Creating a custom hashable struct:

struct Devs: Hashable {
    let name: String
    // Strings are hashable, therefore this struct has no problem conforming to Hashable. Being identifiable, this struct can be used with .self
}

struct NonHashDevs {
    let name: String
    // This struct is nearly identical, but will not work with .self
}


struct UsingSelf_Previews: PreviewProvider {
    static var previews: some View {
        UsingSelf()
    }
}
