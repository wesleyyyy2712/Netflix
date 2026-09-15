//
//  CustomDownloadCard.swift
//  Netflix
//
//  Created by Shishir Rijal on 05/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct CustomDownloadCard: View {
  var media: Media

  var body: some View {
      VStack(alignment: .leading, spacing: 5) {
          HStack {
            WebImage(url: getImageUrl(path: media.posterPath!))
                  .resizable()
                  .aspectRatio(1.7, contentMode: .fit)
                  .frame(height: 70)
                  .cornerRadius(8)


            VStack {
              HStack {
                VStack(alignment: .leading) {
                  Text(media.getDisplayTitle())
                          .font(.customFont(.medium, 16))
                          .lineLimit(2)

                  Text(media.isMovie ? "243 MB" :  "\(media.numberOfSeasons!) Seasons | 243 MB")
                          .font(.customFont(.light, 14))

                    Text("Downloaded")
                          .font(.customFont(.regular, 14))
                }
               // Only for TVShows
                if(!media.isMovie) {
                  Spacer()
                  Image(systemName: "chevron.right")
                    .font(.title2)
                    .fontWeight(.medium)
                }
              }
            }
          }

      }
  }
}

#Preview {
    CustomDownloadCard(media: dummyMovie)
}
