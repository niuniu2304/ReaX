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
                    Text("\(scores.isEmpty ? 0: currentScore ?? 0)")
                        .font(.system(size: 40, weight: .bold, design: .default))
                }
                .padding(.trailing, 15)
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
                        .frame(height: 100)
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
                .disabled(gridViewModel.countDown != 0)
                .padding(.top, 50)
            case .stop:
                HStack (alignment: .center){
                    
                    NavigationLink {
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
                        gridViewModel.timerState = .end
                    }

                    
                    Button {
                        gridViewModel.endGame()
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
                        gridViewModel.startGame()
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

            case .end:
                // TODO: Create the gameOver Sheet and from this sheet add the data from the game to the container. Then initialize everything to default (such as life = 3...)
                // Show gameOver Scheet
                
                Text("Game Over")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.red)
            }
        }
    }
}

#Preview {
    PlayView(isPlaying: ContentView().$isPlaying)
        .modelContainer(for: Scores.self, inMemory: true)
}
