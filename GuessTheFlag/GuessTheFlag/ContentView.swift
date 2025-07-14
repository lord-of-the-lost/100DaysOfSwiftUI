//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Николай Игнатов on 13.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Monaco", "Italy", "Nigeria", "Poland", "Spain", "UK", "Russia", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    @State private var questionsAsked = 0
    @State private var showingFinalScore = false
    @State private var selectedFlag: Int? = nil

    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ],
                center: .top,
                startRadius: 100,
                endRadius: 700
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess the flag")
                    .largeTitle()

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            withAnimation {
                                selectedFlag = number
                            }
                            flagTapped(number)
                        } label: {
                            FlagImage(imageName: countries[number])
                                .rotation3DEffect(
                                    .degrees(selectedFlag == number ? 360 : 0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .opacity(selectedFlag == nil || selectedFlag == number ? 1 : 0.25)
                                .scaleEffect(selectedFlag == nil || selectedFlag == number ? 1 : 0.75)
                                .animation(.easeInOut(duration: 0.5), value: selectedFlag)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.weight(.bold))

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: nextQuestion)
        } message: {
            Text(scoreMessage)
        }
        .alert("Game Over", isPresented: $showingFinalScore) {
            Button("Play Again", action: resetGame)
        } message: {
            Text("Your final score is \(score) out of 8")
        }
    }
}


private extension ContentView {
    func flagTapped(_ number: Int) {
        questionsAsked += 1

        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            scoreMessage = "Nice! Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            let chosenCountry = countries[number]
            scoreMessage = "Wrong! That’s the flag of \(chosenCountry).\nYour score is \(score)"
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            showingScore = true
        }
    }

    func nextQuestion() {
        if questionsAsked == 8 {
            showingFinalScore = true
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            selectedFlag = nil
        }
    }

    func resetGame() {
        score = 0
        questionsAsked = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedFlag = nil
    }
}

#Preview {
    ContentView()
}
