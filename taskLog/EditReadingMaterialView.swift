//
//  EditReadingMaterialView.swift
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
            TextField("Title", text: $readingMaterial.title)
            TextField("Author", text: $readingMaterial.author)
            
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
