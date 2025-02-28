//
//  AppSecondaryButton.swift
//  Recipe
//
//  Created by saurav upreti on 2/26/25.
//

import SwiftUI

struct AppSecondaryButton: View {
    var action: () -> Void
    var btnName: String

    var body: some View {
        Button( action: action, label: {
            Text(btnName)
                .fontWeight(.semibold)
        })
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundStyle(Color.appSecondary)
        .background(
            RoundedRectangle(
                cornerRadius: 50
            )
            .stroke(Color.appSecondary, lineWidth: 1)
        )
    }
}
