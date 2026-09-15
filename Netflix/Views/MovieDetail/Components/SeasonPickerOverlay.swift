//
//  SeasonPickerOverlay.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI

struct SeasonPickerOverlay: View {
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    let seasonCount: Int

    var body: some View {
        if showSeasonPicker {
            Color.black.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    VStack(spacing: 40) {
                        Spacer()
                      ForEach(1...seasonCount, id: \.self) { season in
                            Button(action: {
                                selectedSeason = season
                                showSeasonPicker = false
                            }) {
                                Text("Season \(season)")
                                    .foregroundColor(selectedSeason == season ? .white : .gray)
                                    .bold()
                                    .font(selectedSeason == season ? .title : .title2)
                            }
                        }
                        Button(action: {
                            showSeasonPicker = false
                        }) {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.customWhite)
                                .font(.system(size: 40))
                        }
                        .padding(.bottom, 30)
                    }
                )
        }
    }
}
