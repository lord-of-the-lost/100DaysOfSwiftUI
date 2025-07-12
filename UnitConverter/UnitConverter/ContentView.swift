//
//  ContentView.swift
//  UnitConverter
//
//  Created by Николай Игнатов on 12.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var inputUnit: UnitLength = .meters
    @State private var outputUnit: UnitLength = .feet

    private let units: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]

    var body: some View {
        NavigationView {
            Form {
                Section("Enter value") {
                    TextField("Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }

                Section("From unit") {
                    Picker("From", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                        }
                    }.pickerStyle(.segmented)
                }

                Section("To unit") {
                    Picker("To", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0.symbol)
                        }
                    }.pickerStyle(.segmented)
                }

                Section("Converted") {
                    Text(convertedValue, format: .number.precision(.fractionLength(2)))
                }
            }
            .navigationTitle("Length Converter")
        }
    }
}

// MARK: - Private
private extension ContentView {
    var convertedValue: Double {
        let inputMeasurement = Measurement(value: inputValue, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return outputMeasurement.value
    }
}

#Preview {
    ContentView()
}
