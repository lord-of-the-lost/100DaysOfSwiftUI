//
//  GameView.swift
//  MathGame
//
//  Created by Николай Игнатов on 15.07.2025.
//

import SwiftUI

struct GameView: View {
    let question: Question
    let current: Int
    let total: Int
    @Binding var userAnswer: String
    let submitAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Question \(current) of \(total)")
                .font(.headline)

            Text(question.text)
                .font(.largeTitle.bold())

            TextField("Your answer", text: $userAnswer)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200)

            Button("Submit", action: submitAction)
                .font(.title2)
                .padding()
                .background(Color.green.opacity(0.8))
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
    }
}
