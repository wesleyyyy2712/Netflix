//
//  MoviesAndShowsView.swift
//  Netflix
//
//  Created by Shishir Rijal on 05/11/2024.
//

import SwiftUI


struct MoviesAndShowsView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack(alignment: .leading) {
            if !viewModel.continueWatching.isEmpty {
                CategoryView(
                    title: "Continue Watching",
                    movies: viewModel.continueWatching,
                    isWatching: true
                )
            }

            CategoryView(
                title: "Netflix Originals",
                movies: viewModel.netflixOriginals
            )

            CategoryView(
                title: "Popular on Netflix",
                movies: viewModel.popularMovies
            )

            CategoryView(
                title: "Trending Now",
                movies: viewModel.trendingMovies
            )

            CategoryView(
                title: "Top Rated",
                movies: viewModel.topRatedMovies
            )

            // TV Shows
          Text("TV Shows")
            .font(.titleFont)

            ScrollView(.horizontal, showsIndicators: false) {
              HStack(spacing: 10) {
                ForEach(viewModel.tvShows) { movie in
                  NavigationLink(destination: MovieDetailView(id: movie.id, isMovie: false)) {
                    MoviePreviewView(url: getImageUrl(path: movie.posterPath ?? getPlaceholderImage()), isWatching: false)
                  }
                  .navigationBarHidden(true)

                }
              }
            }
            .padding(.bottom, 20)

        }
    }
}

