// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

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
        VStack(alignment: .leading) {
            Text(headerTitleText)
                .font(.helvetica(size: 20))
                .padding([.bottom], 40)
                .textCase(.uppercase)
            ForEach(headerItems, id: \.self) { item in
                HStack {
                    item.image
                        .foregroundColor(.primary)
                        .frame(width: 14, height: 14)
                    Text("\(item.name)")
                        .font(.helvetica(size: 14))
                }.padding([.bottom], 16)

            }
        }
    }
}

#Preview {
    WifiHeader(headerTitleText: "CONÉCTATE A NUESTRA WIFI",
               headerItems: [WifiHeaderItems(name: "Conexión automática", image: Image(systemName: "link")),
                             WifiHeaderItems(name: "Red segura", image: Image(systemName: "shield"))])
}
