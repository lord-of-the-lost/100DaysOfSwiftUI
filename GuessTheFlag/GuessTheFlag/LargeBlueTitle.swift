//
//  LargeBlueTitle.swift
//  GuessTheFlag
//
//  Created by Николай Игнатов on 13.07.2025.
//

import SwiftUI

struct LargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.weight(.bold))
            .foregroundColor(.white)
    }
}

extension View {
    func largeTitle() -> some View {
        self.modifier(LargeTitle())
    }
}
