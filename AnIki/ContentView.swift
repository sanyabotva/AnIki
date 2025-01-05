//
//  ContentView.swift
//  AnIki
//
//  Created by Timur Baiazitov on 30.12.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Deck]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Deck name \(item.name)")
                    } label: {
                        HStack {
                            Text(item.name)
                            Text("\(item.isDefault ? "Default" : "")")
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            do {
                try modelContext.transaction {
                    let fetchDescriptor = FetchDescriptor<Deck>(predicate: #Predicate<Deck> { deck in
                        deck.isDefault == true
                    })
                    let decks = try modelContext.fetch(fetchDescriptor)
                    for deck in decks {
                        deck.isDefault = false
                    }
                    let newDeck = Deck(name: "Deck_Name", isDefault: true, createdAt: Date(), updatedAt: Date(), feedSize: 50, cards: [])
                    modelContext.insert(newDeck)
                    try modelContext.save()
                }
            } catch {
                // fatalError to be added
            }

        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
