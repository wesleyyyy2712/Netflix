//
//  Font.swift
//  Netflix
//
//  Created by Shishir Rijal on 22/10/2024.
//

import SwiftUI

enum FontWeight {
    case light
    case regular
    case medium
    case bold
}

enum CustomFont: String {
    case netflixLight = "NetflixSans-Light"
    case netflixRegular = "NetflixSans-Regular"
    case netflixMedium = "NetflixSans-Medium"
    case netflixBold = "NetflixSans-Bold"
}

extension Font {

  // Define Title Font Style
  static var titleFont: Font {
      return .custom("NetflixSans-Medium", size: 18) // Custom font for title
  }

  // Define Hero Header Font Style
  static var heroHeaderFont: Font {
      return .custom("NetflixSans-Bold", size: 30) // Custom font for hero header
  }

  // Define Body Font Style
  static var bodyFont: Font {
      return .custom("NetflixSans-Medium", size: 14) // Custom font for body text
  }


    static let customFont: (FontWeight, CGFloat) -> Font = { fontType, size in
        switch fontType {
        case .light:
            return Font.custom(CustomFont.netflixLight.rawValue, size: size)
        case .regular:
            return Font.custom(CustomFont.netflixRegular.rawValue, size: size)
        case .medium:
            return Font.custom(CustomFont.netflixMedium.rawValue, size: size)
        case .bold:
            return Font.custom(CustomFont.netflixBold.rawValue, size: size)
        }
    }
}


