//
//  SearchView.swift
//  Recipe
//
//  Created by saurav upreti on 3/3/25.
//

import SwiftUI

struct SearchView: View {
    @State private var search: String = ""
    @Binding var navigationPath: [NavigationRoute]
    @State private var showingSheet = false

    @State private var filterCategory: RecipeCategory = .all
    @State private var sliderValue: Double = 30

    var body: some View {
        VStack {
            HStack {
                Button(
                    action: {
                        navigationPath.removeLast()
                    },
                    label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color.appSecondary)
                            .padding(.trailing, 10)
                    })

                ZStack(alignment: .trailing) {
                    TextField(AppStrings.Home.search, text: $search)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                                .fill(Color.appGrey)
                        )
                        .padding([.top, .bottom], Constants.verticalPadding)
                        .padding(.trailing, Constants.itemSmallBottomPadding)

                    if !search.isEmpty {
                        Button(action: {
                            search = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.secondary)
                                .padding(.trailing, 25)
                        }
                    }
                }

                Button(
                    action: {
                        showingSheet = true
                    },
                    label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .foregroundStyle(Color.appSecondary)
                    }
                )
                .sheet(isPresented: $showingSheet) {
                    FilterSheet(
                        isPresented: $showingSheet,
                        title: AppStrings.Home.addAFilter,
                        onDone: {
                            showingSheet = false

                        },
                        onCancel: {
                            showingSheet = false
                        }
                    ) {
                        filterSheetContent
                    }
                }
            }

            Rectangle()
                .foregroundStyle(Color.appGrey)
                .frame(height: Constants.rectangleSeperatorHeight)
                .padding(.horizontal, -Constants.horizontalPadding)

            SearchHistoryItem(text: AppStrings.Search.calumLewis)
                .padding()

            SearchHistoryItem(text: AppStrings.Search.salad)
                .padding()

            Rectangle()
                .foregroundStyle(Color.appGrey)
                .frame(height: Constants.rectangleSeperatorHeight)
                .padding(.horizontal, -Constants.horizontalPadding)

            VStack(alignment: .leading) {
                Text(AppStrings.Search.searchSuggetions)
                    .font(.titleSmall)
                    .fontWeight(.bold)
                    .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                SuggestionButton(text: AppStrings.Search.sushi)
                SuggestionButton(text: AppStrings.Search.sandwich)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                SuggestionButton(text: AppStrings.Search.seafood)
                SuggestionButton(text: AppStrings.Search.friedRice)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .navigationBarBackButtonHidden(true)
    }

    private var filterSheetContent: some View {
        VStack {
            Text(AppStrings.Home.category)
                .font(.titleSmall)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, Constants.itemSmallBottomPadding)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(RecipeCategory.allCases) { category in
                        CategoryButton(
                            buttonText: category.rawValue,
                            isSelected: filterCategory == category,
                            buttonAction: {
                                withAnimation(.easeInOut(duration: Constants.animationDuration)) {
                                    filterCategory = category
                                }
                            }
                        )
                    }
                }
            }
            .padding(.bottom, Constants.itemSmallBottomPadding)

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

            Slider(value: $sliderValue, in: Constants.sliderMinValue...Constants.sliderMaxValue, step: Constants.sliderStep)
                .tint(Color.appGreen)
                .padding(.horizontal)
                .padding(.bottom, Constants.itemMediumBottomPadding)
        }
    }
}

struct SearchHistoryItem: View {
    let text: String

    var body: some View {
        HStack {
            Image(systemName: "clock")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.appSecondary)
                .frame(height: 20)
                .padding(.horizontal, 10)

            Text(text)
                .foregroundStyle(Color.appMain)
                .font(.titleSmall)

            Spacer()

            Image(systemName: "arrow.up.backward")
                .foregroundStyle(Color.appSecondary)
        }
    }
}

struct SuggestionButton: View {
    let text: String

    var body: some View {
        Text(text)
            .padding(.horizontal, Constants.horizontalPadding)
            .padding(.vertical, 10)
            .background(Capsule().fill(Color(.systemGray6)))
            .foregroundColor(.appSecondary)
    }
}
