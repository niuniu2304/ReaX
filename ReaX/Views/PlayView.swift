//
//  PlayView.swift
//  ReaX
//
//  Created by Yao on 21/08/2025.
//

import SwiftUI
import SwiftData

struct PlayView: View {
    
    @EnvironmentObject var gridViewModel: GridViewModel
    @EnvironmentObject var timerViewModel: TimerViewModel
    @Query(sort: \Scores.score) private var scores: [Scores]
    
    var body: some View {
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
                    Text("\(scores.isEmpty ? 0: gridViewModel.currentScore)")
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
                } label: {
                    Circle()
                        .fill(Color.mint)
                        .frame(height: 100)
                        .overlay {
                            if timerViewModel.countDown != 0 {
                                Text("\(timerViewModel.countDown)")
                                    .frame(width: 100, height: 100)
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
                    
                    // Needs to make the VIew NavigationView
                    NavigationLink {
                        // TODO: Create the gameOver Sheet and from this sheet add the data from the game to the container. Then initialize everything to default (such as life = 3...)
                        // Show gameOver Scheet
                        ScoresView()
                    } label: {
                        Circle()
                            .fill(Color.yellow)
                            .frame(height: 100)
                            .overlay {
                                Image(systemName: "house")
                                    .frame(width: 100, height: 100)
                            }
                    }
                    .onTapGesture {
                        timerViewModel.endGame(reset: false)
                    }

                    
                    Button {
                        timerViewModel.startTimer()
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
    }
}

#Preview {
    PlayView()
        .modelContainer(for: Scores.self, inMemory: true)
        .environmentObject(GridViewModel())
        .environmentObject(TimerViewModel())
}
