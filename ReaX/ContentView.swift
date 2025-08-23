//
//  ContentView.swift
//  ReaX
//
//  Created by Yao on 02/08/2025.
//

import SwiftUI
import SwiftData

/*
 TODO: Finish the GridView
 TODO: Finish the contentView with the best score, a timer, a play button(to start the game), the grid, and maybe a pause button on the bottom
 TODO: Make the logic for the contentView to work(start/stop button, play button).
 TODO: make grid view using a lazyVGrid(or something like that)
 TODO: add a button to go to the scoresView to view all the scores
 TODO: Finish the scoresView by adding a List(View) of all the previous scores and the best score on the top along side with when it was realised
 TODO:
 */

struct ContentView: View {
    @State private var score: Int = 0
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
        
//        GridView(cell: 0)
        
        // Make a overlay or a button to a score view
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), score: 0)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    private func checkIfLose() -> Bool{
        return false
    }
    private func timer() {
        
    }
    private func updateGrid() {
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
