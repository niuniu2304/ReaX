//
//  PlayView.swift
//  ReaX
//
//  Created by Yao on 19/08/2025.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        // Delete NavigationView From HomeView Because navigationViewProperty is already passed down From ReaxApp.
        
            VStack(alignment: .center, spacing: 10) {
                Text("ReaX")
                    .font(.system(size: 80, weight: .bold, design: .default))
                    .padding(.bottom, 150)
                NavigationLink { ScoresView() }
                label: {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.orange, .mint]),
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .frame(height: 90)
                        .frame(maxWidth: .infinity)
                        .shadow(color: .mint.opacity(0.8), radius: 10, x: 0, y: 10)
                        .overlay(alignment: .center){
                            Image(systemName: "list.bullet")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                    
                }
                
                Button {
                    withAnimation(.default){
                        isPlaying = true
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.mint, .pink]),
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .frame(height: 90)
                        .frame(maxWidth: .infinity)
                        .shadow(color: .mint.opacity(0.8), radius: 10, x: 0, y: 10)
                        .overlay(alignment: .center){
                            Image(systemName: "play.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                }
            }
            .navigationBarHidden(true)
    }
}

#Preview {
    NavigationView() {
        HomeView(isPlaying: ReaXApp().$isPlaying)
            .modelContainer(for: Scores.self, inMemory: true)
    }
}

