//
//  OpenRoamingView.swift
//  WifiOpenRoaming
//
//  Created by Daniel García Villaverde on 20/11/24.
//

import SwiftUI

struct OpenRoamingView: View {

    @State private var state = OpenRoamingModel.State.loading
    @State private var showError = false
    @State private var terms: Bool = true
    @State private var showAlert: Bool = false

    private let model: OpenRoamingModel = OpenRoamingModel()
    private let utils = OpenRoamingViewUtils()

    var body: some View {
        VStack(alignment: .center, spacing: .zero) {
            utils
                .image
                .centerCropped()

            VStack(spacing: .zero) {
                switch state {
                case .installedProfile: profileInstalled()
                case .loading, .missingProfile: profileNoInstalled()
                }
            }.frame(maxWidth: .infinity, maxHeight: 346)
        }
        .overlay {
            if state == .loading {
                WifiLoaderView()
            }
        }
        .task {
            await loadOpenRoaming()
        }
        .alert(utils.errorText, isPresented: $showError) {
            Button(utils.ok, role: .cancel) {
                Task {
                    await loadOpenRoaming()
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    @ViewBuilder
    func profileInstalled() -> some View {
        VStack (alignment: .center) {
            Spacer()
            utils.checkMarkCircle
                .resizable()
                .frame(width: 48, height: 48, alignment: .center)
                .foregroundStyle(.primary)

            Text(utils.profileInstalledText)
                .font(.helvetica(size: .header2Title))
                .padding([.top], 24)
                .textCase(.uppercase)
            Spacer()
        }
    }

    @ViewBuilder
    func profileNoInstalled() -> some View {
        VStack(alignment: .leading, spacing: .zero) {
            WifiHeader(headerTitleText: utils.headerTitleText,
                       headerItems: utils.headerItems)
            .padding([.top], 47)

            // MARK: Save wifi network Button
            Button(utils.saveProfileButtonText) {
                if terms {
                    installProfile()
                } else {
                    showAlert = true
                }
            }
            .alert(utils.termsAndConditionsAlertText,
                   isPresented: $showAlert) {
                Button(utils.ok, role: .cancel) {}
            }
            .buttonStyle(.wifi)
            .padding([.top], 36)

            // MARK: Terms and conditions Toggle
            Toggle(utils.termsAndConditionsText,
                   isOn: $terms)
            .toggleStyle(WifiCheckboxStyle())
            .font(.helvetica())
            .padding([.top], 64)
            .padding([.bottom], 20)
        }
        .padding([.leading, .trailing], 32)
    }

    func loadOpenRoaming() async {
        guard let state = await model.load() else {
            self.showError = true
            return
        }
        self.state = state
    }

    func installProfile() {
        state = .loading
        Task {
            guard let state = await model.installProfile() else {
                self.showError = true
                return
            }
            self.state = state
        }
    }
}

#Preview {
    OpenRoamingView()
}
