//
//  Movie.swift
//  Netflix
//
//  Created by Shishir Rijal on 23/10/2024.
//

import Foundation


struct Media: Codable, Identifiable {
    let id: Int
    let name: String?
    let title: String?
    let adult: Bool
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let genres: [Genre]?
    let voteAverage: Double
    let productionCompanies: [ProductionCompany]?
    let firstAirDate: String?
    let releaseDate: String?
    let runtime: Int?
    let episodeRunTime: [Int]?
    let originalLanguage: String
    let numberOfSeasons: Int?
    let numberOfEpisodes: Int?
    let seasons: [Season]?
    let createdBy: [Creator]?

    // Convenience computed properties
    var isMovie: Bool {
        return title != nil
    }

    var isTVShow: Bool {
        return name != nil
    }

    // Function to get the appropriate title for display
    func getDisplayTitle() -> String {
        return isMovie ? (title ?? "Unknown Title") : (name ?? "Unknown Title")
    }

    // Custom coding keys to map snake_case JSON keys to camelCase properties
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case title
        case adult
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genres
        case voteAverage = "vote_average"
        case productionCompanies = "production_companies"
        case firstAirDate = "first_air_date"
        case releaseDate = "release_date"
        case runtime
        case episodeRunTime = "episode_run_time"
        case originalLanguage = "original_language"
        case numberOfSeasons = "number_of_seasons"
        case numberOfEpisodes = "number_of_episodes"
        case seasons
        case createdBy = "created_by"
    }
}


// MARK: - MediaResponse
struct MediaResponse: Codable {
    let page: Int
    let results: [Media]
}


// MARK: - Dummy Data

// Sample data for genres
let sampleGenres: [Genre] = [
    Genre(id: 1, name: "Action"),
    Genre(id: 2, name: "Adventure"),
    Genre(id: 3, name: "Fantasy")
]

// Sample data for production companies
let sampleProductionCompanies: [ProductionCompany] = [
    ProductionCompany(id: 1, name: "Warner Bros."),
    ProductionCompany(id: 2, name: "20th Century Fox")
]

// Dummy Media Object for a Movie
let dummyMovie = Media(
    id: 123,
    name: nil, // nil because this is a movie
    title: "Venom: The Last Dance", // Movie title
    adult: false,
    overview: "This is a dummy overview for the movie, providing a brief description of the plot and main characters.",
    posterPath: "/hPIWQT70wQK6akqfLXByEvr62u0.jpg",
    backdropPath: "/hPIWQT70wQK6akqfLXByEvr62u0.jpg",
    genres: sampleGenres, // List of sample genres
    voteAverage: 7.5, // Sample average vote
    productionCompanies: sampleProductionCompanies,
    firstAirDate: nil, // nil because this is a movie
    releaseDate: "2024-11-01", // Sample release date
    runtime: 120, // Sample runtime in minutes
    episodeRunTime: nil, // nil for movies
    originalLanguage: "en", // Sample original language
    numberOfSeasons: nil, // nil for movies
    numberOfEpisodes: nil, // nil for movies
    seasons: nil, // nil for movies
    createdBy: nil // nil for movies
)


// Dummy Media Object for a TV Series
let dummySeries = Media(
    id: 456,
    name: "Westworld", // Series name
    title: nil, // nil because this is a series
    adult: true,
    overview: "A dark odyssey about the dawn of artificial consciousness and the evolution of sin in a futuristic theme park.",
    posterPath: "/nygwerCPkUNSApJaUn2dSuKIRf5.jpg", // Sample poster image path
    backdropPath: "/nygwerCPkUNSApJaUn2dSuKIRf5.jpg", // Sample backdrop image path
    genres: sampleGenres, // List of sample genres
    voteAverage: 8.5, // Sample average vote
    productionCompanies: sampleProductionCompanies, // List of sample production companies
    firstAirDate: "2016-10-02", // Sample first air date
    releaseDate: nil, // nil because this is a series
    runtime: nil, // nil for series, use episode runtime instead
    episodeRunTime: [60], // Average runtime of an episode in minutes
    originalLanguage: "en", // Sample original language
    numberOfSeasons: 4, // Number of seasons
    numberOfEpisodes: 36, // Total number of episodes
    seasons: nil, // nil for now, can be added later
    createdBy: nil // nil for now, can be added later
)
