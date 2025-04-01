//
//  taskItem.swift
//  taskLog
//
//  Created by Veronica Yuen on 3/18/25.
//

import Foundation
import SwiftData

@Model
final class taskItem {
    var id = UUID()
    var name: String
    var createDate: Date
    var category: String?
    var estimatedTime: Int?
    var isDone: Bool = false
    var dateCompleted: Date?
    var elapsedTime: Double
    
    init(name: String) {
        self.name = name
        self.createDate = Date.now
        elapsedTime = 0
        
    }
}
