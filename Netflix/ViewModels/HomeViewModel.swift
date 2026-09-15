//
//  HomeViewModel.swift
//  Netflix
//
//  Created by Shishir Rijal on 04/11/2024.
//
import SwiftUI
import Combine


// MARK: - Network Extension
extension NetworkManager {
    enum MovieEndpoint {
        case trending
        case popular
        case topRated
        case netflixOriginals
        case upcoming

        var url: URL? {
            switch self {
            case .trending:
              return URL(string: Constant.trending)
            case .popular:
                return URL(string: Constant.popular)
            case .topRated:
                return URL(string: Constant.topRated)
            case .netflixOriginals:
                return URL(string: Constant.netflixOriginal)
            case .upcoming:
                return URL(string: Constant.upcoming)
            }
        }
    }

  enum TVShowEndpoint {
          case airingToday
          case onAir
          case popular
          case topRated

          var url: URL? {
              switch self {
              case .airingToday:
                return URL(string: Constant.airingToday)
              case .onAir:
                return URL(string: Constant.onAir)
              case .popular:
                return URL(string: Constant.popularTv)
              case .topRated:
                return URL(string: Constant.topRatedTv)
              }
          }
      }


  
  func fetchMovies(from endpoint: MovieEndpoint, isMovie: Bool = true) async throws -> [Media] {

      guard let url = endpoint.url else {
          debugPrint("url error")
          throw NetworkError.badUrlResponse
      }

      return try await withCheckedThrowingContinuation { continuation in
          performRequest(url: url) { (result: Result<MediaResponse, Error>) in
              switch result {
              case .success(let response):
                  debugPrint("success")
                  continuation.resume(returning: response.results)
              case .failure(let error):
                  debugPrint("failure: \(error)")
                  continuation.resume(throwing: error)
              }
          }
      }
  }



  func fetchTVShows(from endpoint: TVShowEndpoint) async throws -> [Media] {
    guard let url = endpoint.url else {
      debugPrint("url error")
      throw NetworkError.badUrlResponse
    }

    return try await withCheckedThrowingContinuation { continuation in
      performRequest(url: url) { (result: Result<MediaResponse, Error>) in
        switch result {
        case .success(let response):
          debugPrint("success")
          continuation.resume(returning: response.results)
        case .failure(let error):
          debugPrint("failure: \(error)")
          continuation.resume(throwing: error)
        }
      }
    }
  }




}

// MARK: - ViewModel
@MainActor
class HomeViewModel: ObservableObject {
    @Published var trendingMovies: [Media] = []
    @Published var popularMovies: [Media] = []
    @Published var netflixOriginals: [Media] = []
    @Published var topRatedMovies: [Media] = []
    @Published var featuredMovie: Media?

    @Published var tvShows: [Media] = []

    @Published var isLoading = false
    @Published var error: Error?
    @Published var showError = false

    // Continue watching will typically come from local storage/user data
    @Published var continueWatching: [Media] = []

    init() {
        Task {
            await fetchAllContent()
            await fetchAllTVShows()
        }
    }

    func fetchAllContent() async {
        isLoading = true
        error = nil

      async let trending: () = fetchTrending()
      async let popular: () = fetchPopular()
      async let originals: () = fetchNetflixOriginals()
      async let topRated: () = fetchTopRated()

        // Wait for all fetches to complete
      try await (trending, popular, originals, topRated)

        isLoading = false
    }

  func fetchAllTVShows() async {
          isLoading = true
          error = nil
    
          async let popular: () = fetchPopularTvShows()

          // Wait for all fetches to complete
          try await (popular)

          isLoading = false
      }

  private func fetchPopularTvShows() async {
          do {
            tvShows = try await NetworkManager.shared.fetchTVShows(from: .popular)
          } catch {
              handleError(error)
          }
      }


    private func fetchTrending() async {
        do {
            trendingMovies = try await NetworkManager.shared.fetchMovies(from: .trending)
            if featuredMovie == nil {
                featuredMovie = trendingMovies.randomElement()
            }
        } catch {
            handleError(error)
        }
    }

    private func fetchPopular() async {
        do {
            popularMovies = try await NetworkManager.shared.fetchMovies(from: .popular)
        } catch {
            handleError(error)
        }
    }

    private func fetchNetflixOriginals() async {
        do {
            netflixOriginals = try await NetworkManager.shared.fetchMovies(from: .netflixOriginals)
        } catch {
            handleError(error)
        }
    }

    private func fetchTopRated() async {
        do {
            topRatedMovies = try await NetworkManager.shared.fetchMovies(from: .topRated)
        } catch {
            handleError(error)
        }
    }


    private func handleError(_ error: Error) {
        self.error = error
        self.showError = true
    }
}
