//
//  GameOverView.swift
//  ReaX
//
//  Created by Yao on 01/09/2025.
//

import SwiftUI
import SwiftData

struct GameOverView: View {
    
    // To get the score of the game
    
    @Binding var isPlaying: Bool
    let gameOverText: String
    
    
    @EnvironmentObject var gridViewModel: GridViewModel
    @EnvironmentObject var timerViewModel: TimerViewModel
    // TO acces the container and the best score and then to Add the score into the container
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Scores.score) private var scores: [Scores]
    
    var body: some View {
        // Delete NavigationView From HomeView Because navigationViewProperty is already passed down From ReaxApp.
        ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(LinearGradient(gradient: Gradient(colors: [.mint, .pink]),
                                         startPoint: .leading,
                                         endPoint: .trailing))
                    .frame(width: 350, height: 600)
                
                VStack{
                    Image(systemName: "\(gridViewModel.currentScore > (scores.isEmpty ? 0: scores[scores.count - 1].score) ? "crown" : "")")
                        .font(.system(size: 100, weight: .bold, design: .default))
                    Text("\(gridViewModel.currentScore)")
                        .font(.system(size: 80, weight: .bold, design: .default))
                        .padding()
                    Text("\(timerViewModel.finalTime)")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.bottom, )
                    Text(gameOverText)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.bottom, 110)
                    
                    HStack {
                        Button {
                            saveResetScore(playing: true)
                            
                        } label: {
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.red.opacity(0.5))
                                .frame(width: 150, height: 70)
                                .overlay {
                                    Image(systemName: "play.fill")
                                }
                        }
                        
                        
                        Button {
                            saveResetScore(playing: false)
                            
                        } label: {
                            
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.blue.opacity(0.5))
                                .frame(width: 150, height: 70)
                                .overlay {
                                    Image(systemName: "house.fill")
                                }
                        }
                    }
                }
            }
        .onAppear(perform: {
            timerViewModel.pause()
            gridViewModel.stop()
        })
            .navigationBarHidden(true)
    }
    func saveResetScore(playing: Bool) {
        let score = Scores(timestamp: Date.now, score: gridViewModel.currentScore, time: timerViewModel.finalTime)
        modelContext.insert(score)
        gridViewModel.reset()
        timerViewModel.reset()
        isPlaying = false
        isPlaying = playing
        // + Update isPlaying global variable + Jump right to HomeView if isPlaying = false
    }
}

#Preview {
    GameOverView(isPlaying: ReaXApp().$isPlaying, gameOverText: "Win")
        .modelContainer(for: Scores.self, inMemory: true)
        .environmentObject(GridViewModel())
        .environmentObject(TimerViewModel())
}
