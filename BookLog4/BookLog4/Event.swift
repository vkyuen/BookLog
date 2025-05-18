//
//  Event.swift
//  booklog4
//
//  Created by Veronica Yuen on 5/17/25.
//

import Foundation
import SwiftData

@Model
class Event{
    var dateStarted: Date
    var dateEnded: Date
    var timeInterval: Int
    var readingMaterial: ReadingMaterial
    
    init(dateStarted: Date, dateEnded: Date, timeInterval: Int, readingMaterial: ReadingMaterial) {
        self.dateStarted = dateStarted
        self.dateEnded = dateEnded
        self.timeInterval = timeInterval
        self.readingMaterial = readingMaterial
    }
}
