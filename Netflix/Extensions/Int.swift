//
//  Int.swift
//  Netflix
//
//  Created by Shishir Rijal on 04/11/2024.
//

import Foundation

extension Int {
    /// Converts an integer representing minutes into a formatted string "Xh Ym".
    /// - Returns: A string formatted as "Xh Ym". If hours are 0, it returns "Ym".
    func toHoursAndMinutes() -> String {
        let hours = self / 60
        let minutes = self % 60

        if hours > 0 {
            if minutes > 0 {
                return "\(hours)h \(minutes)m"
            } else {
                return "\(hours)h"
            }
        } else {
            return "\(minutes)m"
        }
    }
}
