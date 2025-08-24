//
//  CellViewModel.swift
//  ReaX
//
//  Created by Yao on 19/08/2025.
//

import Foundation

class CellViewModel: ObservableObject {
    @Published var grid: [CellModel] = [
        CellModel(), CellModel(), CellModel(),
        CellModel(), CellModel(), CellModel(),
        CellModel(), CellModel(), CellModel(),
    ]
    
    // If on Tap
    func onTap(cellIndex: Int) {
        if grid[cellIndex].backgroundColor == .red {
            // Deduct points from the score variable (+ make the score variable an environment variable accessible by all are use a @Binding to change it's value
            // Maybe use an animation to transition from the color changes
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                self.grid[cellIndex].backgroundColor = .black
            }
            self.grid[cellIndex].backgroundColor = .normal
        } else if grid[cellIndex].backgroundColor == .green{
            // Add points to score
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                self.grid[cellIndex].backgroundColor = .normal
            }
        } else {
            // Do nothing or deduct points but less than if it's red
        }
    }
}
