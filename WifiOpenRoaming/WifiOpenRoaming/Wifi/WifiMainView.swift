// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI

struct WifiMainView: View {

    @ObservedObject var viewModel: WifiSDKViewModel = WifiSDKViewModel()

    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle: WifiLoaderView()
            case .loading: WifiLoaderView()
            case .installedProfile: WifiProfileInstalled(viewModel: viewModel)
            case .missingProfile: WifiNoProfileInstalled(viewModel: viewModel)
            case .failed: WifiErrorView(viewModel: viewModel)
            }
        }.onAppear(perform: {
            viewModel.load()
        })
        .padding()
    }
}

#Preview {
    WifiMainView()
}
