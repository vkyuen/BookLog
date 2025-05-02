//
//  ContentView.swift
//  taskLog
//
//  Created by Veronica Yuen on 3/18/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var readingMaterials: [ReadingMaterial]
    var body: some View {
        NavigationStack{
            List{
                ForEach(readingMaterials){readingMaterial in
                    VStack(alignment: .leading){
                        Text(readingMaterial.name)
                            .font(.headline)
                        Text(readingMaterial.dateAdded.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .navigationTitle("Reading List")
        }
    }
}

#Preview {
    ContentView()
}
