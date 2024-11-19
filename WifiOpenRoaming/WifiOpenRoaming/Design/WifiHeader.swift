// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

private enum ViewTraits {
    static let imageSize = CGSize(width: 14, height: 14)
}

struct WifiHeaderItems: Hashable {
    let name: String
    let image: Image

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

struct WifiHeader: View {
    let headerTitleText: String
    let headerItems: [WifiHeaderItems]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(headerTitleText)
                .font(.helvetica(size: .headerTitle))
                .padding([.bottom], 24)
                .textCase(.uppercase)
            ForEach(headerItems, id: \.self) { item in
                HStack(spacing: 8){
                    item.image
                        .foregroundColor(.primary)
                        .frame(width: ViewTraits.imageSize.width,
                               height: ViewTraits.imageSize.height)
                    Text(item.name)
                        .font(.helvetica(size: .listLabel))
                }

            }
        }
    }
}

#Preview {
    WifiHeader(headerTitleText: "CONÉCTATE A NUESTRA WIFI",
               headerItems: [WifiHeaderItems(name: "Conexión automática", image: Image(systemName: "link")),
                             WifiHeaderItems(name: "Red segura", image: Image(systemName: "shield"))])
}
