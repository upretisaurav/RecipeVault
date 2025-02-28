//
//  PasswordRecovery.swift
//  Recipe
//
//  Created by saurav upreti on 2/24/25.
//

import SwiftUI

struct PasswordRecovery: View {
    @State private var email: String = ""
    @State private var emailValidation: Bool = false

    var body: some View {
        VStack {
            Text(AppStrings.Authentication.passwordRecovery)
                .font(.titleMedium)
                .foregroundStyle(Color.appMain)
                .padding(.bottom, 5)

            Text(AppStrings.Authentication.enterYourEmailToRecoverPassword)
                .font(.titleSmall)
                .foregroundStyle(Color.appSecondary)
                .padding(.bottom, 40)

            EmailTextField(email: $email, shouldValidate: $emailValidation)
                .padding(.bottom, 40)

            AppButton(title: AppStrings.Authentication.signIn, backgroundColor: Color.appGreen, action: {
                validateAndSignIn()
            })
        }
        .padding(.horizontal, 20)
    }

    private func validateAndSignIn() {
        emailValidation = true
        let emailError = TextFieldValidator.validateEmail(email)

        if emailError == nil {

            print("Email is: \(email)")

        }
    }
}

#Preview {
    PasswordRecovery()
}
