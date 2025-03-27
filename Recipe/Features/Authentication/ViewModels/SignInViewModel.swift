//
//  SignInViewModel.swift
//  Recipe
//
//  Created by saurav upreti on 3/26/25.
//
import Foundation
import SwiftUI
import SwiftData

class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var shouldValidateEmail: Bool = false
    @Published var shouldValidatePassword: Bool = false
    @Published var errorMessage: TextFieldError? = nil
    @Published var isLoggingIn: Bool = false
    @Published var loginSuccess: Bool = false
    @Published var navigateToHome: Bool = false

    private var authDataService: AuthDataService?

    func setModelContext(_ modelContext: ModelContext) {
        self.authDataService = AuthDataService(modelContext: modelContext)
    }

    func validateAndLogin() {
        shouldValidateEmail = true
        shouldValidatePassword = true
        errorMessage = nil
        loginSuccess = false

        let emailError = TextFieldValidator.validateEmail(email)
        let passwordError = TextFieldValidator.validatePassword(password)

        if let emailError = emailError {
            errorMessage = emailError
            return
        }

        if let passwordError = passwordError {
            errorMessage = passwordError
            return
        }

        guard let authDataService = authDataService else {
            print("Model context is not set for signin!")
            return
        }

        isLoggingIn = true

        if let user = authDataService.fetchUser(byEmail: email) {
            if let enteredPasswordHash = hashPassword(password),
               enteredPasswordHash == user.password {
                loginSuccess = true
                errorMessage = nil
                navigateToHome = true
                email = ""
                password = ""
                print("Login successful!")
            } else {
                errorMessage = .invalidPassword
                print("Incorrent password")
            }
        } else {
            // REMINDER: Not the best way to do this
            errorMessage = .empty
            print("User not found!")
        }

        isLoggingIn = false
    }
}
