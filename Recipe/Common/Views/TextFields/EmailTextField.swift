//
//  EmailTextField.swift
//  Recipe
//
//  Created by saurav upreti on 2/23/25.
//

import SwiftUI

struct EmailTextField: View {
    @Binding var email: String
    @Binding var shouldValidate: Bool

    var body: some View {
        AppTextField(
            icon: "envelope",
            placeholder: AppStrings.Authentication.email,
            text: $email,
            shouldValidate: $shouldValidate,
            validator: TextFieldValidator.validateEmail
        )
    }
}
