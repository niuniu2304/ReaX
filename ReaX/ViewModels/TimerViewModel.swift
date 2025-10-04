//
//  TimerViewModel.swift
//  ReaX
//
//  Created by Yao on 31/08/2025.
//

import Foundation

class TimerViewModel: ObservableObject {
    
    
    //MARK: TODO's
    // Also create different timer and levels: 1min, 3min, 5min 10min, 15min, 20min, 25min And 30min -> Each level corresponding to a different level and it gives you more or less points.
    // Also create different levels of difficulties where the randomTImeIntervall between each cellstate changes and the timeIntervall between each change is different.
    
    // Add functionnalities that every 10seconds (or any arbitrary number of seconds that needs to be set) we update the score by removing some number of points to keep the user playing (aiming to earn points and therefor aiming to get a better score.
    
    // Instead of making the variables Public -> Make them private to the function and only access the values based on function calls from the View.
//    private var duration: TimeInterval = 3600
//    private var startDate: DateInterval = DateInterval(start: Date(), duration: 3600)
    
    // And for each seconds in stop state update the duration to keep track of the timer
//    if timerState == .stop {
//        duration += 1
//    }
    
    // Also make the timer Using Date() CurrentDate - StartDate = TimePassed.
    
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
            } else {
                self.seconds += 1
                if self.seconds == 60 {
                    self.seconds = 0
                    self.minutes += 1
                    if self.minutes == 60 {
                        self.win = true
                        // Needs to get the score from th game
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
    
    
    func reset() {
        pause()
        minutes = 0
        seconds = 0
        finalTime = ""
        self.timerState = .start
        win = false
    }
}
