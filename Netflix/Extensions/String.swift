//
//  String.swift
//  Netflix
//
//  Created by Shishir Rijal on 24/10/2024.
//

import Foundation

extension String {
    // Method to get the full month name from a date string in "yyyy-MM-dd" format
    func monthName() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        // Convert the string to a Date object
        guard let date = inputFormatter.date(from: self) else {
            return nil // Return nil if the conversion fails
        }

        // Create a date formatter for the output format
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "MMM"

        // Convert the Date object back to a string
        return outputFormatter.string(from: date)
    }

    // Method to get the day from a date string in "yyyy-MM-dd" format
    func day() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        // Convert the string to a Date object
        guard let date = inputFormatter.date(from: self) else {
            return nil // Return nil if the conversion fails
        }

        // Create a date formatter for the output format
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd"

        // Convert the Date object back to a string
        return outputFormatter.string(from: date)
    }
}
