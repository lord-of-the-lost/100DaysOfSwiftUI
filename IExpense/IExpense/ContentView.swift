//
//  ContentView.swift
//  IExpense
//
//  Created by Николай Игнатов on 15.07.2025.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
final class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if
            let savedItems = UserDefaults.standard.data(forKey: "Items"),
            let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
            items = decodedItems
        }
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showAddExpense = false

    var personalItems: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
    }

    var businessItems: [ExpenseItem] {
        expenses.items.filter { $0.type == "Business" }
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(personalItems) { item in
                        ExpenseRow(item: item)
                    }
                    .onDelete { offsets in
                        removeItems(offsets: offsets, in: personalItems)
                    }
                }

                Section("Business") {
                    ForEach(businessItems) { item in
                        ExpenseRow(item: item)
                    }
                    .onDelete { offsets in
                        removeItems(offsets: offsets, in: businessItems)
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add expense", systemImage: "plus") {
                    showAddExpense = true
                }
            }
            .sheet(isPresented: $showAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
}


private extension ContentView {
    func removeItems(offsets: IndexSet, in items: [ExpenseItem]) {
        for offset in offsets {
            if let index = expenses.items.firstIndex(where: { $0.id == items[offset].id }) {
                expenses.items.remove(at: index)
            }
        }
    }
}

#Preview {
    ContentView()
}
