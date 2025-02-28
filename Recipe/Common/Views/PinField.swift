//
//  PinField.swift
//  Recipe
//
//  Created by saurav upreti on 2/26/25.
//

import SwiftUI
import Combine

struct PinField: View {
    @Binding var digit: String
    var isFocused: Bool
    var onEditingChanged: (Bool) -> Void
    var onCommit: () -> Void
    var onDigitChange: (String) -> Void

    var body: some View {
        TextField("", text: $digit)
            .keyboardType(.numberPad)
            .textContentType(.oneTimeCode)
            .multilineTextAlignment(.center)
            .font(.system(size: 32, weight: .semibold))
            .frame(width: 70, height: 70)
            .background(Color.white)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(isFocused ? Color.green : Color.gray.opacity(0.3),
                            lineWidth: isFocused ? 2 : 1)
            )
            .onChange(of: digit) {oldValue, newValue in
                onDigitChange(newValue)
            }
            .onReceive(Just(digit)) { _ in
                if digit.count > 1 {
                    digit = String(digit.prefix(1))
                }
            }
    }
}
