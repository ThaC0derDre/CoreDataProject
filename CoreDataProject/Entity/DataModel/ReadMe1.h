//
//  ReadMe.h
//  CoreDataProject
//
//  Created by Andres Gutierrez on 5/2/22.
//

#ifndef ReadMe_h
#define ReadMe_h


#endif /* ReadMe_h */

I dont know what the above is.... But anyway!


/* This first Data model tutorial is to show how to avoid leaving optional-unwrapping everywhere throughout the project, since CoreData leaves all your properties optional...
The first method is quick and easy, but not reccommended. And thats to delete the '?'s. Easy enough, but can be error prone if you do unwrap a nil. Unwrapping a nil can be likely since we are no longer requiring a value.
 
 The second method is to safely unwrap the properties in a computed property. The weird thing about this, is that we have to use a different property name..
 For ex,
 let name: String?
 
 var unwrappedName: String {
 name ?? "Unknown Name"
 }
 
 This will get rid of the option name, and return it as the value.
 Rather than unwrapping the option everywhere else in the project, we can do it here, once, and move on.
 
 But its weird we have to use a different title "unwrappedName", rather than "name"..
 
 
 
 
 
