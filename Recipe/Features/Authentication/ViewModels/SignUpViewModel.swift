import CryptoKit
//
//  SignUpViewModel.swift
//  Recipe
//
//  Created by saurav upreti on 3/26/25.
//
import Foundation
import SwiftData
import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var shouldValidateEmail: Bool = false
    @Published var shouldValidatePassword: Bool = false
    @Published var errorMessage: TextFieldError? = nil
    @Published var isSigningUp: Bool = false
    @Published var signUpSuccess: Bool = false
    @Published var showingAlert: Bool = false
    @Published var shouldNavigateBack: Bool = false

    private var authDataService: AuthDataService?

    func setModelContext(_ modelContext: ModelContext) {
        self.authDataService = AuthDataService(modelContext: modelContext)
    }

    func validateAndSignup() {
        shouldValidateEmail = true
        shouldValidatePassword = true
        errorMessage = nil
        signUpSuccess = false
        shouldNavigateBack = false

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
                    print("Error: ModelContext is not set.")
                    return
                }

        isSigningUp = true

        if let passwordHash = hashPassword(password) {
            do {
                try authDataService.saveUser(
                    email: email, password: passwordHash)
                signUpSuccess = true
                errorMessage = nil
                shouldValidateEmail = false
                shouldValidatePassword = false
                showingAlert = true
                shouldNavigateBack = true
                print("User signed up successfully!")

            } catch {
                // REMINDER: Not the best way to do this
                errorMessage = TextFieldError.invalidPassword
                print("Error saving user: \(error)")
            }
        } else {
            errorMessage = .empty
            print("Password hashing failed!")
        }

        isSigningUp = false
    }

    func clearTextFields() {
        email = ""
        password = ""
    }
}

func hashPassword(_ password: String) -> String? {
    guard let data = password.data(using: .utf8) else { return nil }
    let hashed = SHA256.hash(data: data)
    return hashed.compactMap { String(format: "%02x", $0) }.joined()
}
