//
//  DataController.swift
//  Bibliophile
//
//  Created by Timi on 28/10/22.
//
import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bibliophile")//You’ve already met data models, which store definitions of the entities and attributes we want to use, and NSPersistentStoreContainer, which handles loading the actual data we have saved to the user’s device. Well, you just met the third piece of the Core Data puzzle: managed object contexts. These are effectively the “live” version of your data – when you load objects and change them, those changes only exist in memory until you specifically save them back to the persistent store.
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to lead: \(error.localizedDescription)")
            } //write a small initializer for DataController that loads our stored data immediately. If things go wrong – unlikely, but not impossible – we’ll print a message to the Xcode debug log.
        }
    }
}
