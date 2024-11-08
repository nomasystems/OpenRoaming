// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import Foundation
import OpenRoaming

@MainActor
class WifiSDKViewModel: ObservableObject {

    enum State {
        case idle
        case loading
        case installedProfile
        case missingProfile
    }

    @Published private(set) var state = State.idle
    @Published var showError = false

    func load() {
        state = .loading
        let appId = "com.inditex.openroaming"
        let dnaSpacesKey = "e9d380f8-bbad-432d-9f68-d9d5dfc71d70"

        if !OpenRoaming.isSdkRegistered() {
            OpenRoaming.registerSdk(appId: appId,
                                    dnaSpacesKey: dnaSpacesKey,
                                    region: Region.EU,
                                    registerSdkHandler: { [weak self] _, error  in
                self?.checkProfile()
                if error != nil {
                    self?.showError = true
                }
            })
        } else {
            checkProfile()
        }
    }

    func installProfile(id: String) {
        guard !id.isEmpty else { return }
        state = .loading
        let idType: IdType = .USER_ID
        OpenRoaming.associateUser(idType: idType, id: id, signingHandler: { [weak self] error in
            if error == nil {
                OpenRoaming.installProfile(provisionProfileHandler: { [weak self] err in
                    if err == nil {
                        self?.state = .installedProfile
                        self?.checkProfile()
                    } else {
                        self?.showError = true
                    }
                })
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.showError = true
                }
            }
        })
    }

    func deleteProfile(id: String) {
        OpenRoaming.deleteUser { error in
            if error != nil {
                self.showError = true
            } else {
                self.state = .missingProfile
            }
        }
    }

    func checkProfile() {
        DispatchQueue.main.async { [weak self] in
            self?.state = .loading
            OpenRoaming.profileExistence { [weak self] isProfileInstalled, _ in
                DispatchQueue.main.async { [weak self] in
                    self?.state = isProfileInstalled == true ? .installedProfile : .missingProfile
                }
            }
        }
    }

    func tryAgain() {
        state = .missingProfile
    }
}
