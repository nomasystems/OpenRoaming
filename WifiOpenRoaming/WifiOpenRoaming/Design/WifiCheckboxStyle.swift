// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

private enum ViewTraits {
    static let checkBoxSize = CGSize(width: 14, height: 13)
}

struct WifiCheckboxStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: ViewTraits.checkBoxSize.width, height: ViewTraits.checkBoxSize.height)
                .foregroundColor(.primary)
                .font(.helvetica())
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }
    }
}
