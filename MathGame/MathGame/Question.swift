//
//  Question.swift
//  MathGame
//
//  Created by Николай Игнатов on 15.07.2025.
//

struct Question {
    let left: Int
    let right: Int
    var text: String { "\(left) × \(right)" }
    var answer: Int { left * right }
}
