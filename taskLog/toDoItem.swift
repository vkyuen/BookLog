//
//  toDoItem.swift
//  taskLog
//
//  Created by Veronica Yuen on 5/1/25.
//

import Foundation
import SwiftData

class toDoItem{
    var name: String
    var dateAdded: Date
    var dateCompleted: Date?
    var lastModified: Date
    var elapsedTime: Double
    var status: Int
    // status 0 = entered
    // status 1 = in-progress
    // status 2 = done
    
    init(name: String = "", dateAdded: Date = .now, dateCompleted: Date? = nil, lastModified: Date = .now, elapsedTime: Double = 0, status: Int = 0) {
        self.name = name
        self.dateAdded = dateAdded
        self.dateCompleted = dateCompleted
        self.lastModified = lastModified
        self.elapsedTime = elapsedTime
        self.status = status
    }
}
