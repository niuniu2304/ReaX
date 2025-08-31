//
//  ControlGroup.swift
//  ReaX
//
//  Created by Yao on 31/08/2025.
//

import SwiftUI

struct ControlGroup: View {
    
    @State var isPlaying: Bool = false
    
    var body: some View {
        NavigationView(){
            if isPlaying {
                PlayView(isPlaying: $isPlaying)
            } else {
                HomeView(isPlaying: $isPlaying)
            }
        }
    }
}

#Preview {
    ControlGroup()
        .environmentObject(GridViewModel())
}
