//
//  iOS_hfApp.swift
//  iOS_hf
//
//  Created by Isti on 2024. 11. 27..
//

import SwiftUI

@main
struct iOS_hfApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
