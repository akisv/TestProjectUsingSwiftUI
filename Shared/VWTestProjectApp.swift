//
//  VWTestProjectApp.swift
//  Shared
//
//  Created by avavouranakis on 4/11/21.
//

import SwiftUI

@main
struct VWTestProjectApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ProductListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
