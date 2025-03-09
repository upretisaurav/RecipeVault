//
//  RecipeDetailsView.swift
//  Recipe
//
//  Created by saurav upreti on 3/6/25.
//

import SwiftUI

struct RecipeDetailsView: View {
    @State private var ingredientsFields: [String] = ["", ""]
    @State private var foodDesc: String = ""

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
                        Text("2/2")
                            .foregroundStyle(Color.appMain)
                    }
                })
                .padding(.bottom, Constants.itemMediumBottomPadding)

            Text(AppStrings.Upload.ingredients)
                .fontWeight(.semibold)
                .foregroundStyle(Color.appMain)
                .padding(.bottom, Constants.itemSmallBottomPadding)
                .frame(maxWidth: .infinity, alignment: .leading)

            ForEach(0..<ingredientsFields.count, id: \.self) { index in
                HStack {
                    DotGridView()

                    RecipeFormReusableTextField(
                        text: $ingredientsFields[index], label: "",
                        placeholder: AppStrings.Upload.enterIngredients, containsLabel: false)
                }
            }

            Button(
                action: {
                    ingredientsFields.append("")
                },
                label: {
                    Text(AppStrings.Upload.addIngredients)
                        .foregroundStyle(Color.appMain)
                }
            )
            .frame(maxWidth: .infinity)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.appSecondary, lineWidth: 1)
            }
            .padding([.top, .bottom], 20)

            Rectangle()
                .foregroundStyle(Color.appGrey)
                .frame(height: Constants.rectangleSeperatorHeight)
                .padding(.horizontal, -Constants.horizontalPadding)
                .padding(.bottom, Constants.itemMediumBottomPadding)

            Text(AppStrings.Upload.steps)
                .fontWeight(.semibold)
                .foregroundStyle(Color.appMain)
                .padding(.bottom, Constants.itemMediumBottomPadding)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(alignment: .top) {
                VStack {
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundStyle(Color.appMain)
                        .frame(width: 30, height: 30)
                        .overlay {
                            Text("1")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(Color.white)
                        }
                        .padding(.bottom, Constants.itemSmallBottomPadding)

                    DotGridView()
                }
                .padding(.trailing, Constants.horizontalPadding)

                VStack {
                    RecipeFormReusableTextField(
                        text: $foodDesc, label: "",
                        placeholder: AppStrings.Upload.tellALittleAboutFood,
                        isMultiline: true, containsLabel: false)

                    Button(
                        action: {},
                        label: {
                            Image(systemName: "camera")
                        }
                    )
                    .padding()
                    .foregroundStyle(Color.black)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.appGrey)
                    )
                }
            }
            .padding(.bottom, Constants.itemMediumBottomPadding)

            Spacer()

            HStack {
                AppButton(
                    title: AppStrings.Common.done, backgroundColor: Color.appSecondary,
                    action: {}
                )
                .padding(.trailing, Constants.itemSmallBottomPadding)

                AppButton(
                    title: AppStrings.Common.next, backgroundColor: Color.appGreen, action: {})
            }

            Spacer()
        }
        .padding(.horizontal, Constants.horizontalPadding)

    }

}

#Preview {
    RecipeDetailsView()
}
