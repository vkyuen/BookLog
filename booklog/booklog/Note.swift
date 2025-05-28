//
//  Note.swift
//  booklog
//
//  Created by Veronica Yuen on 5/20/25.
//

import Foundation
import SwiftData

@Model
class Note{
    var note: String
    var dateCreated: Date
    var readingMaterial: ReadingMaterial
    
    init(note: String, dateCreated: Date = .now, readingMaterial: ReadingMaterial) {
        self.note = note
        self.dateCreated = dateCreated
        self.readingMaterial = readingMaterial
    }
}
