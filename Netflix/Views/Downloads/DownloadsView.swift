//
//  DownloadsView.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct DownloadsView: View {
  
  @State var downloadedMovies: [Media] = [dummyMovie, dummySeries, dummyMovie, dummySeries]

    var body: some View {

      VStack (alignment: .leading) {

        Text("My Downloads")
          .font(.largeTitle)
          .fontWeight(.bold)
          .padding(.bottom)
        // Smart Download
        HStack {
          Image(systemName: "info.circle")
            .font(.title2)
            .fontWeight(.bold)
          Text("Smart Downloads")
          Text("ON")
            .foregroundColor(.customRed)
          Spacer()

        }
        .font(.customFont(.bold, 18))
        .padding(.bottom)


        // Downloads
        if downloadedMovies.isEmpty {
          EmptyDownloadView()
        }
        else {
          ForEach(downloadedMovies) {movie in
            CustomDownloadCard(media: movie)
              .padding(.bottom, 10)
          }
        }

        Spacer()


      }
      .padding(.horizontal)

    }
}




#Preview {
    DownloadsView()
}
