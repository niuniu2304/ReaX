//
//  Item.swift
//  ReaX
//
//  Created by Yao on 02/08/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var score: Int
    
    init(timestamp: Date, score: Int) {
        self.timestamp = timestamp
        self.score = score
    }
}
