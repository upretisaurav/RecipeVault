//
//  ResetYourPassword.swift
//  Recipe
//
//  Created by saurav upreti on 2/26/25.
//

import SwiftUI

struct ResetYourPassword: View {
    @State private var password: String = ""
    @State private var passwordValidation: Bool = false

    var body: some View {
        VStack {
            Text(AppStrings.Authentication.resetYourPassword)
                .font(.titleMedium)
                .foregroundStyle(Color.appMain)
                .padding(.bottom, 5)
                .padding(.top, 50)

            Text(AppStrings.Authentication.pleaseEnterYourNewPassword)
                .font(.titleSmall)
                .foregroundStyle(Color.appSecondary)
                .padding(.bottom, 40)

            PasswordTextField(password: $password, shouldValidate: $passwordValidation)
                .padding(.bottom, 10)

            HStack {
                VStack(alignment: .leading) {
                    Text(AppStrings.Authentication.yourPasswordMustContain)
                        .font(.titleSmall)
                        .padding(.bottom, 15)
                    HStack {
                        Circle()
                            .frame(width: 4, height: 4)
                        Text(AppStrings.Authentication.atLeastSixCharacters)
                    }
                    HStack {
                        Circle()
                            .frame(width: 4, height: 4)
                        Text(AppStrings.Authentication.containsANumber)
                    }
                }
                Spacer()
            }
            .padding(.bottom, 20)

            AppButton(title: AppStrings.Authentication.done, backgroundColor: Color.appGreen, action: {
                validateAndSignIn()
            })

            Spacer()
        }
        .padding(.horizontal, 20)
    }

    private func validateAndSignIn() {
        passwordValidation = true
        let passwordError = TextFieldValidator.validateEmail(password)

        if passwordError == nil {

            print("Email is: \(password)")

        }
    }
}

#Preview {
    ResetYourPassword()
}
