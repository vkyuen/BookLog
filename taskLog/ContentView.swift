//
//  ContentView.swift
//  taskLog
//
//  Created by Veronica Yuen on 3/18/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var basicItems: [BasicItem]
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(basicItems) {basicItem in
                    VStack(alignment: .leading){
                        Text(basicItem.name)
                            .font(.headline)
                        Text(basicItem.dateAdded.formatted(date: .long, time: .shortened))
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("Items")
            .toolbar{
                Button("Add Samples", action: addSamples)
            }
        }
    }
    
    func addSamples(){
        let first = BasicItem(name: "Create class")
        let second = BasicItem(name: "Add things")
        let third = BasicItem(name: "Display")
        
        modelContext.insert(first)
        modelContext.insert(second)
        modelContext.insert(third)
    }
    
    func deleteItem(_ indexSet: IndexSet){
        for index in indexSet{
            let item = basicItems[index]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ContentView()
}
