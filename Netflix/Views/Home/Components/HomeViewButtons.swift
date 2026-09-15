//
//  HomeViewButtons.swift
//  Netflix
//
//  Created by Shishir Rijal on 05/11/2024.
//

import SwiftUI

struct HomeViewButtons: View {
    private func iconButton(image: String, text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack {
                Image(systemName: image)
                    .font(.title2)
                Spacer().frame(height: 2)
                Text(text)
                    .font(.bodyFont)
            }
            .foregroundColor(.white)
        }
    }

    var body: some View {
        HStack {
            iconButton(image: "plus", text: "My List", action: {
                // Action here
            })

            Spacer()

            CustomButton(title: "Play", image: "play.fill") {
              debugPrint("Play button tapped")
            }

            Spacer()

            iconButton(image: "info.circle", text: "Info", action: {
                // Add your action here
            })
        }
        .frame(width: UIScreen.main.bounds.width * 0.7)
    }
}


#Preview {
    HomeViewButtons()
    .preferredColorScheme(.dark)
}
