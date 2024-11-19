//
//  WifiFontStyle.swift
//  WifiOpenRoaming
//
//  Created by Daniel García Villaverde on 8/11/24.
//

import SwiftUICore

enum FontSize: CGFloat {
    case headerTitle = 20
    case header2Title = 18
    case listLabel = 14
    case standardLabel = 11
}

extension Font {

    static func helvetica(size: FontSize = .standardLabel) -> Font {
        return .custom("Helvetica Neue", size: size.rawValue)
    }
}
