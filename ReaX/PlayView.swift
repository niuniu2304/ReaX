//
//  PlayView.swift
//  ReaX
//
//  Created by Yao on 21/08/2025.
//

import SwiftUI
import SwiftData

struct PlayView: View {
    
    @State var actionButton: Bool = false
    @State private var currentScore: Int = 0
    @Query(sort: \Scores.score) private var scores: [Scores]
    
    var body: some View {
        VStack(){
            
            
            HStack {
                VStack(){
                    Text("Top Score:")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding(.leading,10)
//                    Text("\(scores[0].score)")
                    Text("9304")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .padding(.leading, 10)
                }
                
                Spacer()
                
                VStack {
                    Text("Score:  ")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.trailing, 10)
                    Text("\(currentScore)")
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .padding(.trailing, 10)
                }
            }
            .padding()
            
            VStack {
                Text("00:00")
                .font(.system(size: 70, weight: .bold, design: .default))
            }
            
            GridView()
            
            Button {
                actionButton.toggle()
            } label: {
                Circle()
                    .fill(actionButton ? Color.mint: Color.red)
                    .frame(width: 150, height: 100)
                    .overlay {
                        Image(systemName: actionButton ? "play" : "pause")
                            .frame(width: 100, height: 100)
                    }
                    .padding(.top, 50)
            }
        }

    }
}

#Preview {
    PlayView()
}
