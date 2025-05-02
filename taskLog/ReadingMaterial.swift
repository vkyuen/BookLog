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
    var author: String?
    var dateCompleted: Date?
    var elapsedTime: Int
    var chapter: Int?
    var words: Int?
    var source: Int?
    var format: Int?
    var typeOfReading: Int?
    var readingStatus: Int?
    
    // source: 0 = purchased, 1 = borrowed, 2 = library
    // format: 0 = physical, 1 = e-book, 2 = audiobook
    // typeOfReading: 0 = leisure, 1 = book club, 2 = academic
    // readingStatus: 0 = tbr, 1 = reading, 2 = done
    
    init(title: String  = "", dateAdded: Date = .now, author: String? = nil, dateCompleted: Date? = nil, elapsedTime: Int = 0, chapter: Int? = nil, words: Int? = nil, source: Int? = nil, format: Int? = nil, typeOfReading: Int? = nil, readingStatus: Int? = nil) {
        self.title = title
        self.dateAdded = dateAdded
        self.author = author
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
