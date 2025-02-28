//
//  TextStyleModifier.swift
//  Recipe
//
//  Created by saurav upreti on 2/21/25.
//

import SwiftUI

struct TextStyleModifier: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight

    func body(content: Content) -> some View {
            content
                .font(.customFont(size: size, weight: weight))
        }
}

extension View {
    func customTextStyle(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        modifier(TextStyleModifier(size: size, weight: weight))
    }
}
