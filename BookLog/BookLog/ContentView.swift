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
    @State private var sortOrder = SortDescriptor(\ReadingMaterial.title)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path){
            ReadingMaterialListingView(sort: sortOrder, searchString: searchText)
            .navigationTitle("Book log")
            .navigationDestination(for: ReadingMaterial.self, destination: EditReadingMaterialView.init)
            .searchable(text: $searchText)
            .toolbar{
                Button("Add material", systemImage: "plus", action: addReadingMaterial)
                Menu("Sort", systemImage: "line.horizontal.3.decrease"){
                    Picker("Sort", selection: $sortOrder){
                        Text("Title").tag(SortDescriptor(\ReadingMaterial.title))
                        Text("Reading Status").tag(SortDescriptor(\ReadingMaterial.readingStatus))
                        Text("Type of reading").tag(SortDescriptor(\ReadingMaterial.typeOfReading))
                        Text("Date added").tag(SortDescriptor(\ReadingMaterial.dateAdded))
                    }
                    .pickerStyle(.inline)
                }
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
