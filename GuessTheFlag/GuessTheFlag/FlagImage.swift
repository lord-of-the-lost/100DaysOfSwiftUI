//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Николай Игнатов on 13.07.2025.
//

import SwiftUI

struct FlagImage: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
