//
//  CellView.swift
//  ReaX
//
//  Created by Yao on 15/08/2025.
//

import SwiftUI

struct CellView : View {
    @State var cellModel: CellModel
    // Needs to connect it to gridView
    @StateObject var gridViewModel: GridViewModel
    
    var body: some View {
        Button {
            if cellModel.cellState.backgroundColor == .red {
                // Deduct points from the score variable (+ make the score variable an environment variable accessible by all are use a @Binding to change it's value Or just make the user lose
                // Maybe use an animation to transition from the color changes
                
                //Minus 2 points if clicked on the red button
                gridViewModel.score -= 2
                
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
    CellView(cellModel: CellModel(), gridViewModel: GridViewModel())
}
