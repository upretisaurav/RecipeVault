//
//  UploadView.swift
//  Recipe
//
//  Created by saurav upreti on 2/27/25.
//

import SwiftUI

struct UploadView: View {
    @State private var foodName: String = ""
    @State private var description: String = ""
    @State private var sliderValue: Double = 30

    var body: some View {
        NavigationStack {
            Text("")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(
                            action: {},
                            label: {
                                Text(AppStrings.Upload.cancel)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.appRed)
                            })
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Text("1/2")
                            .foregroundStyle(Color.appMain)
                    }
                })
                .padding(.bottom, Constants.itemMediumBottomPadding)

            ZStack {
                DottedRoundedRectangle()
                    .frame(width: .infinity, height: 200)

                VStack {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .foregroundStyle(Color.appSecondary)
                        .padding(.bottom, Constants.itemMediumBottomPadding)

                    Text(AppStrings.Upload.addCoverPhoto)
                        .font(.titleSmall)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.appMain)
                        .padding(.bottom, Constants.itemSmallBottomPadding)

                    Text(AppStrings.Upload.uptoTwelveMb)
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundStyle(Color.appSecondary)
                }

            }
            .padding(.bottom, Constants.itemMediumBottomPadding)

            RecipeFormReusableTextField(
                text: $foodName, label: AppStrings.Upload.foodName,
                placeholder: AppStrings.Upload.enterFoodName)

            RecipeFormReusableTextField(
                text: $description, label: AppStrings.Upload.description,
                placeholder: AppStrings.Upload.enterDescription, isMultiline: true)

            SliderWithLabels(sliderValue: $sliderValue)

            AppButton(
                title: "Next", backgroundColor: Color.appGreen, action: {})

            Spacer()

        }
        .padding(.horizontal, Constants.horizontalPadding)

    }
}

#Preview {
    UploadView()
}
