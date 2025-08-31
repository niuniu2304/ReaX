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
    }
    
    @Published var life: Int = 3
    
    var timer = Timer()
    @Published var win: Bool = false
    
    private var minutes = 0
    private var seconds = 0
    @Published var finalTime: String = ""
    
    @Published var score: Int = 0
    @Published var countDown: Int = 3
    @Published var timerState: timerState = .start
    
    
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
        // Change 1 or 2 random Cells 'color' in the grid for a random periode of timer between 0.2 to 1 seconds it lasts then
        // Like grid[arbitrary number variable ].backgroundCOlor == (arbitrary color between red and green and black(-2 lives and more rare if possible)
        // Then AsyncAfter... (arbitraryTime):
        // grid[aribitrary number variable].backgroundCOlor = .normal
        
    }
    
    func startGame() {
        
        // Make logic to make 1 or 2 cells randomly change state to green or red every randome timeIntervall
        
            self.timerState = .start
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [self] timer in
                if countDown != 0 {
                    countDown -= 1
                }else {
                    self.seconds += 1
                    if self.seconds == 60 {
                        self.seconds = 0
                        self.minutes += 1
                        if self.minutes == 60 {
                            self.win = true
                            // Needs to get the score from th game
                            self.endGame(reset: false)
                        }
                    }
                    self.finalTime = String(format:"%.2d:%.2d", self.minutes, self.seconds)
                }
            })
    }
    
    func pause(){
        countDown = 3
        timer.invalidate()
        self.timerState = .stop
        
    }
    
    func endGame(reset: Bool) {
        
        self.timer.invalidate()
        self.finalTime = String(format:"%.2d:%.2d", minutes, seconds)
        
        if reset {
            
        }
    }
}
