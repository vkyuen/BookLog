//
//  ReadingMaterialListingView.swift
//  BookLog5
//
//  Created by Veronica Yuen on 5/13/25.
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
                        HStack{
                            Image(systemName: getIcon(readingStatus: readingMaterial.readingStatus))
                                .imageScale(.large)
                            VStack(alignment: .leading){
                                Text(readingMaterial.title)
                                    .font(.headline)
                                Text(getDate(book: readingMaterial))
                            }
                    }
                }
            }
            .onDelete(perform: deleteReadingMaterial)
        }
    }
    
    init(sort: SortDescriptor<ReadingMaterial>, searchString: String){
        _readingMaterials = Query(filter: #Predicate{
            if searchString.isEmpty{
                return true
            } else {
                return $0.title.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteReadingMaterial(_ indexSet: IndexSet){
        for index in indexSet {
            let readingMaterial = readingMaterials[index]
            modelContext.delete(readingMaterial)
        }
    }
    func getIcon(readingStatus: Int) -> String{
        switch readingStatus{
        case 0: return "book.closed"
        case 1: return "book"
        case 2: return"books.vertical"
        default: return "questionmark.circle"
        }
    }
    func getDate(book: ReadingMaterial)
    -> String{
        switch book.readingStatus{
        case 0: return "Added on: \(book.dateAdded.formatted(date: .numeric, time: .shortened))"
        case 1: return "Started on: \(book.dateStarted.formatted(date: .numeric, time: .shortened))"
        case 2: return"Finished on: \(book.dateCompleted.formatted(date: .numeric, time: .shortened))"
        default: return "What am I doing here?"
        }
    }
}

#Preview {
    ReadingMaterialListingView(sort: SortDescriptor(\ReadingMaterial.title), searchString: "")
}
