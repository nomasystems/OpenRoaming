// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiNoProfileInstalled: View {
    @State private var terms: Bool = false
    @State private var showAlert: Bool = false

    private let model = WifiInformationViewModel()
    @ObservedObject var viewModel: WifiSDKViewModel

    var body: some View {
        VStack(alignment: .leading) {
            model.image.centerCropped()

            WifiHeader(headerTitleText: model.headerTitleText,
                       headerSubtitleText: model.headerSubtitleText)
            .padding([.leading, .trailing], 34)
            .padding([.top], 32)
            Toggle(model.termsAndConditionsText,
                   isOn: $terms)
            .toggleStyle(WifiCheckboxStyle())
            .font(.helvetica(size: 11))
            .padding([.top], 32)
            .padding([.leading, .trailing], 34)

        }
        Button(model.saveProfileButtonText) {
            if terms {
                viewModel.installProfile(id: UIDevice.current.identifierForVendor?.uuidString ?? NSDate().timeIntervalSince1970.description)
            } else {
                showAlert = true
            }
        }
        .alert("Debes aceptar las Condiciones de Uso y Privacidad", isPresented: $showAlert) {
            Button("Ok", role: .cancel) {}
        }
        .buttonStyle(.wifi)
        .padding([.top], 40)
        .padding([.bottom], 20)
        .padding([.leading, .trailing], 34)
    }
}
