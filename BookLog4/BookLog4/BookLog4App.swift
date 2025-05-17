//
//  booklog4App.swift
//  booklog4
//
//  Created by Veronica Yuen on 5/16/25.
//

import SwiftUI
import SwiftData

@main
struct booklog4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ReadingMaterial.self)
    }
}
