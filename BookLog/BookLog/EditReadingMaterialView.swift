//
//  EditReadingMaterialView.swift
//  BookLog
//
//  Created by Veronica Yuen on 5/2/25.
//

import SwiftUI
import SwiftData

struct EditReadingMaterialView: View {
    @Bindable var readingMaterial: ReadingMaterial
    
    var body: some View {
        Form{
            Section(header: Text("Information")){
                TextField("Title", text: $readingMaterial.title)
                TextField("Autor", text: $readingMaterial.author)
                Text("Date added: " + readingMaterial.dateAdded.formatted(date: .long, time: .shortened))
                Stepper("Current number of Chapters: \(readingMaterial.numberOfChapter)", value: $readingMaterial.numberOfChapter, in: 1...200)
                
            }
            Section(header: Text("Reading format")){
                
            }
            Section(header: Text("Dates")){
                
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ReadingMaterial.self, configurations: config)
        let example = ReadingMaterial(title: "Example Book")
        return EditReadingMaterialView(readingMaterial: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
