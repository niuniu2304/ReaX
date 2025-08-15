//
//  ContentView.swift
//  ReaX
//
//  Created by Yao on 02/08/2025.
//

import SwiftUI
import SwiftData

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
        VStack() {
            GridView(gridItemIndex: 0, isClicked: false)
            GridView(gridItemIndex: 0, isClicked: false)
            GridView(gridItemIndex: 0, isClicked: false)
            GridView(gridItemIndex: 0, isClicked: false)
        }
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
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
