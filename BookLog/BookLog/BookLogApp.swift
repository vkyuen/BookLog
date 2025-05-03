//
//  BookLogApp.swift
//  BookLog
//
//  Created by Veronica Yuen on 5/2/25.
//

import SwiftUI
import SwiftData

@main
struct BookLogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ReadingMaterial.self)
    }
}
