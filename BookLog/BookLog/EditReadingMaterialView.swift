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
    
    @State private var newNote = ""
    @State private var isFormatExpanded = true
    
    var body: some View {
        Form{
            Section(header: Text("Information")){
                TextField("Title", text: $readingMaterial.title)
                TextField("Autor", text: $readingMaterial.author)
                
                Stepper("Number of Chapters: \(readingMaterial.numberOfChapter)", value: $readingMaterial.numberOfChapter)
                
            }
            Section(isExpanded: $isFormatExpanded){
                Picker("Source", selection: $readingMaterial.source){
                    Text("Owned").tag(0)
                    Text("Borrowed from Friend").tag(1)
                    Text("Library").tag(2)
                }
                Picker("Format", selection: $readingMaterial.format){
                    Text("Physical").tag(0)
                    Text("E-book").tag(1)
                    Text("Audiobook").tag(2)
                }
                Picker("Type of reading", selection: $readingMaterial.typeOfReading){
                    Text("Leisure").tag(0)
                    Text("Book club").tag(1)
                    Text("Academic").tag(2)
                }
                Picker("Reading status", selection: $readingMaterial.readingStatus){
                    Text("TBR").tag(0)
                    Text("Reading").tag(1)
                    Text("Finished").tag(2)
                }
            } header: {
                Button("Reading format"){
                    isFormatExpanded.toggle()
                }
                .buttonStyle(.plain)
            }
            Section(header: Text("Dates and times")){
                Text("Date added: " + readingMaterial.dateAdded.formatted(date: .long, time: .shortened))
                Text("Date started: " + readingMaterial.dateStarted.formatted(date: .long, time: .shortened))
                Text("Date finished: " + readingMaterial.dateCompleted.formatted(date: .long, time: .shortened))
                Stepper("Elasped time: \(readingMaterial.elapsedTime)", value: $readingMaterial.elapsedTime)
            }
            Section("Notes"){
                ForEach(readingMaterial.notes){ note in
                    Text(note.note)
                }
                HStack {
                    TextField("Add a note for \(readingMaterial.title)", text: $newNote)
                    Button("Add", action: addNote)
                }
            }
        }
        .navigationTitle(readingMaterial.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func addNote(){
        guard newNote.isEmpty == false
        else{
            return
        }
        withAnimation{
            let note = Note(note: newNote)
            readingMaterial.notes.append(note)
            newNote = ""
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
