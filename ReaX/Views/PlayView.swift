//
//  PlayView.swift
//  ReaX
//
//  Created by Yao on 21/08/2025.
//

import SwiftUI
import SwiftData

struct PlayView: View {
    
    @Binding var isPlaying: Bool
    
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var gridViewModel: GridViewModel
    @EnvironmentObject var timerViewModel: TimerViewModel
    @Query(sort: \Scores.score) private var scores: [Scores]
    
    var body: some View {
        if !gridViewModel.gameOver || !timerViewModel.win {
            VStack(){
                HStack {
                    VStack(){
                        Text("Top Score:")
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .padding(.leading,10)
                        Text("\(scores.isEmpty ? 0:scores[0].score)")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                    HStack {
                        ForEach(0..<gridViewModel.life, id: \.self) { life in
                            Image(systemName: "heart.fill")
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundStyle(Color.red)
                        }
                    }
                    .padding(.trailing, 20)
                    
                    Spacer()
                    
                    VStack {
                        Text("Score:  ")
                            .font(.system(size: 20, weight: .bold, design: .default))
                        Text("\(gridViewModel.currentScore)")
                            .font(.system(size: 40, weight: .bold, design: .default))
                    }
                    .padding(.trailing, 15)
                }
                .padding()
                
                VStack {
                    Text(timerViewModel.finalTime == "" ? "00:00" : timerViewModel.finalTime)
                        .font(.system(size: 70, weight: .bold, design: .default))
                }
                
                GridView()
                
                
                switch timerViewModel.timerState {
                case .start:
                    Button {
                        timerViewModel.pause()
                        gridViewModel.stop()
                    } label: {
                        Circle()
                            .fill(Color.mint)
                            .frame(height: 100)
                            .overlay {
                                if timerViewModel.countDown != 0 {
                                    Text("\(timerViewModel.countDown)")
                                        .frame(width: 100, height: 100)
                                        .foregroundStyle(Color.red)
                                }
                                else {
                                    Image(systemName: "pause")
                                        .frame(width: 100, height: 100)
                                }
                            }
                    }
                    .disabled(timerViewModel.countDown != 0)
                    .padding(.top, 50)
                case .stop:
                    HStack (alignment: .center){
                        
                        Button {
                            gridViewModel.gameOver = true
                            isPlaying = false
                        } label: {
                            Circle()
                                .fill(Color.yellow)
                                .frame(height: 100)
                                .overlay {
                                    Image(systemName: "house")
                                        .frame(width: 100, height: 100)
                                }
                        }
                        
                        Button {
                            timerViewModel.startTimer()
                            gridViewModel.changeRandomCells()
                        } label: {
                            Circle()
                                .fill(Color.red)
                                .frame(height: 100)
                                .overlay {
                                    Image(systemName: "play")
                                        .frame(width: 100, height: 100)
                                }
                        }
                    }
                    .padding(.top, 50)
                    
                }
            }
        } else if gridViewModel.gameOver {
            GameOverView(isPlaying: $isPlaying, gameOverText: "GameOver: You lose!")
        } else {
            GameOverView(isPlaying: $isPlaying, gameOverText: "Congradulation you win!!")
        }
    }
}

#Preview {
    PlayView(isPlaying: ReaXApp().$isPlaying)
        .modelContainer(for: Scores.self, inMemory: true)
        .environmentObject(GridViewModel())
        .environmentObject(TimerViewModel())
}
