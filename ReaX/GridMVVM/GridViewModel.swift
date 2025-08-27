//
//  CellViewModel.swift
//  ReaX
//
//  Created by Yao on 19/08/2025.
//

import Foundation
import SwiftUI

class GridViewModel: ObservableObject {
    @Published var score: Int = 0
    @Published var grid: [CellModel] = [
        CellModel(cellState: .red), CellModel(), CellModel(cellState: .red),
        CellModel(cellState: .black), CellModel(cellState: .green), CellModel(),
        CellModel(cellState: .green), CellModel(), CellModel(cellState: .green),
    ]
    @Published var isPlaying: Bool = false
    
    // If on Tap
    func onTap(cellIndex: Int) {
        if grid[cellIndex].cellState == .red {
            // Deduct points from the score variable (+ make the score variable an environment variable accessible by all are use a @Binding to change it's value
            // Maybe use an animation to transition from the color changes
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                self.grid[cellIndex].cellState = .black
            }
            self.grid[cellIndex].cellState = .normal
        } else if grid[cellIndex].cellState == .green{
            // Add points to score
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                self.grid[cellIndex].cellState = .normal
            }
        } else {
            // Do nothing or deduct points but less than if it's red
        }
    }
    
    func startGame() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.isPlaying = true
        }
    }
    
    func endGame(score: Int) {
        self.score = score
        isPlaying = false
    }
}
