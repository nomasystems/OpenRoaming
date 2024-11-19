// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

private enum ViewTraits {
    static let buttonHeight: CGFloat = 29
    static let lineWidth: CGFloat = 0.5
}

struct WifiButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textCase(.uppercase)
            .font(.helvetica())
            .padding(16)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: ViewTraits.buttonHeight)
            .background(
                Rectangle()
                    .stroke(.primary, lineWidth: ViewTraits.lineWidth)
            )
    }
}

extension ButtonStyle where Self == WifiButtonStyle {
    static var wifi: Self {
          return .init()
      }
  }

#Preview {
    Button("Preview Button") {}
        .buttonStyle(.wifi)
}
