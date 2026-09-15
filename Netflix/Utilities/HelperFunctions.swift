//
//  HelperFunctions.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import Foundation

func getImageUrl(path: String) -> URL {
  let baseURL = "https://image.tmdb.org/t/p/w500"
  let fullPath = baseURL + path
  return URL(string: fullPath)!
}


func getPlaceholderImage() -> String {
  return "https://i.pcmag.com/imagery/reviews/05cItXL96l4LE9n02WfDR0h-5.fit_scale.size_760x427.v1582751026.png"
}
