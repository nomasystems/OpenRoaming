// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiNoProfileInstalled: View {
    @State private var terms: Bool = true
    @State private var showAlert: Bool = false

    private let model = WifiInformationViewModel()
    @ObservedObject var viewModel: WifiSDKViewModel

    var body: some View {
        VStack(alignment: .leading) {
            model.image.centerCropped()
                .frame(width:  UIScreen.main.bounds.size.width,
                       height: UIScreen.main.bounds.size.height * 0.57)

            Spacer(minLength: 20)
            WifiHeader(headerTitleText: model.headerTitleText,
                       headerItems: model.headerItems)
            .padding([.leading, .trailing], 32)
            Spacer(minLength: 20)

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
            .padding([.leading, .trailing], 32)
        }

        .safeAreaInset(edge: .bottom, alignment: .leading) {
            Toggle(model.termsAndConditionsText,
                   isOn: $terms)
            .toggleStyle(WifiCheckboxStyle())
            .font(.helvetica(size: 11))
            .padding([.leading, .trailing], 32)
            .padding([.top], 20)
            .padding([.bottom], 20)
        }
    }
}

#Preview {
    WifiNoProfileInstalled(viewModel: .init())
}
