//
//  CellViewModel.swift
//  ReaX
//
//  Created by Yao on 19/08/2025.
//

import Foundation

class GridViewModel: ObservableObject {
    
    
    @Published var life: Int = 3
    @Published var currentScore: Int = 0
    @Published var win: Bool = false
    
    
    @Published var grid: [CellModel] = [
        CellModel(cellState: .red), CellModel(), CellModel(cellState: .red),
        CellModel(cellState: .black), CellModel(cellState: .green), CellModel(),
        CellModel(cellState: .green), CellModel(), CellModel(cellState: .green),
    ]
    
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
    
    
    func changeRandomCells() {
        // Need to add a random time intervall between each changes.
        
        let randomStates: [CellModel.cellStates] = [.green, .red, .black]
        let randomCell: Int = Int.random(in: 0..<9)
        let randomCell1: Int = Int.random(in: 0..<9)
        guard let randomState = randomStates.randomElement() else {
            print("Error: Couldn't get random State")
            return
        }
        guard let randomState1 = randomStates.randomElement() else{
            print("Error: Couldn't get a random state")
            return
        }
        let randomTime: Double = Double.random(in: 0.2..<1)
        let randomBool: Bool = Bool.random()
        
        if randomBool {
            grid[randomCell].cellState = randomState
            grid[randomCell1].cellState = randomState1
            DispatchQueue.main.asyncAfter(deadline: .now() + randomTime){
                self.grid[randomCell].cellState = .normal
                self.grid[randomCell1].cellState = .normal
            }
        } else {
            grid[randomCell].cellState = randomState
            DispatchQueue.main.asyncAfter(deadline: .now() + randomTime){
                self.grid[randomCell].cellState = .normal
            }
        }
        // Change 1 or 2 random Cells 'color' in the grid for a random periode of timer between 0.2 to 1 seconds it lasts then
        // Like grid[arbitrary number variable ].backgroundCOlor == (arbitrary color between red and green and black(-2 lives and more rare if possible)
        // Then AsyncAfter... (arbitraryTime):
        // grid[aribitrary number variable].backgroundCOlor = .normal
        
    }
    
    func gameOver(reset: Bool) {
        
    }
    
    func reset() {
        
    }
}
