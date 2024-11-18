// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI
import OpenRoaming

struct WifiProfileInstalled: View {

    @ObservedObject var viewModel: WifiSDKViewModel
    private let model = WifiInstalledInformationViewModel()

    var body: some View {
        VStack(alignment: .center) {
            model.image.centerCropped()
            VStack (alignment: .center) {
                Spacer()
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48, alignment: .center)
                    .foregroundStyle(.primary)

                Text(model.headerTitleText)
                    .font(.helvetica(size: 18))
                    .padding([.top], 24)
                    .textCase(.uppercase)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    WifiProfileInstalled(viewModel: .init())
}
