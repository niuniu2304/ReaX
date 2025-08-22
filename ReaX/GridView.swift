//
//  GridView.swift
//  ReaX
//
//  Created by Yao on 10/08/2025.
//

import SwiftUI

struct GridView: View {
    
    // Change random cell to update to green or red so that the user can tap on it and get points
    
    @State var cell: [CellView] = [
        CellView(cellState: .green), CellView(cellState: .normal), CellView(cellState: .black),
        CellView(cellState: .normal),CellView(cellState: .red), CellView(cellState: .green),
        CellView(cellState: .black), CellView(cellState: .green), CellView(cellState: .red),
        
    ]
    var body: some View {
        
        Grid() {
            GridRow {
                ForEach(0..<3, id: \.self) { index in
                    self.cell[index]
                }
            }
            GridRow {
                ForEach(3..<6, id: \.self) { index in
                    self.cell[index]
                }
            }
            GridRow {
                ForEach(6..<9, id: \.self) { index in
                    self.cell[index]
                }
            }
        }
        
    }
}

#Preview {
    GridView()
}
