// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

private let experience = "experience"

enum ClipExperience: String, CaseIterable {
    case wifi
    case unknown
}

struct LoadExperienceView: View {
    @State private var clipExperience: ClipExperience = .wifi

    var body: some View {
        VStack {
            switch clipExperience {
            case .wifi:
                OpenRoamingView()
            case .unknown:
                ProgressView()
            }
        }.onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: handleUserActivity(_:))
    }

    private func handleUserActivity(_ activity: NSUserActivity) {
        guard let url = activity.webpageURL,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        var path = components.path
        path.removeFirst()
        clipExperience = ClipExperience(rawValue: path) ?? .wifi
    }
}

#Preview {
    LoadExperienceView()
}
