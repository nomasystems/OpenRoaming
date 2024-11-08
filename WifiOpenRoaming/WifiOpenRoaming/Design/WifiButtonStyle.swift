// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textCase(.uppercase)
            .font(.helvetica(size: 11))
            .padding(16)
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity)
            .frame(maxHeight: 29)
            .background(
                Rectangle()
                    .stroke(.primary, lineWidth: 0.5)
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
