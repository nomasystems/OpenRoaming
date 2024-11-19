//
//  ApiModel.swift
//  WifiOpenRoaming
//
//  Created by Daniel García Villaverde on 19/11/24.
//

import Foundation
import UIKit

struct ApiModel {
    static let appId = "com.inditex.openroaming"
    static let dnaSpacesKey = "e9d380f8-bbad-432d-9f68-d9d5dfc71d70"
    static let userId = UIDevice.current.identifierForVendor?.uuidString ?? NSDate().timeIntervalSince1970.description
}
