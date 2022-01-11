//
//  NameGameUIApp.swift
//  NameGameUI
//
//  Created by Jordan Ball on 1/11/22.
//

import SwiftUI

@main
struct NameGameUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
