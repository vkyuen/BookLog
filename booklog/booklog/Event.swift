//
//  Event.swift
//  booklog
//
//  Created by Veronica Yuen on 5/20/25.
//

import Foundation
import SwiftData

@Model
class Event{
    var dateStarted: Date
    var dateEnded: Date
    var timeInterval: Double
    var readingMaterial: ReadingMaterial
    
    init(dateStarted: Date, dateEnded: Date, timeInterval: Double = 0, readingMaterial: ReadingMaterial) {
        self.dateStarted = dateStarted
        self.dateEnded = dateEnded
        self.timeInterval = timeInterval
        self.readingMaterial = readingMaterial
    }
}
