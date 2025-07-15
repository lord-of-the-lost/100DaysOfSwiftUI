//
//  ContentView.swift
//  MathGame
//
//  Created by Николай Игнатов on 15.07.2025.
//

import SwiftUI

struct ContentView: View {
    enum GameState {
        case settings, playing, finished
    }

    @State private var gameState = GameState.settings
    @State private var maxTable = 5
    @State private var questionCount = 5
    @State private var questions: [Question] = []
    @State private var currentQuestion = 0
    @State private var userAnswer = ""
    @State private var score = 0

    var body: some View {
        VStack {
            switch gameState {
            case .settings:
                SettingsView(maxTable: $maxTable, questionCount: $questionCount) {
                    startGame()
                }
            case .playing:
                GameView(
                    question: questions[currentQuestion],
                    current: currentQuestion + 1,
                    total: questionCount,
                    userAnswer: $userAnswer,
                    submitAction: submitAnswer
                )
            case .finished:
                VStack(spacing: 20) {
                    Text("🎉 Game Over")
                        .font(.largeTitle)
                    Text("Your score: \(score) / \(questionCount)")
                        .font(.title)

                    Button("Play Again") {
                        gameState = .settings
                        score = 0
                        currentQuestion = 0
                        userAnswer = ""
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

private extension ContentView {
    func startGame() {
        questions = (1...questionCount).map { _ in
            Question(left: Int.random(in: 1...maxTable), right: Int.random(in: 1...12))
        }
        currentQuestion = 0
        score = 0
        userAnswer = ""
        gameState = .playing
    }

    func submitAnswer() {
        guard let answer = Int(userAnswer) else { return }

        if answer == questions[currentQuestion].answer {
            score += 1
        }

        userAnswer = ""

        if currentQuestion + 1 < questionCount {
            currentQuestion += 1
        } else {
            gameState = .finished
        }
    }

}

#Preview {
    ContentView()
}
