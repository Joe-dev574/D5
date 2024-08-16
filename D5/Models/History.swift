//
//  History.swift
//  D5
//
//  Created by Joseph DeWeese on 8/13/24.
//

import Foundation
import SwiftData

@Model
class History {
    var creationDate: Date = Date.now
    var text: String
    var exerciseList: [Exercise]?
    var page: String?
    
    init(text: String, page: String? = nil) {
        self.text = text
        self.page = page
    }
    
    
}
