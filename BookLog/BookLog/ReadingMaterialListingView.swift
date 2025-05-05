//
//  ReadingMaterialListingView.swift
//  BookLog
//
//  Created by Veronica Yuen on 5/4/25.
//

import SwiftUI
import SwiftData

struct ReadingMaterialListingView: View {
    @Query var readingMaterials: [ReadingMaterial]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
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
    }
    func deleteReadingMaterial(_ indexSet: IndexSet){
        for index in indexSet {
            let readingMaterial = readingMaterials[index]
            modelContext.delete(readingMaterial)
        }
    }
}

#Preview {
    ReadingMaterialListingView()
}
