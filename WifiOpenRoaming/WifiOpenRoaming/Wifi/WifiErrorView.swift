// Copyright © 2024 Fashion Retail España SA. All rights reserved.

import SwiftUI
import OpenRoaming

struct WifiErrorView: View {

    let errorDescription: String = "Error"
    @ObservedObject var viewModel: WifiSDKViewModel
    var body: some View {
        VStack {
            Image(systemName: "wifi.slash")
                .foregroundStyle(.indigo)
                .font(.system(size: 100))
                .padding([.bottom, .trailing, .leading], 20)
                .padding([.top], 60)

            Text(errorDescription)
                .padding(20)
            Button {
                viewModel.tryAgain()
            } label: {
                Text("Try again")
            }
            Spacer()
        }
        .padding()
    }
}


#Preview {
    let model = WifiSDKViewModel()
    return WifiErrorView(viewModel: model)
}


