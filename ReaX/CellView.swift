//
//  CellView.swift
//  ReaX
//
//  Created by Yao on 15/08/2025.
//

import SwiftUI

struct CellView : View {
    @State var cellModel: CellModel
    
    var body: some View {
        Button {
            if cellModel.cellState.backgroundColor == .red {
                // Deduct points from the score variable (+ make the score variable an environment variable accessible by all are use a @Binding to change it's value
                // Maybe use an animation to transition from the color changes
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    self.cellModel.cellState = .black
                }
                self.cellModel.cellState = .normal
            } else if cellModel.cellState.backgroundColor == .green{
                // Add points to score
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    self.cellModel.cellState = .normal
                }
            } else {
                // Do nothing or deduct points but less than if it's red
            }
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 120, height: 120)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(cellModel.cellState.backgroundColor)
        }
    }
}

#Preview {
    CellView(cellModel: CellModel())
}
