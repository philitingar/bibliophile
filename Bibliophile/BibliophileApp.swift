//
//  BibliophileApp.swift
//  Bibliophile
//
//  Created by Timi on 27/10/22.
//

import SwiftUI

@main
struct BibliophileApp: App {
    
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext) //
        }
    }
}
