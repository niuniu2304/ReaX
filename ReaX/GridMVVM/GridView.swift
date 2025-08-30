//
//  GridView.swift
//  ReaX
//
//  Created by Yao on 10/08/2025.
//

import SwiftUI

struct GridView: View {
    
    // Change random cell to update to green or red so that the user can tap on it and get points
    @ObservedObject var gridViewModel: GridViewModel
    
    var body: some View {
        
        Grid() {
            GridRow {
                ForEach(0..<3, id: \.self) { index in
                    CellView(cellModel: self.gridViewModel.grid[index], gridViewModel: gridViewModel)
                }
            }
            GridRow {
                ForEach(3..<6, id: \.self) { index in
                    CellView(cellModel: self.gridViewModel.grid[index], gridViewModel: gridViewModel)
                }
            }
            GridRow {
                ForEach(6..<9, id: \.self) { index in
                    CellView(cellModel: self.gridViewModel.grid[index], gridViewModel: gridViewModel)
                }
            }
        }
        .onAppear(){
            gridViewModel.startGame()
        }
        .onDisappear {
            gridViewModel.endGame(score: 0)
        }
        
    }
}

#Preview {
    PlayView(isPlaying: ContentView().$isPlaying)
}
