//
//  MovieDetailHeroView.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetailHeroView: View {
    let url: URL

  @Environment(\.presentationMode) var presentationMode



    var body: some View {
      VStack {
        ZStack (alignment: .topTrailing) {
          ZStack (alignment: .bottomLeading) {
            ZStack(alignment: .center) {
                  WebImage(url: url)
                      .resizable()
                      .aspectRatio(1.3, contentMode: .fit)
                      .frame(maxWidth: .infinity)

                  Image(systemName: "play.circle")
                      .resizable()
                      .frame(width: 60, height: 60)
                      .opacity(0.8)
                      .foregroundColor(.customWhite)
            }

            Text("Trailer")
                .font(.customFont(.bold, 18))
                .foregroundColor(.primaryFontColor)
                .opacity(0.8)
                .padding()
          }
          // Cast
          HStack (spacing: 20) {
            Image(systemName: "airplayvideo")
              .resizable()
              .frame(width: 18, height: 18)

            Button(action: {
              presentationMode.wrappedValue.dismiss()
            }, label: {
              Image(systemName: "multiply")
                .resizable()
                .frame(width: 18, height: 18)
            })
          }
          .foregroundColor(.primaryFontColor)
          .padding()

        }

      }
    }
}
#Preview {
  MovieDetailHeroView(url: getImageUrl(path: dummyMovie.posterPath ?? getPlaceholderImage()))
    .preferredColorScheme(.dark)
}
