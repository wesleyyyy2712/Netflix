//
//  MovieDescriptionSection.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI

struct MovieDescriptionSection: View {
    let description: String
    let genres: String
    let creator: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(description)
            CustomInfo(title: "Genres", value: genres)
            CustomInfo(title: "Creators", value: creator)
        }
        .font(.customFont(.regular, 14))
        .foregroundColor(.primaryFontColor)
    }



private struct CustomInfo: View {
  let title: String
  let value: String

  var body: some View {
    VStack {
      Text("\(title): ")
        .fontWeight(.bold)
      + Text(value)
    }
    .font(.customFont(.regular, 14))
    }
  }

}
