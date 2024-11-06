// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiCheckboxStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .font(.system(size: 16, weight: .regular, design: .default))
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }
    }
}
