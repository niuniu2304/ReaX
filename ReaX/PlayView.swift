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
                    // Works because we inserted a default score in the begening using a onAppear (I Have know Idea if it will continue to insert into the conainer or it will just insert a default value for once (I would like that when we lunch the app for the first time, we insert a default value but then we don't insert default values) in contentView
                    Text("\(scores.isEmpty ? 0 :scores[0].score)")
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
            }
            .padding(.top, 50)
        }

    }
}

#Preview {
    PlayView()
        .modelContainer(for: Scores.self, inMemory: true)
}
