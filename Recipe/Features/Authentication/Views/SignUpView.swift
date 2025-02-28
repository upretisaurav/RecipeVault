//
//  SignUpView.swift
//  Recipe
//
//  Created by saurav upreti on 2/24/25.
//

import SwiftUI

struct SignUpView: View {
    @State private var shouldValidateEmail: Bool = false
    @State private var shouldValidatePassword: Bool = false
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Text(AppStrings.Authentication.welcome)
                .font(.titleMedium)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
                .foregroundStyle(Color.appMain)

            Text(AppStrings.Authentication.pleaseEnterYourAccountHere)
                .font(.titleSmall)
                .padding(.bottom, 40)
                .foregroundStyle(Color.appSecondary)

            EmailTextField(email: $email, shouldValidate: $shouldValidateEmail)
                .padding(.bottom, 10)

            PasswordTextField(password: $password, shouldValidate: $shouldValidatePassword)
                .padding(.bottom, 20)

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

            AppButton(title: AppStrings.Authentication.signUp, backgroundColor: Color.appGreen, action: {
                validateAndSignup()
            })

            Spacer()
        }
        .padding(.horizontal, 20)
    }

    private func validateAndSignup() {
        shouldValidateEmail = true
        shouldValidatePassword = true
        let emailError = TextFieldValidator.validateEmail(email)
        let passwordError = TextFieldValidator.validatePassword(password)

        if emailError == nil && passwordError == nil {

            print("Email is: \(email) \nPassword is: \(password)")

        }
    }
}

#Preview {
    SignUpView()
}
