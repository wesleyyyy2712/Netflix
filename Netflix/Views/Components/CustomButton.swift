//
//  CustomButton.swift
//  Netflix
//
//  Created by Shishir Rijal on 22/10/2024.
//

import SwiftUI


struct CustomButton: View {
    let title: String
    let image: String?
    let action: () -> Void
    let isActive: Bool
  let backgroundColor: Color
  let foregroundColor: Color

  init(title: String, image: String?, action: @escaping () -> Void, isActive: Bool = true, backgroundColor: Color = .customWhite, foregroundColor: Color = .customBlack) {
    self.title = title
    self.image = image
    self.action = action
    self.isActive = isActive
    self.backgroundColor = backgroundColor
    self.foregroundColor = foregroundColor
  }


    var body: some View {
        Button(action: action) {
            HStack {
                if let imageName = image {
                    Image(systemName: imageName)
                }
                Text(title)
                    .font(.bodyFont)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 30)
            .background(isActive ? Color.white: Color.customGray1)
            .foregroundColor(isActive ? .customBlack: .customGrayLight2)
            .cornerRadius(4)
        }
    }

}

//#Preview {
//  CustomPrimaryButton(title: "Download", image: "arrow.down.to.line", isActive: false) {}
//}




enum ButtonType {
    case light
    case dark
    case onboarding
}

struct CustomTypeButton: View {
    let title: String
    let image: String
    let type: ButtonType
    let isEnabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: isEnabled ? action : {}) {
            HStack {
               Image(systemName: image)
                .fontWeight(.bold)
                // Text based on button type
              Text(title)
                .font(.customFont(.medium, 16))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .foregroundColor(isEnabled ? foregroundColor: Color.customGray1)
            .background(
                backgroundColor
            )

        }
        .disabled(!isEnabled)
    }
  
  private var foregroundColor: Color {
    switch (type) {
    case (.light):
        return Color.customBlack
    case (.dark):
      return Color.customWhite
    case (.onboarding):
      return Color.customWhite
    }
  }
    private var backgroundColor: Color {
        switch (type) {
        case (.light):
            return Color.customWhite
        case (.dark):
          return Color.customGrayDark2
        case (.onboarding):
          return Color.customRed
        }
    }
}

#Preview {
  CustomTypeButton(title:"Download", image: "arrow.down.to.line", type: .light, isEnabled: false) {
    //
  }
}
