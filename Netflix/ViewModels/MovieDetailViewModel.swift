//
//  MovieDetailViewModel.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI
import Combine

class MovieDetailViewModel: ObservableObject {
    @Published var selectedSeason: Int = 1
    @Published var showSeasonPicker: Bool = false
    @Published var episodes: [Episode] = []
    @Published var media: Media?

    var isMovie: Bool = true
    private var cancellables = Set<AnyCancellable>()

  init(id: Int, isMovie: Bool) {
        self.isMovie = isMovie
        loadMovieDetails(id)
    }

    // Load movie or TV show details based on the type
  func loadMovieDetails(_ id: Int) {
    fetchMovieDetails(id: id)
  }

    // Fetch movie details from the API
  private func fetchMovieDetails(id: Int) {
      let path = self.isMovie ? "/movie/\(id)" : "/tv/\(id)"
      guard let url = URL(string: Constant.baseUrl + path) else { return }

      NetworkManager.shared.performRequest(url: url) { [weak self] (result: Result<Media, Error>) in
          DispatchQueue.main.async {
              switch result {
              case .success(let movieDetails):
                  self?.media = movieDetails
                  // Now that media is populated, load episodes for the selected season
                  if !self!.isMovie {
                      self?.loadEpisodes(for: self?.selectedSeason ?? 1)
                  }
              case .failure(let error):
                  debugPrint("Error fetching movie details: \(error)")
              }
          }
      }
  }



  var adultRating: String {
    let isAdult = media?.adult
      if isAdult == true {
          return "TV-MA"
      }
      return "TV-PG"
  }

  var creators: String {
      // For movies, get the production companies
    let movieCreators = self.media?.productionCompanies?.compactMap { $0.name } ?? []
      return movieCreators.joined(separator: " • ")
  }


  var genres: String {
        // For movies, get the production companies
    let genreNames = self.media?.genres?.compactMap { $0.name } ?? []
      return genreNames.joined(separator: " • ")
  }

     func loadEpisodes(for season: Int) {
       guard let tvShowId = media?.id else {return}
       guard let url = URL(string: Constant.baseUrl + "/tv/\(tvShowId)/season/\(season)") else { return }

         NetworkManager.shared.performRequest(url: url) { [weak self] (result: Result<Season, Error>) in
             DispatchQueue.main.async {
                 switch result {

                 case .success(let seasonDetails):
                   debugPrint("success")

                   self?.episodes = seasonDetails.episodes!
                 case .failure(let error):
                     debugPrint("Error fetching episodes for season \(season): \(error)")
                 }
             }
         }
     }
}
