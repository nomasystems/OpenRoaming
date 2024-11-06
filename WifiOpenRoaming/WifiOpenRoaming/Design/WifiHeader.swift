// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiHeader: View {
    let headerTitleText: String
    let headerSubtitleText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(headerTitleText)
                .font(.title2)
                .padding([.bottom], 8)
                .textCase(.uppercase)
            Text(headerSubtitleText)
                .font(.system(size: 12))
        }
    }
}

#Preview {
    WifiHeader(headerTitleText: "Accede a nuestra Red Wi-fi",
               headerSubtitleText: "Añade la Wi-Fi de Zara a tu dispositivo para conectarte de forma directa cuando visites alguna de nuestras tiendas, dispondrás de acceso durante los próximos 7 dias, hazlo permanente instalando nuestra APP.")
}
