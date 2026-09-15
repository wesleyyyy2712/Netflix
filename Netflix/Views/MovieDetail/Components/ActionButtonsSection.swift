//
//  ActionButtonsSection.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI

struct ActionButtonsSection: View {
    var body: some View {
        VStack {
            CustomTypeButton(title: "Play", image: "play.fill", type: .light, isEnabled: true) {
                // Play action here
            }
            CustomTypeButton(title: "Download", image: "arrow.down.to.line", type: .dark, isEnabled: true) {
                // Download action here
            }
        }
    }
}
#Preview {
    ActionButtonsSection()
}
