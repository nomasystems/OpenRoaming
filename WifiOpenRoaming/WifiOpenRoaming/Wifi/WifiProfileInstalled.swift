// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI
import OpenRoaming

struct WifiProfileInstalled: View {

    @ObservedObject var viewModel: WifiSDKViewModel
    private let model = WifiInstalledInformationViewModel()

    var body: some View {
        VStack(alignment: .center) {
            model.image.centerCropped()
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48, alignment: .center)
                    .foregroundStyle(.primary)
                    .padding([.top], 30)

                Text(model.headerTitleText)
                    .font(.helvetica(size: 18))
                    .padding([.top], 28)
                    .textCase(.uppercase)
                Text(model.headerSubtitleText)
                    .font(.helvetica())
                    .padding([.top], 24)
                Button(model.downloadButtonText) {
                    if let url = URL(string: model.downloadUrl) {
                        UIApplication.shared.open(url)
                    }
                }
                .buttonStyle(.wifi)
                .padding([.top], 40)
                .padding([.bottom], 20)
                .padding([.leading, .trailing], 34)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    WifiProfileInstalled(viewModel: .init())
}
