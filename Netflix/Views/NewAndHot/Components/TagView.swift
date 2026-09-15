//
//  TagView.swift
//  Netflix
//
//  Created by Shishir Rijal on 05/11/2024.
//

import SwiftUI

struct TagView: View {
    let tag: String
    let isActive: Bool
    var animation: Namespace.ID

    var body: some View {
        Text(tag.capitalized)
            .font(.body)
            .fontWeight(.semibold)
            .foregroundColor(isActive ? .white :  .primaryFontColor)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background {
                if isActive {
                    Capsule()
                    .fill(.redDark)
                        .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                } else {
                    Capsule()
                    .stroke(.gray, lineWidth: 2.0)
                }
            }
    }
}



// MARK: - Tag List View
struct TagListView: View {
    var tags: [String]
    @Binding var activeTag: String
    var animation: Namespace.ID

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(tags, id: \.self) { tag in
                    TagView(tag: tag, isActive: tag == activeTag, animation: animation)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                activeTag = tag // Update the active tag on tap
                            }
                        }
                }
            }
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.hidden)
    }
}

