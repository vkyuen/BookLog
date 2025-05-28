//
//  ContentView.swift
//  booklog
//
//  Created by Veronica Yuen on 5/20/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            MainBookView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
//            ReviewView()
//                .tabItem{
//                    Label("Review", systemImage: "star")
//                }
        }
    }
}

#Preview {
    ContentView()
}
