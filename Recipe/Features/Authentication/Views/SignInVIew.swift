//
//  SignInVIew.swift
//  Recipe
//
//  Created by saurav upreti on 2/22/25.
//

import SwiftUI

struct SignInVIew: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var viewModel: SignInViewModel
    @State private var navigateToForgotPassword: Bool = false
    @State private var navigateToSignUp: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                Text(AppStrings.Authentication.welcomeMsg)
                    .font(.titleMedium)
                    .padding(.bottom, 5)
                    .foregroundStyle(Color.appMain)

                Text(AppStrings.Authentication.pleaseEnterYourAccountHere)
                    .foregroundStyle(Color.appSecondary)

                Spacer()
                    .frame(height: 40)

                EmailTextField(
                    email: $viewModel.email,
                    shouldValidate: $viewModel.shouldValidateEmail
                )
                .padding(.bottom, 10)

                PasswordTextField(
                    password: $viewModel.password,
                    shouldValidate: $viewModel.shouldValidatePassword
                )
                .padding(.bottom, 10)

                Text(AppStrings.Authentication.forgotPassword)
                    .onTapGesture {
                        navigateToForgotPassword = true
                        print("Navigation forgot")
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, 10)

                Text(viewModel.errorMessage?.message ?? "")
                    .foregroundStyle(Color.cherryRed)

                Spacer()
                    .frame(height: 80)

                AppButton(
                    title: "Login", backgroundColor: Color.appGreen,
                    action: {
                        viewModel.validateAndLogin()
                        print(
                            "Email is: \($viewModel.email) \nPassword is: \($viewModel.password)"
                        )
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
        }
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .padding([.horizontal], 20)
        .navigationDestination(
            isPresented: $navigateToSignUp,
            destination: {
                SignUpView(viewModel: SignUpViewModel())
            }
        )
        .navigationDestination(
            isPresented: $navigateToForgotPassword,
            destination: {
                ResetYourPassword()
            }
        )
        .navigationDestination(
            isPresented: $viewModel.navigateToHome,
            destination: {
                HomeView()
            }
        )
        .onAppear {
            viewModel.setModelContext(modelContext)
        }
    }
}
