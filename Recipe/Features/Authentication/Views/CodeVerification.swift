//
//  CodeVerification.swift
//  Recipe
//
//  Created by saurav upreti on 2/26/25.
//

import SwiftUI

struct CodeVerification: View {
    @State private var codeDigits: [String] = Array(repeating: "", count: 4)
    @FocusState private var focusedField: Int?
    var body: some View {
        VStack {
            Text(AppStrings.Authentication.checkYourEmail)
                .font(.titleMedium)
                .foregroundStyle(Color.appMain)
                .padding(.bottom, 5)

            Text(AppStrings.Authentication.sentTheCodeToYourEmail)
                .foregroundStyle(Color.appSecondary)
                .padding(.bottom, 40)

            HStack(spacing: 12) {
                ForEach(0..<4, id: \.self) { index in
                    PinField(
                        digit: $codeDigits[index],
                        isFocused: focusedField == index,
                        onEditingChanged: { isEditing in
                            if isEditing {
                                focusedField = index
                            }
                        },
                        onCommit: {},
                        onDigitChange: { newValue in
                            handleInput(index: index, newValue: newValue)
                        }
                    )
                    .focused($focusedField, equals: index)
                }
            }
            .padding(.bottom, 50)

            HStack {
                Text(AppStrings.Authentication.codeExpiresIn)
                Text("03:23") // TODO: Implement Timer 
                    .foregroundStyle(Color.red)
            }
            .padding(.bottom, 40)

            AppButton(title: AppStrings.Authentication.verify, backgroundColor: Color.appGreen, action: {})
                .padding(.bottom, 20)

            AppSecondaryButton(action: {}, btnName: AppStrings.Authentication.sendAgain)


        }
        .padding([.vertical, .horizontal], 20)
        Spacer()
            .onAppear {
                focusedField = 0
            }
    }

    private func handleInput(index: Int, newValue: String) {
        if newValue.count == 1 && index < codeDigits.count - 1 {
            focusedField = index + 1
        }

        if newValue.isEmpty && index > 0 {
            focusedField = index - 1
        }

        if index == codeDigits.count - 1 && newValue.count == 1 {
            focusedField = nil
        }
    }

    func getVerificationCode() -> String {
        return codeDigits.joined()
    }
}

#Preview {
    CodeVerification()
}
