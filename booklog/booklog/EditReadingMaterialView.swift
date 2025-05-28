//
//  EditReadingMaterialView.swift
//  booklog
//
//  Created by Veronica Yuen on 5/20/25.
//

import SwiftUI
import SwiftData

struct EditReadingMaterialView: View {
    @Bindable var readingMaterial: ReadingMaterial
//    @Environment(\.modelContext) var modelContext
    
    @State private var newNote = ""
    @State private var newReview = ""
    
    var body: some View {
        Form{
            Section(isExpanded: $readingMaterial.isInfoExpanded){
                TextField("Title", text: $readingMaterial.title)
                TextField("Autor", text: $readingMaterial.author)
                
                Stepper("Number of Chapters: \(readingMaterial.numberOfChapter)", value: $readingMaterial.numberOfChapter, in: 1...500)
                
            } header: {
                Button("Information", systemImage: getArrow(isExpanded: readingMaterial.isInfoExpanded)){
                    readingMaterial.isInfoExpanded.toggle()
                }
                .buttonStyle(.plain)
            }
            Section(isExpanded: $readingMaterial.isFormatExpanded){
                Picker("Source", selection: $readingMaterial.source){
                    Text("Owned").tag(0)
                    Text("Borrowed").tag(1)
                    Text("Library").tag(2)
                }
                .pickerStyle(.segmented)
                Picker("Format", selection: $readingMaterial.format){
                    Text("Physical").tag(0)
                    Text("E-book").tag(1)
                    Text("Audiobook").tag(2)
                }
                .pickerStyle(.segmented)
//                Picker("Type of reading", selection: $readingMaterial.typeOfReading){
//                    Text("Leisure").tag(0)
//                    Text("Book club").tag(1)
//                    Text("Academic").tag(2)
//                }
                .pickerStyle(.segmented)
                Picker("Reading status", selection: $readingMaterial.readingStatus){
                    Text("TBR").tag(0)
                    Text("Reading").tag(1)
                    Text("Finished").tag(2)
                }
                .pickerStyle(.segmented)
                .onChange(of: readingMaterial.readingStatus, {
                    updateDate()
                })
            } header: {
                Button("Reading format", systemImage: getArrow(isExpanded: readingMaterial.isFormatExpanded)){
                    readingMaterial.isFormatExpanded.toggle()
                }
                .buttonStyle(.plain)
            }
            Section(isExpanded: $readingMaterial.isDateExpanded){
                Text("Date added: " + readingMaterial.dateAdded.formatted(date: .long, time: .shortened))
                if readingMaterial.readingStatus >= 1{
                    Text("Date started: " + readingMaterial.dateStarted.formatted(date: .long, time: .shortened))
                }
                if readingMaterial.readingStatus >= 2{
                    Text("Date finished: " + readingMaterial.dateCompleted.formatted(date: .long, time: .shortened))
                }
                
                
                Stepper("Elasped time: \(readingMaterial.elapsedTime)", value: $readingMaterial.elapsedTime, in: 0...2000000, step: 60)
                
                if readingMaterial.readingStatus == 1{
                    Stepper("Current chapter: \(readingMaterial.currentChapter)", value: $readingMaterial.currentChapter, in: 0...readingMaterial.numberOfChapter)
                }
            }header:{
                Button("Dates and times", systemImage: getArrow(isExpanded: readingMaterial.isDateExpanded)){
                    readingMaterial.isDateExpanded.toggle()
                }
                .buttonStyle(.plain)
            }
            
            Section(isExpanded: $readingMaterial.isNoteExpanded){
                    ForEach(readingMaterial.notes){ note in
                        Text(note.note)
                    }
                    .onDelete(perform: deleteNote)
                    HStack {
                        TextField("Add a note for \(readingMaterial.title)", text: $newNote)
                        Button("Add", action: addNote)
                }
            } header:{
                Button("Notes", systemImage: getArrow(isExpanded: readingMaterial.isNoteExpanded)){
                    readingMaterial.isNoteExpanded.toggle()
                }
                .buttonStyle(.plain)
            }// end section Notes
            
            Section(isExpanded: $readingMaterial.isEventExpanded){
                //?
            }header:{
                Button("Events", systemImage: getArrow(isExpanded: readingMaterial.isEventExpanded)){
                    readingMaterial.isEventExpanded.toggle()
                }
                .buttonStyle(.plain)
            }
//            Section("Reviews"){
//                NavigationStack(){
//                    ForEach(readingMaterial.reviews){ review in
//                        Text(review.note)
//                    }
//                    .onDelete(perform: deleteReview)
//                    HStack {
//                        TextField("Add a Review for \(readingMaterial.title)", text: $newReview)
//                        Button("Add", action: addNote)
//                    }
//                }
//            }
            
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
            let note = Note(note: newNote, readingMaterial: readingMaterial)
            readingMaterial.notes.append(note)
            newNote = ""
        }
    }
    
//    func addReview(){
//        guard newReview.isEmpty == false
//        else{
//            return
//        }
//        withAnimation{
//            let review = Review(book: readingMaterial, note: newReview)
//            readingMaterial.reviews.append(review)
//            newReview = ""
//        }
//    }
    
    func deleteNote(_ indexSet: IndexSet){
        for index in indexSet {
            // let note = readingMaterial.notes[index]
            readingMaterial.notes.remove(at: index)
            
        }
    }
    
//    func deleteReview(_ indexSet: IndexSet){
//        for index in indexSet {
//            let note = readingMaterial.notes[index]
//            print(note.note)
////            modelContext.delete(note)
//
//        }
//    }
    
    func deleteEvent(_ indexSet: IndexSet){
        for index in indexSet {
//            let event = readingMaterial.event[index]
            readingMaterial.event.remove(at: index)
            
        }
    }
    
    func updateDate(){
        switch readingMaterial.readingStatus{
        case 0: break  // don't do anything
        case 1:  readingMaterial.dateStarted = Date.now
        case 2: readingMaterial.dateCompleted = Date.now
        default:  // nothing needs to change
            print("Something went wrong in updateDate function in Edit view")
        }
    }
    
    func getArrow(isExpanded: Bool) -> String{
        if isExpanded{
            return "chevron.compact.up"
        }else{
            return "chevron.compact.down"
        }
    }
    
}

#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: ReadingMaterial.self, configurations: config)
//        let example = ReadingMaterial(title: "Example Book")
//        return EditReadingMaterialView(readingMaterial: example)
//            .modelContainer(container)
//    } catch {
//        fatalError("Failed to create model container.")
//    }
}
