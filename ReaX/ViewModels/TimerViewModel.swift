//
//  TimerViewModel.swift
//  ReaX
//
//  Created by Yao on 31/08/2025.
//

import Foundation

class TimerViewModel: ObservableObject {
    enum timerState {
        case start
        case stop
    }
    
    private var timer                     = Timer()
    private var minutes                   = 0
    private var seconds                   = 0
    @Published var countDown: Int         = 3
    @Published var finalTime: String      = ""
    @Published var timerState: timerState = .start
    
    @Published var win: Bool = false
    
    
    
    func startTimer() {
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
    }
    
    func reset() {
        minutes = 0
        seconds = 0
        countDown = 3
        finalTime = ""
        self.timerState = .start
        win = false
    }
}
