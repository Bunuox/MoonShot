//
//  MoonshotApp.swift
//  Moonshot
//
//  Created by Bünyamin Kılıçer on 16.01.2022.
//

import SwiftUI

@main
struct MoonshotApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
