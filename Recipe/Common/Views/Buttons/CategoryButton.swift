//
//  CategoryButton.swift
//  Recipe
//
//  Created by saurav upreti on 2/28/25.
//

import SwiftUI

enum RecipeCategory: String, CaseIterable, Identifiable {
    case all = "ALL"
    case food = "Food"
    case drink = "Drink"

    var id: String {self.rawValue}
}

struct CategoryButton: View {
     let buttonText: String
     let isSelected: Bool
     let buttonAction: () -> Void

    var body: some View {
        Button(action: buttonAction, label: {
            Text(buttonText)
                .font(Font.system(size: 20))
                .foregroundStyle(isSelected ? Color.white : Color.black.opacity(0.7))
                .padding(.horizontal, 25)
                .padding(.vertical, 15)
                .background {
                    RoundedRectangle(cornerRadius: 40)
                        .fill(isSelected ? Color.appGreen : Color.appGrey)
                }
        })
        .buttonStyle(PlainButtonStyle())
    }
}
