//
//  CellViewModel.swift
//  ReaX
//
//  Created by Yao on 19/08/2025.
//

import Foundation

class GridViewModel: ObservableObject {
    
    enum timerState {
        case start
        case stop
        case end
    }
    
    @Published var score: Int = 0
    private var time: Double = 0
    @Published var finalTime: String = ""
    var timer = Timer()
    @Published var timerState: timerState = .stop
    
    
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
    
    func startGame() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.timerState = .start
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { timer in
                self.time += 0.1
            })
        }
    }
    
    func pause(){
        timer.invalidate()
        self.timerState = .stop
        
    }
    
    func endGame(score: Int) {
        self.score = score
        self.timerState = .end
        self.timer.invalidate()
        self.finalTime = String(format:"%.2f", time)
    }
}
