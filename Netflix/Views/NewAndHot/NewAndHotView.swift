//
//  NewAndHotView.swift
//  Netflix
//
//  Created by Shishir Rijal on 23/10/2024.
//

import SwiftUI
import SDWebImageSwiftUI
struct NewAndHotView: View {
    @StateObject private var viewModel = NewAndHotViewModel()
    @Namespace var animation // Namespace for the matchedGeometryEffect

    var body: some View {
        VStack {
          TagListView(tags: viewModel.tags, activeTag: $viewModel.activeTag, animation: animation)
                .padding(.bottom, 20)

          Spacer()
          if viewModel.loading {
                         ProgressView("Loading...") // Show loading indicator
                             .progressViewStyle(CircularProgressViewStyle())
                             .padding()
                     }
          else {
            ScrollView {
                ForEach(viewModel.movies) { movie in
                    RecommendationView(movie)
                }
            }
          }

        }
    }
}


#Preview {
  NewAndHotView()
    .preferredColorScheme(.dark)
}









