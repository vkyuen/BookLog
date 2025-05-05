//
//  ContentView.swift
//  BookLog
//
//  Created by Veronica Yuen on 5/2/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var readingMaterials: [ReadingMaterial]
    @Environment(\.modelContext) var modelContext
    
    @State private var path = [ReadingMaterial]()
    
    var body: some View {
        NavigationStack(path: $path){
            ReadingMaterialListingView()
            .navigationTitle("Book log")
            .navigationDestination(for: ReadingMaterial.self, destination: EditReadingMaterialView.init)
            .toolbar{
                Button("Add material", systemImage: "plus", action: addReadingMaterial)
            }
        }
    }
   
    func addReadingMaterial(){
        let readingMaterial = ReadingMaterial()
        modelContext.insert(readingMaterial)
        path = [readingMaterial]
    }
}

#Preview {
    ContentView()
}
