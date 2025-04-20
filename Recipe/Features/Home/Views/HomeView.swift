//
//  Home.swift
//  Recipe
//
//  Created by saurav upreti on 2/27/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCategory: RecipeCategory = .all
    @State private var filterCategory: RecipeCategory = .all
    @State private var sliderValue: Double = 30
    @State private var selectedTab: Int = 0
    @State private var showingSheet = false
    @State var navigateToSearch: Bool = false

    private var gridItemWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return
            (screenWidth - Constants.gridItemPadding - Constants.gridItemSpacing)
            / 2
    }

    var body: some View {

        VStack {
            HStack {
                Button(action: {
                    navigateToSearch = true
                }) {
                    HStack {
                        Text(AppStrings.Home.search)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(
                            cornerRadius: Constants.cornerRadius
                        )
                        .fill(Color.appGrey)
                    )
                    .frame(maxWidth: .infinity)
                }
                .padding([.top, .bottom], Constants.verticalPadding)

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

            Text(AppStrings.Home.category)
                .font(.titleSmall)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, Constants.itemSmallBottomPadding)

            ScrollView(
                .horizontal, showsIndicators: false,
                content: {
                    HStack {
                        ForEach(RecipeCategory.allCases) { category in
                            CategoryButton(
                                buttonText: category.rawValue,
                                isSelected: selectedCategory == category,
                                buttonAction: {
                                    withAnimation(
                                        .easeInOut(
                                            duration: Constants
                                                .animationDuration)
                                    ) {
                                        selectedCategory = category
                                    }
                                })

                        }
                    }
                }
            )
            .frame(maxWidth: .infinity, alignment: .leading)

            Rectangle()
                .foregroundStyle(Color.appGrey)
                .frame(height: Constants.rectangleSeperatorHeight)
                .padding(.horizontal, -Constants.horizontalPadding)

            VStack(spacing: 0) {
                TabSelector(selectedTab: $selectedTab)
                    .padding(.top)

                if selectedTab == 0 {
                    RecipeContent(itemGridWidth: gridItemWidth)
                } else {
                    FavoriteContent()
                }
            }

            Spacer()
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .navigationDestination(isPresented: $navigateToSearch) {
            SearchView()
        }
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
                                withAnimation(
                                    .easeInOut(
                                        duration: Constants.animationDuration)
                                ) {
                                    filterCategory = category
                                }
                            }
                        )
                    }
                }
            }
            .padding(.bottom, Constants.itemSmallBottomPadding)

            SliderWithLabels(sliderValue: $sliderValue)
        }
    }

}

struct RecipeContent: View {
    let itemGridWidth: CGFloat
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0...6, id: \.self) { index in
                    RecipeCard(
                        imageSize: itemGridWidth - Constants.horizontalPadding)
                }
            }
        }
    }
}

struct FavoriteContent: View {
    var body: some View {
        VStack {
            Image(systemName: "heart.slash")
                .font(.system(size: 50))
                .foregroundColor(.gray)
                .padding()

            Text(AppStrings.Home.noFavYet)
                .font(.headline)
                .foregroundColor(.gray)

            Text(AppStrings.Home.addFavByTappingHeartIcon)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 50)
    }
}

struct TabSelector: View {
    @Binding var selectedTab: Int
    let tabs = ["Recipes", "Favorites"]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Button(action: {
                        withAnimation(
                            .easeInOut(duration: Constants.tabAnimationDuration)
                        ) {
                            selectedTab = index
                        }
                    }) {
                        Text(tabs[index])
                            .fontWeight(
                                selectedTab == index ? .semibold : .regular
                            )
                            .foregroundColor(
                                selectedTab == index ? .primary : .gray
                            )
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, Constants.itemMediumBottomPadding)
                            .overlay(
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(
                                        width: Constants.tabIndicatorWidth,
                                        height: Constants.tabIndicatorHeight
                                    )
                                    .offset(y: Constants.tabIndicatorOffset)
                                    .opacity(selectedTab == index ? 1 : 0)
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
