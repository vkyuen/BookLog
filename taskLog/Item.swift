//
//  Item.swift
//  taskLog
//
//  Created by Veronica Yuen on 3/18/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
