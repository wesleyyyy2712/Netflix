//
//  MoviePreviewView.swift
//  Netflix
//
//  Created by Shishir Rijal on 05/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MoviePreviewView: View {
    let url: URL
    let isWatching: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
            ZStack(alignment: .center) {
                WebImage(url: url)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 106, height: 152)
                    .clipped()
                    .overlay(Color.gray.opacity(0.1)) // Overlay for slight darkening

                if isWatching {
                    Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                }
            }
            .cornerRadius(8)

            Image("LetterLogo")
                .resizable()
                .frame(width: 18, height: 30)
                .padding(5)
        }
    }
}


