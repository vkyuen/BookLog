//
//  ReadingMaterial.swift
//  BookLog7
//
//  Created by Veronica Yuen on 5/13/25.
//

import Foundation
import SwiftData

@Model
class ReadingMaterial{
    var title: String
    var dateAdded: Date
    var author: String
    var dateStarted: Date
    var dateCompleted: Date
    var sessionStart: Date
    var elapsedTime: Int
    var numberOfChapter: Int
    var wordCount: Int
    var source: Int
    var format: Int
    var typeOfReading: Int
    var readingStatus: Int
    var currentChapter: Int
    @Relationship(deleteRule: .cascade) var notes = [Note]()
    
    // source: 0 = purchased, 1 = borrowed, 2 = library
    // format: 0 = physical, 1 = e-book, 2 = audiobook
    // typeOfReading: 0 = leisure, 1 = book club, 2 = academic
    // readingStatus: 0 = tbr, 1 = reading, 2 = done
    
    var isInfoExpanded: Bool
    var isFormatExpanded: Bool
    var isDateExpanded: Bool
    
    init(title: String = "", dateAdded: Date = .now, author: String = "", dateStarted: Date = .now, dateCompleted: Date = .now, sessionStart: Date = .now, elapsedTime: Int = 0, numberOfChapter: Int = 0, wordCount: Int = 0, source: Int = 0, format: Int = 0, typeOfReading: Int = 0, readingStatus: Int = 0,currentChapter: Int = 0,  isInfoExpanded: Bool = true, isFormatExpanded: Bool = true, isDateExpanded: Bool = true) {
        self.title = title
        self.dateAdded = dateAdded
        self.author = author
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.sessionStart = sessionStart
        self.elapsedTime = elapsedTime
        self.numberOfChapter = numberOfChapter
        self.wordCount = wordCount
        self.source = source
        self.format = format
        self.currentChapter = currentChapter
        self.typeOfReading = typeOfReading
        self.readingStatus = readingStatus
        self.isInfoExpanded = isInfoExpanded
        self.isFormatExpanded = isFormatExpanded
        self.isDateExpanded = isDateExpanded
    }
}

