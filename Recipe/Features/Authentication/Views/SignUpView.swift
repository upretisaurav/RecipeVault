//
//  SignUpView.swift
//  Recipe
//
//  Created by saurav upreti on 2/24/25.
//

import SwiftData
import SwiftUI

struct SignUpView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var viewModel: SignUpViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack {
                Text(AppStrings.Authentication.welcome)
                    .font(.titleMedium)
                    .padding(
                        EdgeInsets(
                            top: Constants.verticalPadding, leading: 0,
                            bottom: Constants.itemSmallBottomPadding,
                            trailing: 0)
                    )
                    .foregroundStyle(Color.appMain)

                Text(AppStrings.Authentication.pleaseEnterYourAccountHere)
                    .font(.titleSmall)
                    .padding(.bottom, Constants.itemMediumBottomPadding * 2)
                    .foregroundStyle(Color.appSecondary)

                EmailTextField(
                    email: $viewModel.email,
                    shouldValidate: $viewModel.shouldValidateEmail
                )
                .padding(.bottom, Constants.itemSmallBottomPadding)

                PasswordTextField(
                    password: $viewModel.password,
                    shouldValidate: $viewModel.shouldValidatePassword
                )
                .padding(.bottom, Constants.itemMediumBottomPadding)

                HStack {
                    VStack(alignment: .leading) {
                        Text(AppStrings.Authentication.yourPasswordMustContain)
                            .font(.titleSmall)
                            .padding(.bottom, Constants.itemMediumBottomPadding)
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
                .padding(.bottom, Constants.itemMediumBottomPadding)

                AppButton(
                    title: AppStrings.Authentication.signUp,
                    backgroundColor: Color.appGreen,
                    action: {
                        viewModel.validateAndSignup()
                    })

                Spacer()
            }
        }
        .scrollIndicators(ScrollIndicatorVisibility.hidden)
        .padding(.horizontal, Constants.horizontalPadding)
        .alert(AppStrings.Authentication.accountCreated, isPresented: $viewModel.showingAlert) {
            Button(AppStrings.Authentication.goBack) {
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
