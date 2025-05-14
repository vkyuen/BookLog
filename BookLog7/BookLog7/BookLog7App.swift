//
//  BookLog7App.swift
//  BookLog7
//
//  Created by Veronica Yuen on 5/13/25.
//

import SwiftUI
import SwiftData

@main
struct BookLog7App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ReadingMaterial.self)
    }
}
