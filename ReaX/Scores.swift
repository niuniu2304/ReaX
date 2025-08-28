//
//  Item.swift
//  ReaX
//
//  Created by Yao on 02/08/2025.
//

import Foundation
import SwiftData

@Model
final class Scores {
    var timestamp: Date
    var score: Int
    var time: String
    
    init(timestamp: Date, score: Int, time: String) {
        self.timestamp = timestamp
        self.score = score
        self.time = time
    }
}
