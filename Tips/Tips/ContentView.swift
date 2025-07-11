//
//  ContentView.swift
//  Tips
//
//  Created by Николай Игнатов on 11.07.2025.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    private let peoplePickerOffset = 2
    private let maxPeopleCount = 100
    private let minTipPercent = 0
    private let maxTipPercent = 100
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(peoplePickerOffset..<maxPeopleCount, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much do you want to tip") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(minTipPercent...maxTipPercent, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Total amount for the check") {
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

// MARK: - Private
private extension ContentView {
    var tipValue: Double  {
        checkAmount / 100 * Double(tipPercentage)
    }
    
    var grandTotal: Double {
        checkAmount + tipValue
    }
    
    var totalPerPerson: Double {
        grandTotal / Double(numberOfPeople)
    }
}

#Preview {
    ContentView()
}
