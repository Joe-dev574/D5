//
//  Exercise.swift
//  D5
//
//  Created by Joseph DeWeese on 8/13/24.
//

import Foundation
import SwiftData

@Model
class Exercise {
    var name: String
    var text: String
    
    
    init(name: String, text: String) {
        self.name = name
        self.text = text

    }
    
   
}
