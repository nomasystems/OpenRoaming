//
//  Untitled.swift
//  WifiOpenRoaming
//
//  Created by Daniel García Villaverde on 19/11/24.
//

import OpenRoaming

actor OpenRoamingDataSource {

    func registerSDK() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            OpenRoaming.registerSdk(appId: ApiModel.appId,
                                    dnaSpacesKey: ApiModel.dnaSpacesKey,
                                    region: .EU) { _, error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }

    func isSDKRegistered() -> Bool {
        OpenRoaming.isSdkRegistered()
    }

    func checkProfile() async throws -> OpenRoamingModel.State {
        try await withCheckedThrowingContinuation { continuation in
            OpenRoaming.profileExistence { isProfileInstalled, error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: isProfileInstalled == true ? .installedProfile : .missingProfile)
                }
            }
        }
    }

    func installProfile() async throws {
       return try await withCheckedThrowingContinuation { continuation in
            OpenRoaming.installProfile { error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }

    func associateUser() async throws {
        return try await withCheckedThrowingContinuation { continuation in
            OpenRoaming.associateUser(idType: .USER_ID,
                                      id: ApiModel.userId) { error in
                guard let error else {
                    continuation.resume()
                    return
                }
                switch error {
                case .UserAlreadyAssociatedException: continuation.resume()
                default: continuation.resume(throwing: error)
                }
            }
        }
    }

    func deleteProfile() async throws -> OpenRoamingModel.State {
        try await withCheckedThrowingContinuation { continuation in
            OpenRoaming.deleteUser { error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: .missingProfile)
                }
            }
        }
    }
}
