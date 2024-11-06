// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiInformationCell: View {
    let info: WifiInformationCellModel
    var body: some View {

        HStack(alignment: .top) {
            info.image
                .resizable()
                .frame(width: 24, height: 24)
            VStack(alignment: .leading) {
                Text(info.headerTitleText)
                    .font(.subheadline)
                    .textCase(.uppercase)
                Text(info.headerSubtitleText)
                    .font(.system(size: 12))
            }
            .padding([.leading], 8)
        }
        .padding([.top, .bottom], 16)
    }
}

#Preview {
    WifiInformationCell(info: .init(headerTitleText: "Conexión automática",
                                    headerSubtitleText: "Sin registros ni contraseñas",
                                    image: Image(systemName: "hand.thumbsup")))
}
