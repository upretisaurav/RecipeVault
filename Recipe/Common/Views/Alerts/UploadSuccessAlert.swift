//
//  UploadSuccessAlert.swift
//  Recipe
//
//  Created by saurav upreti on 3/10/25.
//

import SwiftUI

struct UploadSuccessAlert: View {
    let title: String
    let message: String
    let buttonText: String
    let onDismiss: () -> Void

    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.green)
                .padding(.bottom)
                .padding(.top, 40)

            Text(title)
                .font(.titleMedium)
                .padding(.bottom, 5)

            Text(message)
                .font(.titleSmall)
                .multilineTextAlignment(.center)
                .padding(.bottom)

            AppButton(
                title: buttonText, backgroundColor: Color.appGreen,
                action: onDismiss
            )
            .padding(.horizontal, Constants.horizontalPadding)
            .padding(.vertical, Constants.itemSmallBottomPadding)
            .padding(.bottom, Constants.itemMediumBottomPadding)
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}
