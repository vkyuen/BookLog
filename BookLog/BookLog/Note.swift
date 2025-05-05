//
//  Note.swift
//  BookLog
//
//  Created by Veronica Yuen on 5/4/25.
//

import Foundation
import SwiftData

@Model
class Note{
    var note: String
    var dateCreated: Date
    
    init(note: String, dateCreated: Date = .now) {
        self.note = note
        self.dateCreated = dateCreated
    }
}
