//
//  booklogApp.swift
//  booklog
//
//  Created by Veronica Yuen on 5/20/25.
//

import SwiftUI
import SwiftData

@main
struct booklogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ReadingMaterial.self)
    }
}
