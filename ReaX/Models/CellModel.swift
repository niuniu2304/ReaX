//
//  CellModel.swift
//  ReaX
//
//  Created by Yao on 19/08/2025.
//

import Foundation
import SwiftData
import SwiftUI

struct CellModel: Identifiable {
    let id: String = UUID().uuidString
    var cellState: cellStates = .normal
    
    enum cellStates {
        case normal
        case red
        case green
        case black
        
        var backgroundColor: Color {
            switch self {
            case .normal:
                return .gray
            case .red:
                return .red
            case .green:
                return .green
            case .black:
                return .black
            }
        }
    }
    
}

