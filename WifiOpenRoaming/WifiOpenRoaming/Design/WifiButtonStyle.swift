// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .textCase(.uppercase)
            .font(.system(size: 12))
            .padding(16)
            .foregroundStyle(.black)
            .background(
                Rectangle()
                    .stroke(.black, lineWidth: 0.5)
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
