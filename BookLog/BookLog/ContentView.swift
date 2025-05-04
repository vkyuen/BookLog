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
            List{
                ForEach(readingMaterials){readingMaterial in
                    NavigationLink(value: readingMaterial){
                        VStack(alignment: .leading){
                            Text(readingMaterial.title)
                                .font(.headline)
                            Text(readingMaterial.dateAdded.formatted(date: .long, time: .shortened))
                        }
                    }
                }
                .onDelete(perform: deleteReadingMaterial)
            }
            .navigationTitle("Book log")
            .navigationDestination(for: ReadingMaterial.self, destination: EditReadingMaterialView.init)
            .toolbar{
                Button("Add material", systemImage: "plus", action: addReadingMaterial)
            }
        }
    }
    func deleteReadingMaterial(_ indexSet: IndexSet){
        for index in indexSet {
            let readingMaterial = readingMaterials[index]
            modelContext.delete(readingMaterial)
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
