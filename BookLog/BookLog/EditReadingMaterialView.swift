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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
