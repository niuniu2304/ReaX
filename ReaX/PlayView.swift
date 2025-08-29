//
//  PlayView.swift
//  ReaX
//
//  Created by Yao on 21/08/2025.
//

import SwiftUI
import SwiftData

struct PlayView: View {
    
    @StateObject var gridViewModel: GridViewModel = GridViewModel()
    
    @AppStorage("score") var currentScore: Int?
    @State var actionButton: Bool = false
    @Binding var isPlaying: Bool
    @Query(sort: \Scores.score) private var scores: [Scores]
    
    var body: some View {
        VStack(){
            
            // When the view changes ( the user get's or lose points from the game) change the currentScore to gridViewModel.score
            
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
                
                VStack {
                    Text("Score:  ")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.trailing, 10)
                    Text("\(scores.isEmpty ? 0: currentScore ?? 0)")
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .padding(.trailing, 10)
                }
            }
            .padding()
            
            VStack {
                Text(gridViewModel.finalTime == "" ? "00:00" : gridViewModel.finalTime)
                    .font(.system(size: 70, weight: .bold, design: .default))
            }
            
            GridView(gridViewModel: gridViewModel)
            
            
            switch gridViewModel.timerState {
            case .start:
                Button {
                    gridViewModel.pause()
                } label: {
                    Circle()
                        .fill(Color.mint)
                        .frame(width: 150, height: 100)
                        .overlay {
                            if gridViewModel.countDown != 0 {
                                Text("\(gridViewModel.countDown)")
                                    .frame(width: 100, height: 100)
                            }
                            else {
                                Image(systemName: "pause")
                                    .frame(width: 100, height: 100)
                            }
                        }
                }
                .disabled(gridViewModel.countDown != 3 && gridViewModel.countDown != 0)
                .padding(.top, 50)
            case .stop:
                Button {
                    gridViewModel.startGame()
                    
                } label: {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 150, height: 100)
                        .overlay {
                            Image(systemName: "play")
                                .frame(width: 100, height: 100)
                        }
                }
                .padding(.top, 50)
            case .end:
                // Show gameOver Scheet
                ScoresView()
            }
        }
        
    }
}

#Preview {
    PlayView(isPlaying: ContentView().$isPlaying)
        .modelContainer(for: Scores.self, inMemory: true)
}
