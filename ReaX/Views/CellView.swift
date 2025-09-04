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
                // Deduct points from the score variable (+ make the score variable an environment variable accessible by all are use a @Binding to change it's value Or just make the user lose
                // Maybe use an animation to transition from the color changes
                
                //Minus 200 points if clicked on the red button
                gridViewModel.currentScore -= 200
                gridViewModel.life -= 1
                if gridViewModel.life == 0 {
                    // Add the data from the game to the container
                    gridViewModel.gameOver = true
                    gridViewModel.reset()
                }
            } else if gridViewModel.grid[cellNumber].cellState == .green{
                // Add points to score
                gridViewModel.currentScore += 50
            } else if gridViewModel.grid[cellNumber].cellState == .black {
                // Do nothing or deduct points but less than if it's red
                gridViewModel.currentScore -= 400
                gridViewModel.life -= 1
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
