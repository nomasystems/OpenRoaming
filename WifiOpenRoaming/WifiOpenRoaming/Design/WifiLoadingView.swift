// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiLoaderView: View {

    var body: some View {
        ProgressView()
            .scaleEffect(1, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: .black))
    }
}

#Preview {
    WifiLoaderView()
}
