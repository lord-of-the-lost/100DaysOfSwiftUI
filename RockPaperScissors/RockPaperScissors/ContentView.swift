//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Николай Игнатов on 13.07.2025.
//

import SwiftUI

struct ContentView: View {
    private let moves = ["Rock", "Paper", "Scissors"]
    private let emojis = ["✊", "✋", "✌️"]
    
    @State private var appMove = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var round = 1
    @State private var showingFinalScore = false
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("Round \(round)/10")
                .font(.title)
            
            Text("App chose: \(emojis[appMove])")
                .font(.system(size: 60))
            
            Text("You must \(shouldWin ? "WIN" : "LOSE")")
                .font(.title2.weight(.semibold))
            
            HStack(spacing: 30) {
                ForEach(0..<3) { move in
                    Button {
                        playerTapped(move)
                    } label: {
                        Text(emojis[move])
                            .font(.system(size: 80))
                    }
                }
            }
            
            Text("Score: \(score)")
                .font(.title.bold())
            
            Spacer()
        }
        .padding()
        .alert("Game Over", isPresented: $showingFinalScore) {
            Button("Play Again", action: resetGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
}

private extension ContentView {
    func playerTapped(_ playerMove: Int) {
        let winningMoves = [
            0: 1, // Rock -> Paper
            1: 2, // Paper -> Scissors
            2: 0  // Scissors -> Rock
        ]
        
        let isCorrect: Bool
        if shouldWin {
            isCorrect = playerMove == winningMoves[appMove]
        } else {
            isCorrect = winningMoves[playerMove] == appMove
        }

        score += isCorrect ? 1 : -1

        if round == 10 {
            showingFinalScore = true
        } else {
            nextRound()
        }
    }

    func nextRound() {
        appMove = Int.random(in: 0..<3)
        shouldWin.toggle()
        round += 1
    }

    func resetGame() {
        score = 0
        round = 1
        appMove = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }
}

#Preview {
    ContentView()
}
