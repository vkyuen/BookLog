//
//  toDo.swift
//  taskLog
//
//  Created by Veronica Yuen on 4/29/25.
//

import Foundation
import SwiftData

class toDo: BasicItem{
    var category: Int = 0
    var status: Int = 0
    
    // category 0 = regular to-do
    // category 1 = chores
    // category 2 = school
    // category 3 = work
    
    // status 0 = entered
    // status 1 = started
    // status 2 = completed
    // status 3 = archived
}
