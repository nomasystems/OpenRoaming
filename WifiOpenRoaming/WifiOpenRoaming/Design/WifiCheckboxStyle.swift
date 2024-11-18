// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiCheckboxStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 14, height: 13)
                .foregroundColor(.primary)
                .font(.helvetica(size: 11))
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }
    }
}
