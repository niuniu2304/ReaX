//
//  CellViewModel.swift
//  ReaX
//
//  Created by Yao on 19/08/2025.
//

import Foundation

class GridViewModel: ObservableObject {
    
    
    //MARK: TODO's
    // Also create different timer and levels: 1min, 3min, 5min 10min, 15min, 20min, 25min And 30min -> Each level corresponding to a different level and it gives you more or less points.
    // Also create different levels of difficulties where the randomTImeIntervall between each cellstate changes and the timeIntervall between each change is different.
    
    // Add functionnalities that every 10seconds (or any arbitrary number of seconds that needs to be set) we update the score by removing some number of points to keep the user playing (aiming to earn points and therefor aiming to get a better score.
    
    // Instead of making the variables Public -> Make them private to the function and only access the values based on function calls from the View.
    // Make the point checking in the viewModel instead of the View
    
    @Published var life: Int = 3
    @Published var currentScore: Int = 0
    @Published var gameOver: Bool = false
    @Published var countDown: Int = 3
    
    private var timer: Timer = Timer()
    
    
    @Published var grid: [CellModel] = [
        CellModel(), CellModel(), CellModel(),
        CellModel(), CellModel(), CellModel(),
        CellModel(), CellModel(), CellModel(),
    ]
    
    // Alternative: grid[ [CellModel(), CellModel(), CellModel(),], [CellModel(), CellModel(), CellModel(),], [CellModel(), CellModel(), CellModel(),] ]
    
    
    
    func changeRandomCells() {
        // Need to add a random time intervall between each changes.
        
        let randomStates: [CellModel.cellStates] = [.green, .red, .black]
        var randomTimes: [Double] = [Double.random(in: 0.5..<1.5), Double.random(in: 0.5..<2)]
        
        self.timer = Timer.scheduledTimer(withTimeInterval: randomTimes[1], repeats: true, block: { [self] Timer in
            if countDown != 0 {
                countDown -= 1
            } else {
                let randomCells: [Int] = [Int.random(in: 0..<9), Int.random(in: 0..<9),]
                let randomState: [CellModel.cellStates] = [randomStates.randomElement() ?? .normal, randomStates.randomElement() ?? .normal,]
                randomTimes = [Double.random(in: 0.2..<1), Double.random(in: 0.2..<1.5)]
                let randomBool: Bool = Bool.random()
                
                if randomBool {
                    self.grid[randomCells[0]].cellState = randomState[0]
                    self.grid[randomCells[1]].cellState = randomState[1]
                    DispatchQueue.main.asyncAfter(deadline: .now() + randomTimes[0]){
                        self.grid[randomCells[0]].cellState = .normal
                        self.grid[randomCells[1]].cellState = .normal
                    }
                } else {
                    self.grid[randomCells[0]].cellState = randomState[0]
                    DispatchQueue.main.asyncAfter(deadline: .now() + randomTimes[0]){
                        self.grid[randomCells[0]].cellState = .normal
                    }
                }
            }
        })
        // Change 1 or 2 random Cells 'color' in the grid for a random periode of timer between 0.2 to 1 seconds it lasts then
        // Like grid[arbitrary number variable ].backgroundCOlor == (arbitrary color between red and green and black(-2 lives and more rare if possible)
        // Then AsyncAfter... (arbitraryTime):
        // grid[aribitrary number variable].backgroundCOlor = .normal
        
    }
    
    func checkLose() {
        if life <= 0 {
            gameOver = true
        }
    }
    
    
    func stop() {
        countDown = 3
        self.timer.invalidate()
    }
    
    func reset() {
        stop()
        life = 3
        currentScore = 0
        gameOver = false
    }
}
