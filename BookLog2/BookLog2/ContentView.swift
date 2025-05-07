//
//  ContentView.swift
//  BookLog2
//
//  Created by Veronica Yuen on 5/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainBookView()
                .tabItem{
                    Label("Home", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
