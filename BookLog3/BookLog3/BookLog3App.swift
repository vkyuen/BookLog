//
//  BookLog3App.swift
//  BookLog3
//
//  Created by Veronica Yuen on 5/6/25.
//

import SwiftUI
import SwiftData

@main
struct BookLog3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ReadingMaterial.self)
    }
}
