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
    
    var body: some View {
        Button {
            if cellState.backgroundColor == .red {
                // Deduct points from the score variable (+ make the score variable an environment variable accessible by all are use a @Binding to change it's value
                // Maybe use an animation to transition from the color changes
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    self.cellState = .black
                }
                self.cellState = .normal
            } else if cellState.backgroundColor == .green{
                // Add points to score
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    self.cellState = .normal
                }
            } else {
                // Do nothing or deduct points but less than if it's red
            }
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 120, height: 120)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(cellState.backgroundColor)
                .padding()
        }
    }
}

#Preview {
    CellView(cellState: .red)
}
