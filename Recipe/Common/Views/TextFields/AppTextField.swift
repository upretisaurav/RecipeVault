//
//  AppTextField.swift
//  Recipe
//
//  Created by saurav upreti on 2/23/25.
//

import SwiftUI

struct AppTextField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    @Binding var shouldValidate: Bool
    @State private var errorMessage: String?
    var validator: ((String) -> TextFieldError?)?

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .padding(.horizontal, 5)
                    .foregroundStyle(.black.opacity(0.6))

                TextField(placeholder, text: $text)
                    .foregroundStyle(Color.appSecondary)
                    .onChange(of: text) { oldValue, newValue in
                        validateInput()
                    }
                    .onChange(
                        of: shouldValidate,
                        { oldValue, newValue in
                            if newValue {
                                validateInput()
                            }

                        })
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(
                        errorMessage == nil ? Color.appSecondary : Color.red,
                        lineWidth: 1)
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
        if let validator = validator {
            errorMessage = validator(text)?.message
        }
    }
}
