//
//  EditItemView.swift
//  taskLog
//
//  Created by Veronica Yuen on 5/1/25.
//

import SwiftUI
import SwiftData

struct EditItemView: View {
    @Bindable var basicItem: BasicItem
    
    var body: some View {
        Form{
            TextField("Name", text: $basicItem.name)
            DatePicker("Date added", selection: $basicItem.dateAdded)
        }
        .navigationTitle("Edit item")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: BasicItem.self, configurations: config)
        let example = BasicItem(name: "Example item")
        return EditItemView(basicItem: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
