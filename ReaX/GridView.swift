//
//  GridView.swift
//  ReaX
//
//  Created by Yao on 10/08/2025.
//

import SwiftUI

struct GridView: View {
    @State var gridItemIndex: Int
    @State var isClicked: Bool
    var body: some View {
         Text("\(gridItemIndex)")
    }
}

#Preview {
    GridView(gridItemIndex: 9, isClicked: false)
}
