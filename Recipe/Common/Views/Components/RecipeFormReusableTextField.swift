//
//  SimpleTextFieldView.swift
//  Recipe
//
//  Created by saurav upreti on 3/6/25.
//

import SwiftUI

struct RecipeFormReusableTextField: View {
    @Binding var text: String
    var label: String
    var placeholder: String
    var isMultiline: Bool = false
    var containsLabel: Bool = true

    var body: some View {
        VStack(alignment: .leading) {
            if containsLabel {
                Text(label)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.appMain)
                    .padding(.bottom, Constants.itemSmallBottomPadding)
            }

            if isMultiline {
                TextField(placeholder, text: $text, axis: .vertical)
                    .padding([.vertical, .horizontal], 30)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.appSecondary, lineWidth: 1)
                    }
            } else {
                TextField(placeholder, text: $text)
                    .padding()
                    .overlay {
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.appSecondary, lineWidth: 1)
                    }
            }
        }
        .padding(.bottom, containsLabel ? Constants.itemMediumBottomPadding : Constants.itemSmallBottomPadding)
    }
}

