//
//  Text.swift
//  Netflix
//
//  Created by Shishir Rijal on 22/10/2024.
//

import SwiftUI

extension Text {
    // Applying the custom font with weight and size
    func customFont(_ fontWeight: FontWeight? = .medium, _ size: CGFloat? = nil) -> Text {
        return self.font(.customFont(fontWeight ?? .medium, size ?? 16))
    }
}
