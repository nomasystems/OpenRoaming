// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import Foundation
import OpenRoaming
import UIKit

@MainActor
class OpenRoamingModel {

    private let dataSource: OpenRoamingDataSource

    enum State {
        case loading
        case installedProfile
        case missingProfile
    }

    init(dataSource: OpenRoamingDataSource = OpenRoamingDataSource()) {
        self.dataSource = dataSource
    }

    func load() async -> State? {
        do {
            if await !self.dataSource.isSDKRegistered() {
                try await self.dataSource.registerSDK()
            }
            return try await self.dataSource.checkProfile()
        } catch {
            return nil
        }
    }

    func installProfile() async -> State? {
        do {
            try await dataSource.associateUser()
            try await dataSource.installProfile()
            return try await self.dataSource.checkProfile()
        } catch {
            return nil
        }
    }

    func deleteProfile() async -> State? {
        do {
            return try await dataSource.deleteProfile()
        } catch {
            return nil
        }
    }

    func tryAgain() -> State {
        return .missingProfile
    }
}
