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
    var isMax: Bool
    
    init(timestamp: Date, score: Int, isMax: Bool) {
        self.timestamp = timestamp
        self.score = score
        self.isMax = isMax
    }
}
