//
//  GridView.swift
//  ReaX
//
//  Created by Yao on 10/08/2025.
//

import SwiftUI

struct GridView: View {
    
    // Change random cell to update to green or red so that the user can tap on it and get points
    @EnvironmentObject var gridViewModel: GridViewModel
    @EnvironmentObject var timerViewModel: TimerViewModel
    
    var body: some View {
        
        // Maybe make a nested for loops (for i [...]: for j [...] and instead of accessing the grid by a 1D array, use a 2D array (grid[i][j] to access each cells seperatly grid[[1,2,3], [1,2,3], [1,2,3]]
        
        // for i each(grid[]): {
        // grid {
        //      for j each(grid[i][]:
        //          grid[i][j]
        //      }
        // }
        //}
        Grid() {
            GridRow {
                ForEach(0..<3, id: \.self) { index in
                    CellView(cellNumber: index)
                }
            }
            GridRow {
                ForEach(3..<6, id: \.self) { index in
                    CellView(cellNumber: index)
                }
            }
            GridRow {
                ForEach(6..<9, id: \.self) { index in
                    CellView(cellNumber: index)
                }
            }
        }
        .onAppear(){
            timerViewModel.startTimer()
            gridViewModel.changeRandomCells()
        }
        .onDisappear() {
            timerViewModel.pause()
            gridViewModel.stop()
        }
        
    }
}

#Preview {
    PlayView(isPlaying: ReaXApp().$isPlaying)
        .environmentObject(GridViewModel())
        .environmentObject(TimerViewModel())
}
