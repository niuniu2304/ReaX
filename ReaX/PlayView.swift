//
//  PlayView.swift
//  ReaX
//
//  Created by Yao on 21/08/2025.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        VStack(spacing: 50){
            // On left corner add the overal best score and on the right corner add a button (tab button like a system icon) to go to the  scoresView
            Text("ReaX")
                .font(.system(size: 50, weight: .bold, design: .default))
                .padding(.bottom, 10)
            
            // GridView
            VStack{
                HStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.red)
                        .frame(width: 120, height: 120)
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray)
                        .frame(width: 120, height: 120)
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray)
                        .frame(width: 120, height: 120)
                }
                HStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray)
                        .frame(width: 120, height: 120)
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.green)
                        .frame(width: 120, height: 120)
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray)
                        .frame(width: 120, height: 120)
                }
                HStack{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.gray)
                        .frame(width: 120, height: 120)
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.red)
                        .frame(width: 120, height: 120)
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.green)
                        .frame(width: 120, height: 120)
                }
            }
            
            Button {
                print("i")
            } label: {
                Circle()
                    .fill(Color.mint)
                    .frame(width: 150, height: 100)
                    .overlay {
                        Image(systemName: "pause")
                            .frame(width: 80, height: 80)
                    }
            }
        }

    }
}

#Preview {
    PlayView()
}
