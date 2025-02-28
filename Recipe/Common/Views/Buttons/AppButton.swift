//
//  AppButton.swift
//  Recipe
//
//  Created by saurav upreti on 2/21/25.
//

import SwiftUI

struct AppButton: View {
    let title: String
    let backgroundColor: Color
    let systemImage: String?
    let customImage: String?
    let action: () -> Void

    init(
        title: String, backgroundColor: Color, systemImage: String? = nil,
        customImage: String? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.action = action
        self.systemImage = systemImage
        self.customImage = customImage
    }

    var body: some View {
        Button(
            action: action,
            label: {
                HStack {
                    if let systemImage = systemImage {
                        Image(systemName: systemImage)
                            .foregroundStyle(.white)
                    } else if let customImage = customImage {
                        Image(customImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                    }
                    Text(title)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(.white)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(backgroundColor)
                )
            })
    }
}
