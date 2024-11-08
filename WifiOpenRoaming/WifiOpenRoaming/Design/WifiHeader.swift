// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiHeader: View {
    let headerTitleText: String
    let headerSubtitleText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(headerTitleText)
                .font(.helvetica(size: 18))
                .padding([.bottom], 24)
                .textCase(.uppercase)
            Text(headerSubtitleText)
                .font(.helvetica())
        }
    }
}

#Preview {
    WifiHeader(headerTitleText: "Accede a nuestra Red Wi-fi",
               headerSubtitleText: "Conéctate a la wi-fi de nuestras tiendas durante los próximos 7 dias. Descárgate la app para hacerlo permanente.")
}
