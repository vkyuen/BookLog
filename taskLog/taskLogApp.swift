//
//  taskLogApp.swift
//  taskLog
//
//  Created by Veronica Yuen on 3/18/25.
//

import SwiftUI
import SwiftData

@main
struct taskLogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ReadingMaterial.self)
    }
}
