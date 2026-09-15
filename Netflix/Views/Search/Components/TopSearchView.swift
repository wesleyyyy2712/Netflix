//
//  TopSearchView.swift
//  Netflix
//
//  Created by Shishir Rijal on 05/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct TopSearchView: View {
    let imageUrl: URL?
    let title: String

    var body: some View {
        HStack(spacing: 20) {
            if let imageUrl = imageUrl {
                WebImage(url: imageUrl)
                    .resizable()
                    .frame(width: 130, height: 76)
                    .aspectRatio(contentMode: .fill)
            } else {
                Image(systemName: "photo")
                    .frame(width: 146, height: 76)
                    .foregroundColor(.gray)
            }

            Text(title)
                .lineLimit(2)
                .font(.customFont(.light, 16))

            Spacer()

            Image(systemName: "play.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing)
        }
        .background(Color.customGrayDark2)
    }
}


#Preview {
    TopSearchView(
      imageUrl: getImageUrl(path: dummyMovie.posterPath!), title: dummyMovie.title!)
}
