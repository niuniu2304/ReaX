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
        
    }
}

#Preview {
    PlayView(isPlaying: ReaXApp().$isPlaying)
        .environmentObject(GridViewModel())
        .environmentObject(TimerViewModel())
}
