//
//  CellView.swift
//  ReaX
//
//  Created by Yao on 15/08/2025.
//

import SwiftUI

struct CellView : View {
    
    @State var cellNumber: Int
    @EnvironmentObject var gridViewModel: GridViewModel
    
    var body: some View {
        Button {
            if gridViewModel.grid[cellNumber].cellState == .red {
                gridViewModel.currentScore -= 200
                gridViewModel.life -= 1
                gridViewModel.checkLose()
            } else if gridViewModel.grid[cellNumber].cellState == .green{
                // Add points to score
                gridViewModel.currentScore += 50
            } else if gridViewModel.grid[cellNumber].cellState == .black {
                // Do nothing or deduct points but less than if it's red
                gridViewModel.currentScore -= 400
                gridViewModel.life -= 1
                gridViewModel.checkLose()
            }
        } label: {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 120, height: 120)
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(gridViewModel.grid[cellNumber].cellState.backgroundColor)
        }
    }
}

#Preview {
    CellView(cellNumber: 0)
        .modelContainer(for: Scores.self, inMemory: true)
        .environmentObject(GridViewModel())
        .environmentObject(TimerViewModel())
}
