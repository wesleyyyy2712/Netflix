//
//  EmptyDownloadView.swift
//  Netflix
//
//  Created by Shishir Rijal on 05/11/2024.
//

import SwiftUI

struct EmptyDownloadView: View {
  var body: some View {
    VStack (alignment: .center) {
      Spacer()
      Image(systemName: "arrow.down.to.line")
        .resizable()
        .fontWeight(.medium)
        .frame(width: 100, height: 100)
        .padding(50)
        .background(Color.customGray1)
        .foregroundColor(.white)
        .clipShape(Circle())

      Text("Never be without Netflix")
        .font(.customFont(.bold, 20))
        .multilineTextAlignment(.center)
        .padding(.bottom, 10)

      Text("Download shows and movies so you'll never be without something to watch\n-- even when you're offline")
        .font(.customFont(.regular, 16))
        .multilineTextAlignment(.center)

      Spacer().frame(height: 30)
      CustomButton(title: "See What You Can Download", image: nil) {
        // Go to home
      }

      Spacer()

    }
  }
}



#Preview {
    EmptyDownloadView()
}
