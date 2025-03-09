//
//  CookingSlider.swift
//  Recipe
//
//  Created by saurav upreti on 3/6/25.
//

import SwiftUI

struct SliderWithLabels: View {
    @Binding var sliderValue: Double

    var body: some View {
        VStack {
            HStack {
                Text(AppStrings.Home.cookingDuration)
                    .font(.titleSmall)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.appMain)

                Text(AppStrings.Home.inMinutes)
                    .font(.titleSmall)
                    .fontWeight(.regular)
                    .foregroundStyle(Color.appSecondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, Constants.itemMediumBottomPadding)
            
            HStack {
                Text("<10")
                    .foregroundStyle(
                        sliderValue < 15 ? Color.appGreen : Color.appSecondary
                    )
                    .fontWeight(.semibold)
                Spacer()
                Text("30")
                    .foregroundStyle(
                        sliderValue > 15 && sliderValue < 45
                            ? Color.appGreen : Color.appSecondary
                    )
                    .fontWeight(.semibold)
                Spacer()
                Text(">60")
                    .foregroundStyle(
                        sliderValue > 45 ? Color.appGreen : Color.appSecondary
                    )
                    .fontWeight(.semibold)
            }

            Slider(
                value: $sliderValue,
                in: Constants.sliderMinValue...Constants.sliderMaxValue,
                step: Constants.sliderStep
            )
            .tint(Color.appGreen)
            .padding(.horizontal)
            .padding(.bottom, Constants.itemMediumBottomPadding)
        }
    }
}
