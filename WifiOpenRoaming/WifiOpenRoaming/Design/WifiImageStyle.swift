//
//  WifiImageStyle.swift
//  WifiOpenRoaming
//
//  Created by Daniel García Villaverde on 8/11/24.
//

import SwiftUICore

extension Image {
    func centerCropped() -> some View {
        GeometryReader { geo in
            self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: geo.size.width, height: geo.size.height + geo.safeAreaInsets.top)
            .clipped()
            .ignoresSafeArea()
        }
    }
}
