//
//  MovieIntroSection.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI

struct MovieIntroSection: View {
  let title: String
  let releaseDate: String
  let rating: String
  let isMovie: Bool
  let numberOfSeasons: Int?
  let runtime: Int?
  let language: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Image("LetterLogo")
                    .resizable()
                    .frame(width: 8, height: 15)
                Text("SERIES")
                    .tracking(4)
                    .font(.bodyFont)
            }
          HStack {
            Text(title)
              .font(.customFont(.medium, 20))

            Text(language ?? "")
              .padding(.horizontal, 5)
                  .background(Color.grayLight1)
          }

            HStack {
              Text(String(releaseDate))
              Text(rating)
                .padding(.horizontal, 5)
                .padding(.vertical, 3)
                    .background(Color.grayLight1)
              
              // Show number of seasons only if it's a TV show
              if !isMovie {
                Text("\(String(describing: numberOfSeasons!)) Seasons")
              }
              else {
                Text(runtime?.toHoursAndMinutes() ?? "")
              }

            }
            .font(.bodyFont)
            .fontWeight(.medium)
            .foregroundColor(.primaryFontColor)
        }

    }
}
