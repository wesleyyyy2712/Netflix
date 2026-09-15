//
//  SearchView.swift
//  Netflix
//
//  Created by Shishir Rijal on 23/10/2024.
//

import SwiftUI
import SDWebImageSwiftUI
struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
      NavigationStack {
        VStack(alignment: .leading) {
              HStack(spacing: 20) {
                  Image(systemName: "magnifyingglass")
                  TextField("Search for a show, movie, genre, etc.", text: $viewModel.searchText)
              }
              .padding(.vertical, 20)
              .padding(.horizontal, 20)
              .background(Color.customGrayDark2)
              .font(.customFont(.light, 18))

              if let errorMessage = viewModel.errorMessage {
                  Text(errorMessage)
                      .font(.body)
                      .foregroundColor(.gray)
                      .padding()
              } else {
                Text(viewModel.searchText == "" ? "Top Searches": "Search Results")
                      .font(.heroHeaderFont)
                      .padding()

                  ScrollView {
                      LazyVStack {
                          ForEach(viewModel.movies) { movie in
                            NavigationLink(destination: MovieDetailView(id: movie.id, isMovie: true)) {
                              TopSearchView(imageUrl: getImageUrl(path: movie.posterPath ?? getPlaceholderImage()), title: movie.getDisplayTitle())
                            }
                          }
                      }
                  }
              }
          }
        .foregroundColor(.primaryFontColor)
          .padding(.top, 1)
          .preferredColorScheme(.dark)
        .ignoresSafeArea(edges: .bottom)
      }
    }
}



#Preview {
    SearchView()
}
