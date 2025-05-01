//
//  BasicItem.swift
//  taskLog
//
//  Created by Veronica Yuen on 4/29/25.
//

import Foundation
import SwiftData

@Model
class BasicItem{
    var name: String
    var dateAdded: Date
    var dateCompleted: Date?
    var lastModified: Date
    var estimatedTime: Int?
    var elapsedTime: Double
    var type: Int
    
    init(name: String = "", dateAdded: Date = .now, dateCompleted: Date? = nil, lastModified: Date = .now, estimatedTime: Int? = nil, elapsedTime: Double = 0, type: Int = 0) {
        self.name = name
        self.dateAdded = dateAdded
        self.dateCompleted = dateCompleted
        self.lastModified = lastModified
        self.estimatedTime = estimatedTime
        self.elapsedTime = elapsedTime
        self.type = type
    }
}
