// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiNoProfileInstalled: View {

    @State private var terms: Bool = false
    private let model: WifiInformationProtocol = WifiInformationViewModel()
    @ObservedObject var viewModel: WifiSDKViewModel

    var body: some View {
        VStack(alignment: .leading) {
            WifiHeader(headerTitleText: model.headerTitleText,
                       headerSubtitleText: model.headerSubtitleText)
            .padding(20)

            ForEach(model.information, id: \.headerTitleText) { section in
                WifiInformationCell(info: .init(headerTitleText: section.headerTitleText,
                                                headerSubtitleText: section.headerSubtitleText,
                                                image: section.image))
            }
            .padding([.leading, .trailing], 16)

            Toggle(model.termsAndConditionsText,
                   isOn: $terms)
            .toggleStyle(WifiCheckboxStyle())
            .font(.system(size: 12))
            .padding([.leading, .trailing], 16)

        }
        Button(model.saveProfileButtonText) {
            viewModel.installProfile(id: "1234")
        }
            .buttonStyle(.wifi)
            .padding([.top, .bottom], 40)
        Spacer()
    }
}
