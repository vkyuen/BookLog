//
//  BookLog2App.swift
//  BookLog2
//
//  Created by Veronica Yuen on 5/6/25.
//

import SwiftUI
import SwiftData

@main
struct BookLog2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ReadingMaterial.self)
    }
}
