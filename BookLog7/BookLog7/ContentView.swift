//
//  ContentView.swift
//  BookLog7
//
//  Created by Veronica Yuen on 5/13/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainBookView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
