//
//  GlassMorphicButton.swift
//  Recipe
//
//  Created by saurav upreti on 3/1/25.
//

import SwiftUI

struct GlassMorphicButton: View {
    var iconName: String
    var iconColor: Color = .white
    var size: CGFloat = 50
    var cornerRadius: CGFloat = 16 
    var backgroundOpacity: Double = 0.3
    var blurRadius: CGFloat = 3

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(Color.black.opacity(backgroundOpacity))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
                )
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color.appGrey.opacity(0.1))
                        .blur(radius: blurRadius)
                )
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .frame(width: size, height: size)


            Image(systemName: iconName)
                .font(.system(size: size * 0.5))
                .foregroundColor(iconColor)
        }
    }
}
