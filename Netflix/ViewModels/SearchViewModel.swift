//
//  SearchViewModel.swift
//  Netflix
//
//  Created by Shishir Rijal on 03/11/2024.
//

import Foundation


import Combine

class SearchViewModel: ObservableObject {
    @Published var movies: [Media] = []
    @Published var errorMessage: String? = nil
    @Published var searchText: String = ""

    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchPopularMovies()
        setupSearchListener()
    }

    func fetchPopularMovies() {
      guard let url = URL(string: Constant.popular) else { return }
        NetworkManager.shared.performRequest(url: url) { [weak self] (result: Result<MediaResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.movies = response.results
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    private func setupSearchListener() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .sink { [weak self] text in
                if text.isEmpty {
                    self?.fetchPopularMovies()
                } else {
                    self?.searchMovies(query: text)
                }
            }
            .store(in: &cancellables)
    }

    func searchMovies(query: String) {
      guard let url = URL(string: Constant.baseUrl + "/search/movie?query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else { return }
        NetworkManager.shared.performRequest(url: url) { [weak self] (result: Result<MediaResponse, Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self?.movies = response.results.isEmpty ? [] : response.results
                    self?.errorMessage = response.results.isEmpty ? "No results found" : nil
                case .failure(let error):
                    debugPrint("Error: \(error)")
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

