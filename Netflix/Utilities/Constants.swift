//
//  Constants.swift
//  Netflix
//
//  Created by Shishir Rijal on 24/10/2024.
//

import Foundation

struct Constant {
  static let apiKey = Secrets.getAPIKey()
  static let baseUrl = "https://api.themoviedb.org/3"
  
  // Movies
  static let upcoming = baseUrl + "/movie/upcoming"
  static let popular = baseUrl + "/movie/popular"
  static let netflixOriginal = baseUrl + "/discover/movie"
  static let trending = baseUrl + "/movie/now_playing"
  static let topRated = baseUrl + "/movie/top_rated"
  
  // TV Shows
  static let tv = baseUrl + "/tv/on_the_air"
  static let airingToday = baseUrl + "/tv/airing_today"
  static let onAir = baseUrl + "/tv/on_the_air"
  static let popularTv = baseUrl + "/tv/popular"
  static let topRatedTv = baseUrl + "/tv/top_rated"



}
