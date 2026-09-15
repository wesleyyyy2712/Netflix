//
//  RecommendationView.swift
//  Netflix
//
//  Created by Shishir Rijal on 05/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

// Recommendation View
struct RecommendationView: View {
  var movie: Media

  init(_ movie: Media) {
    self.movie = movie
  }


    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            VStack {
                HStack(alignment: .top, spacing: 10) {
                  DateView(date: movie.releaseDate ?? "Unknown")
                    Spacer()
                  WebImage(url: getImageUrl(path: movie.posterPath!))
                        .resizable()
                        .scaledToFill()
                        .frame(height: size.height - 20)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 20)
        }
        .frame(height: 450)
    }
}


#Preview {
    RecommendationView(dummyMovie)
}
