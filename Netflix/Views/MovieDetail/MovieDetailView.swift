//
//  MovieDetailView.swift
//  Netflix
//
//  Created by Shishir Rijal on 27/10/2024.
//

import SwiftUI
import SDWebImageSwiftUI
struct MovieDetailView: View {
    @StateObject private var viewModel: MovieDetailViewModel

    init(id: Int, isMovie: Bool) {
        _viewModel = StateObject(wrappedValue: MovieDetailViewModel(id: id, isMovie: isMovie))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Media detail hero image
                MovieDetailHeroView(url: getImageUrl(path: viewModel.media?.posterPath ?? getPlaceholderImage()))

                // Intro section with title, release date, and rating
                MovieIntroSection(
                  title: viewModel.media?.getDisplayTitle() ?? "Unknown",
                    releaseDate: viewModel.isMovie ? (viewModel.media?.releaseDate ?? "N/A") : (viewModel.media?.firstAirDate ?? "N/A"),
                    rating: viewModel.adultRating,
                    isMovie: viewModel.isMovie,
                    numberOfSeasons: viewModel.isMovie ? 0 : (viewModel.media?.numberOfSeasons ?? 0),
                  runtime: viewModel.media?.runtime,
                    language: viewModel.media?.originalLanguage ?? "Unknown"
                )
                .padding(.horizontal, 10)

                // Action buttons
                ActionButtonsSection()

                // Description section with media overview, cast, and creators
                MovieDescriptionSection(
                    description: viewModel.media?.overview ?? "Description not available.",
                    genres: viewModel.genres,
                    creator: viewModel.creators
                )
                .padding(.horizontal, 10)

                // For TV Shows only
                if !viewModel.isMovie {
                    SeasonSelectionButton(
                        selectedSeason: $viewModel.selectedSeason,
                        showSeasonPicker: $viewModel.showSeasonPicker
                    )
                    .padding(.horizontal, 10)

                  EpisodeList(episodes: viewModel.episodes)


                }
            }
        }
        .overlay(
            SeasonPickerOverlay(
                showSeasonPicker: $viewModel.showSeasonPicker,
                selectedSeason: $viewModel.selectedSeason,
                seasonCount: viewModel.isMovie ? 0 : (viewModel.media?.numberOfSeasons ?? 0)
            )
        )
        .onChange(of: viewModel.selectedSeason) { newSeason in
            viewModel.loadEpisodes(for: newSeason)
        }
        .navigationBarHidden(true)
    }
  
}



// MARK: - Episode List for a Season
struct EpisodeList: View {
//    let season: Season
  let episodes: [Episode]

    var body: some View {
        VStack(alignment: .leading) {
          ForEach(episodes , id: \.id) { episode in
            CustomEpisodeView(episode: episode)
              .padding(.bottom, 20)
            }
        }
    }
}



//#Preview {
//    MovieDetailView(id: 1034541, isMovie: true)
//        .preferredColorScheme(.dark)
//}


#Preview {
  MovieDetailView(id: 237243, isMovie: false)
    .preferredColorScheme(.dark)
}
