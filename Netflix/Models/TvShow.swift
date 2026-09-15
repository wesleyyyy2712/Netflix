//
//  TvShow.swift
//  Netflix
//
//  Created by Shishir Rijal on 04/11/2024.
//

import SwiftUI


struct ProductionCompany: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}



struct Creator: Codable {
    let id: Int
    let name: String
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case profilePath = "profile_path"
    }
}




struct Season: Codable {
    let airDate: String
    let episodes: [Episode]?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodes
    }
}

struct Episode: Codable {
    let id: Int
    let name: String
    let overview: String
    let episodeNumber: Int
    let seasonNumber: Int
    let stillPath: String?
    let runtime: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, overview, runtime
        case episodeNumber = "episode_number"
        case seasonNumber = "season_number"
        case stillPath = "still_path"
    }
}

