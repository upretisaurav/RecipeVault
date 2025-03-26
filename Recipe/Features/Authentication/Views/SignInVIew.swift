//
//  SignInVIew.swift
//  Recipe
//
//  Created by saurav upreti on 2/22/25.
//

import SwiftUI

struct SignInVIew: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var shouldValidateEmail: Bool = false
    @State private var shouldValidatePassword: Bool = false
    @State private var navigateToSignUp: Bool = false
    @State private var navigateToForgotPassword: Bool = false

    var body: some View {
        VStack {
            Text(AppStrings.Authentication.welcomeMsg)
                .font(.titleMedium)
                .padding(.bottom, 5)
                .foregroundStyle(Color.appMain)

            Text(AppStrings.Authentication.pleaseEnterYourAccountHere)
                .foregroundStyle(Color.appSecondary)

            Spacer()
                .frame(height: 40)

            EmailTextField(email: $email, shouldValidate: $shouldValidateEmail)
                .padding(.bottom, 10)

            PasswordTextField(
                password: $password, shouldValidate: $shouldValidatePassword
            )
            .padding(.bottom, 10)

            Text(AppStrings.Authentication.forgotPassword)
                .onTapGesture {
                    navigateToForgotPassword = true
                    print("Navigation forgot")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

            Spacer()
                .frame(height: 80)

            AppButton(
                title: "Login", backgroundColor: Color.appGreen,
                action: {
                    validateAndLogin()
                    print("Email is: \(email) \nPassword is: \(password)")
                })

            Text(AppStrings.Authentication.orContinueWith)
                .foregroundStyle(Color.appSecondary)
                .padding()

            AppButton(
                title: "Google", backgroundColor: Color.appRed,
                customImage: "googleLogo", action: {})

            HStack {
                Text(AppStrings.Authentication.doNotHaveAccount)
                Text(AppStrings.Authentication.signUp)
                    .onTapGesture {
                        navigateToSignUp = true
                        print("Navigation signup")
                    }
                    .foregroundStyle(Color.appGreen)
            }
            .padding()
        }
        .padding([.horizontal], 20)
        .navigationDestination(isPresented: $navigateToSignUp, destination: {
            SignUpView()
        })
        .navigationDestination(isPresented: $navigateToForgotPassword, destination: {
            ResetYourPassword()
        })
    }

    private func validateAndLogin() {
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
    SignInVIew()
}
