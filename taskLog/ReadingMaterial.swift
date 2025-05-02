//
//  ReadingMaterial.swift
//  taskLog
//
//  Created by Veronica Yuen on 5/1/25.
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
    var elapsedTime: Int
    var chapter: Int
    var words: Int
    var source: Int
    var format: Int
    var typeOfReading: Int
    var readingStatus: Int
    
    // source: 0 = purchased, 1 = borrowed, 2 = library
    // format: 0 = physical, 1 = e-book, 2 = audiobook
    // typeOfReading: 0 = leisure, 1 = book club, 2 = academic
    // readingStatus: 0 = tbr, 1 = reading, 2 = done
    
    init(title: String  = "", dateAdded: Date = .now, author: String = "", dateStarted: Date = .now, dateCompleted: Date = .now, elapsedTime: Int = 0, chapter: Int = 0, words: Int = 0, source: Int = 0, format: Int = 0, typeOfReading: Int = 0, readingStatus: Int = 0) {
        self.title = title
        self.dateAdded = dateAdded
        self.author = author
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.elapsedTime = elapsedTime
        self.chapter = chapter
        self.words = words
        self.source = source
        self.format = format
        self.typeOfReading = typeOfReading
        self.readingStatus = readingStatus
    }
}

