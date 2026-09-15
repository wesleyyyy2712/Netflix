//
//  SeasonSelectionButton.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI

struct SeasonSelectionButton: View {
    @Binding var selectedSeason: Int
    @Binding var showSeasonPicker: Bool

    var body: some View {
        Button(action: {
            showSeasonPicker = true
        }) {
            HStack {
                Text("Season \(selectedSeason)")
                    .font(.bodyFont)
                Image(systemName: "chevron.down")
                Spacer()
            }
            .padding(.vertical)
            .foregroundColor(.primaryFontColor)
        }
    }
}

