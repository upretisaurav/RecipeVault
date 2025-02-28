//
//  PasswordTextField.swift
//  Recipe
//
//  Created by saurav upreti on 2/23/25.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var password: String
    @Binding var shouldValidate: Bool
    @State private var isSecure: Bool = true
    @State private var errorMessage: String?

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "lock")
                    .padding(.horizontal, 5)
                    .foregroundStyle(.black.opacity(0.6))

                if isSecure {
                    SecureField(AppStrings.Authentication.password, text: $password)
                        .foregroundStyle(Color.appSecondary)
                } else {
                    TextField(AppStrings.Authentication.password, text: $password)
                        .foregroundStyle(Color.appSecondary)
                }

                Image(systemName: isSecure ? "eye" : "eye.slash")
                    .foregroundStyle(.black.opacity(0.6))
                    .onTapGesture {
                        isSecure.toggle()
                    }
            }
            .padding()
            .onChange(of: password) { oldValue, newValue in
                validateInput()
            }
            .onChange(of: shouldValidate, { oldValue, newValue in
                if newValue {
                    validateInput()
                }
            })
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(errorMessage == nil ? Color.appSecondary : Color.red, lineWidth: 1)
            }

            if let error = errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding(.leading)
            }
        }
    }

    private func validateInput() {
        if let error = TextFieldValidator.validatePassword(password) {
            errorMessage = error.message
        } else {
            errorMessage = nil
        }
    }
}
