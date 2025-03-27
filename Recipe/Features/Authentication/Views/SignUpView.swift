//
//  SignUpView.swift
//  Recipe
//
//  Created by saurav upreti on 2/24/25.
//

import SwiftUI
import SwiftData

struct SignUpView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var viewModel: SignUpViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack {
                Text(AppStrings.Authentication.welcome)
                    .font(.titleMedium)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
                    .foregroundStyle(Color.appMain)

                Text(AppStrings.Authentication.pleaseEnterYourAccountHere)
                    .font(.titleSmall)
                    .padding(.bottom, 40)
                    .foregroundStyle(Color.appSecondary)

                EmailTextField(email: $viewModel.email, shouldValidate: $viewModel.shouldValidateEmail)
                    .padding(.bottom, 10)

                PasswordTextField(password: $viewModel.password, shouldValidate: $viewModel.shouldValidatePassword)
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
                    viewModel.validateAndSignup()
                })

                Spacer()
            }
        }
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .padding(.horizontal, 20)
        .alert("Account created!", isPresented: $viewModel.showingAlert) {
            Button("Go Back") {
                viewModel.showingAlert = false
                if viewModel.shouldNavigateBack {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        viewModel.clearTextFields()
                    }
                }
            }
        }
        .onAppear {
            viewModel.setModelContext(modelContext)
        }
    }
}
