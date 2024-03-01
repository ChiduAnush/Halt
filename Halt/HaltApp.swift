//
//  HaltApp.swift
//  Halt
//
//  Created by Chidu Anush on 02/02/24.
//

import SwiftUI

@main
struct HaltApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}


