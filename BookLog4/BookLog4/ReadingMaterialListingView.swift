//
//  ReadingMaterialListingView.swift
//  booklog4
//
//  Created by Veronica Yuen on 5/16/25.
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
                            if readingMaterial.readingStatus != 1{
                                Text(getDate(book: readingMaterial))
                            }else{
                                HStack{
                                    Text("Finished chapter \(readingMaterial.currentChapter) of \(readingMaterial.numberOfChapter)")
                                    Spacer()
                                    Image(systemName: getTimerIcon(isTimerActive: readingMaterial.isTimerActive))
                                        .imageScale(.large)
                                        .onTapGesture {
                                            timerButton(readingMaterial: readingMaterial)
                                        }
                                }
                            }
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
    func getTimerIcon(isTimerActive: Bool) -> String{
        if isTimerActive{
            return "stop.circle"
        }else{
            return "play.circle"
        }
    }
    func timerButton(readingMaterial: ReadingMaterial){
        print("in timer buton")
        // look at the timer status
        // if timer is active,then timer needs to end, add an event object
        // if timer is not active, make a note of the time, and change the status.
        if readingMaterial.isTimerActive{
            print ("timer is active")
            // end timer, do the math.
            let time = Date().timeIntervalSince(readingMaterial.sessionStart)
            print("timer ran for: \(time)")
            print("Session start: \(readingMaterial.sessionStart)")
            print("Session end: \(Date.now)")
            let newEvent = Event(dateStarted: readingMaterial.sessionStart, dateEnded: Date.now, timeInterval: time, readingMaterial: readingMaterial)
            readingMaterial.event.append(newEvent)
            readingMaterial.isTimerActive = false
        }else{
            print("timer was not active")
            // timer was not active, update start time, and change boolean
            readingMaterial.sessionStart = .now
            readingMaterial.isTimerActive = true
        }
    }
}

#Preview {
    ReadingMaterialListingView(sort: SortDescriptor(\ReadingMaterial.title), searchString: "")
}
