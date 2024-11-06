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
        case failed(error: String)
    }

    @Published private(set) var state = State.idle

    func load() {
        state = .loading
        //        Move to cyber ark
        let appId = "com.inditex.zara.iphone"
        var dnaSpacesKey = "ff0cc05b-7488-443a-b114-1357529a42c7"
#if APPCLIP
        dnaSpacesKey = "ff0cc05b-7488-443a-b114-1357529a42c7"
#endif
        if !OpenRoaming.isSdkRegistered() {
            OpenRoaming.registerSdk(appId: appId,
                                    dnaSpacesKey: dnaSpacesKey,
                                    region: Region.EU,
                                    registerSdkHandler: { [weak self] _, error  in
                self?.checkProfile()
                if error != nil {
                    self?.state = .failed(error: "Register SDK Fail")
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
                        self?.state = .failed(error: "Install Profile fail")
                    }
                })
            } else {
                self?.state = .failed(error: "Associate user fail")
            }
        })
    }

    func deleteProfile(id: String) {
        OpenRoaming.deleteUser { error in
            if error != nil {
                self.state = .failed(error: "Delete Profile fail")
            } else {
                self.state = .missingProfile
            }
        }
    }

    func checkProfile() {
        state = .loading
        OpenRoaming.profileExistence { [weak self] isProfileInstalled, _ in
            self?.state = isProfileInstalled == true ? .installedProfile : .missingProfile
        }
    }

    func tryAgain() {
        state = .missingProfile
    }
}
