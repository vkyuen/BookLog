//
//  EditingReadingMaterialView.swift
//  taskLog
//
//  Created by Veronica Yuen on 5/1/25.
//

import SwiftUI
import SwiftData

struct EditReadingMaterialView: View {
    @Bindable var readingMaterial: ReadingMaterial
    
    var body: some View {
        Form {
            // general information
            TextField("Title", text: $readingMaterial.title)
            TextField("Author", text: $readingMaterial.author)
            // Number of chapters
            // number of words
            // source
            // format
            
            // My own tracker
            // type of reading
            // date added
            // date started
            // date ended
            // Elapsed time
            // status
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
