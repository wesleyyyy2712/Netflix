//
//  HeroSection.swift
//  Netflix
//
//  Created by Shishir Rijal on 05/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct HeroSection: View {
  let movie: Media

    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geometry in
              VStack {
                WebImage(url: getImageUrl(path: movie.posterPath ?? getPlaceholderImage()))
                      .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: geometry.size.width, height: geometry.size.height * 1)
                      .overlay(
                          LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0.2), Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
                    )
                      .offset(y: -70)
              }
            }

            VStack {
                Spacer()

                // Movie Name and Tags
              Text(movie.getDisplayTitle())
                    .font(.heroHeaderFont)
                    .foregroundColor(.customWhite)
                    .lineLimit(2)
                    .padding(.bottom, 3)

//                Text("Sci-Fi • Adventure • Fantasy")
//                    .font(.customFont(.light, 16))
//                    .padding(.bottom, 30)
                    .foregroundColor(.customWhite)

              Text("Trending Now")
                  .font(.customFont(.light, 16))
                  .padding(.bottom, 30)
                  .foregroundColor(.customWhite)

                HomeViewButtons()
            }
            .padding(.top, 30)
            .frame(width: .infinity, height: UIScreen.main.bounds.height * 0.6)
        }
    }
}
#Preview {
    HeroSection(movie: dummyMovie)
}
