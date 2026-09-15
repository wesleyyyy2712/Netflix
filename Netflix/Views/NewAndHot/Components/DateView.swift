//
//  DateView.swift
//  Netflix
//
//  Created by Shishir Rijal on 05/11/2024.
//

import SwiftUI


struct DateView: View {
    var date: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
          Text(date.monthName() ?? "XXXX") // Static month for demonstration
            .font(.bodyFont)
          Text(date.day() ?? "XX") // Static day for demonstration
                .font(.title)
                .fontWeight(.semibold)
        }
        .padding(.top, 5)
    }
}


