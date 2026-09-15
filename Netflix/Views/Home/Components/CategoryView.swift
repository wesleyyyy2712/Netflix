//
//  CategoryView.swift
//  Netflix
//
//  Created by Shishir Rijal on 05/11/2024.
//

import SwiftUI


// MARK: - Category View
struct CategoryView: View {
  let title: String
  let movies: [Media]
  var isWatching: Bool = false


  var body: some View {

    VStack(alignment: .leading) {
      Text(title)
        .font(.titleFont)

          ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 10) {
            ForEach((movies).shuffled()) { movie in
              NavigationLink(destination: MovieDetailView(id: movie.id, isMovie: true)) {
                MoviePreviewView(url: getImageUrl(path: movie.posterPath ?? getPlaceholderImage()), isWatching: false)
              }
            }
          }
        }

    }
    .padding(.bottom, 20)
  }

}
