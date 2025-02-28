//
//  TextfieldValidators.swift
//  Recipe
//
//  Created by saurav upreti on 2/23/25.
//

import Foundation

enum TextFieldError: Error {
    case empty
    case invalidEmail
    case invalidPhoneNumber
    case invalidPassword

    var message: String {
        switch self {
        case .empty:
            return "Field cannot be empty"
        case .invalidEmail:
            return "Please enter a valid email"
        case .invalidPassword:
            return "Please enter a valid password"
        case .invalidPhoneNumber:
            return "Please enter a valid phone number"
        }
    }
}

struct TextFieldValidator {
    static func validateEmail(_ email: String) -> TextFieldError? {
        if email.isEmpty { return .empty }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email) ? nil : .invalidEmail
    }

    static func validatePhoneNumber(_ phone: String) -> TextFieldError? {
        if phone.isEmpty { return .empty }

        let numbers = phone.filter { $0.isNumber }
        return numbers.count >= 10 ? nil : .invalidPhoneNumber
    }

    static func validatePassword(_ password: String) -> TextFieldError? {
        if password.isEmpty { return .empty }
        return password.count >= 6 ? nil : .invalidPassword
    }
}
