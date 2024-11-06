// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI
import OpenRoaming

struct WifiProfileInstalled: View {

    @ObservedObject var viewModel: WifiSDKViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48, alignment: .leading)
                        .foregroundStyle(.black)
                        .padding([.top, .leading], 20)
                    Spacer()
                }
                Text("Red WI-fi añadida para los próximos 7 dias")
                    .font(.title2)
                    .textCase(.uppercase)
                    .padding([.top], 32)
                    .padding([.leading], 20)
                Text("Instálate la App de Zara y disfruta de manera permanente de conexión Wi-Fi de tu dispositivo.")
                    .padding([.top, .leading], 20)
                    .font(.system(size: 12))

                Spacer()

                Button("Descargar la app") {
//                    let appUrl = URL(string: url) ?? IZSharingLinks.urlForApp()
//                    UIApplication.shared.open(appUrl)
                    if let url = URL(string: "itms-apps://itunes.apple.com/app/547951480") {
                        UIApplication.shared.open(url)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 32)
                .buttonStyle(.plain)
                .background(
                    Rectangle()
                        .stroke(.black, lineWidth: 0.5)
                )
                .font(.system(size: 16))

            }

        }
    }
}

#Preview {
    WifiProfileInstalled(viewModel: .init())
}
