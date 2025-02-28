//
//  Font+Extension.swift
//  Recipe
//
//  Created by saurav upreti on 2/21/25.
//

import SwiftUI

extension Font {
    static func customFont(size: CGFloat, weight: Weight = .regular) -> Font {
        return Font.custom("Inter", size: size).weight(weight)
    }

    static let titleLarge = customFont(size: 32, weight: .bold)
    static let titleMedium = customFont(size: 24, weight: .semibold)
    static let titleSmall = customFont(size: 18)
    static let body = customFont(size: 16)
    static let caption = customFont(size: 14)
}
