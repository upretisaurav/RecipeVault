//
//  BottomSheetView.swift
//  Recipe
//
//  Created by saurav upreti on 3/10/25.
//

import SwiftUI

struct BottomSheetView: View {
    @Binding var showingCard: Bool

    var body: some View {
        VStack(spacing: Constants.itemMediumBottomPadding) {
            HStack {
                Button(action: {
                    showingCard = false
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding(Constants.itemSmallBottomPadding)
                }
                Spacer()
                Text(AppStrings.BottomSheetContent.chooseOption)
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()

                Image(systemName: "xmark")
                    .opacity(0)
                    .padding(Constants.itemSmallBottomPadding)
            }
            .padding(.horizontal)

            HStack(spacing: Constants.horizontalPadding) {
                BottomSheetCategoryCard(imageName: "food2", cardName: AppStrings.BottomSheetContent.food)
                BottomSheetCategoryCard(imageName: "ingredient", cardName: AppStrings.BottomSheetContent.Ingredient)
            }
            .padding(.horizontal, Constants.horizontalPadding)

            Spacer()
        }
        .padding(.vertical, Constants.verticalPadding)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
