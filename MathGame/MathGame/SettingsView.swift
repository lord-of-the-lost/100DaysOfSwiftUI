//
//  SettingsView.swift
//  MathGame
//
//  Created by Николай Игнатов on 15.07.2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var maxTable: Int
    @Binding var questionCount: Int
    var startAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Stepper("Up to table: \(maxTable)", value: $maxTable, in: 2...12)

            Picker("Number of Questions", selection: $questionCount) {
                ForEach([5, 10, 20], id: \.self) {
                    Text("\($0) questions")
                }
            }
            .pickerStyle(.segmented)

            Button("Start Game", action: startAction)
                .font(.title2)
                .padding()
                .background(Color.blue.opacity(0.8))
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
        .padding()
    }
}
