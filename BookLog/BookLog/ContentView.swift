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
    
    var body: some View {
        NavigationStack{
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
            .toolbar{
                Button("Add Samples", action: addSamples)
            }
        }
    }
    func addSamples(){
        let first = ReadingMaterial(title: "First Book")
        let second = ReadingMaterial(title: "Second Book")
        let third = ReadingMaterial(title: "Third Book")
        
        modelContext.insert(first)
        modelContext.insert(second)
        modelContext.insert(third)
    }
    func deleteReadingMaterial(_ indexSet: IndexSet){
        for index in indexSet {
            let readingMaterial = readingMaterials[index]
            modelContext.delete(readingMaterial)
        }
    }
}

#Preview {
    ContentView()
}
