//
//  TabBarButton.swift
//  Recipe
//
//  Created by saurav upreti on 2/27/25.
//

import SwiftUI

struct TabBarButton: View {
    let imageName: String
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: imageName)
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? .appGreen : .gray)

                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(isSelected ? .appGreen : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
