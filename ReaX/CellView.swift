//
//  CellView.swift
//  ReaX
//
//  Created by Yao on 15/08/2025.
//

import SwiftUI

struct CellView: View {
    @State var cellState: cellStates
    
    enum cellStates {
        case normal
        case red
        case green
        
        var backgroundColor: Color {
            switch self {
            case .normal:
                return .clear
            case .red:
                return .red
            case .green:
                return .green
            }
        }
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 250, height: 250)
            .foregroundStyle(cellState.backgroundColor)
    }
}

#Preview {
    CellView(cellState: .green)
}
