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
    @State private var navigationPath = [String]()
    @State private var showingSheet = false

    private var gridItemWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let padding: CGFloat = 40
        let spacing: CGFloat = 15
        return (screenWidth - padding - spacing) / 2
    }

    var body: some View {
        NavigationStack(path: $navigationPath) {

            VStack {
                HStack {
                    Button(action: {
                        navigationPath.append("search")
                    }) {
                        HStack {
                            Text(AppStrings.Home.search)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .fill(Color.appGrey)
                        )
                        .frame(maxWidth: .infinity)
                    }
                    .padding([.top, .bottom], 24)

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
                    .padding(.bottom, 10)

                ScrollView(
                    .horizontal, showsIndicators: false,
                    content: {
                        HStack {
                            ForEach(RecipeCategory.allCases) { category in
                                CategoryButton(
                                    buttonText: category.rawValue,
                                    isSelected: selectedCategory == category,
                                    buttonAction: {
                                        withAnimation(.easeInOut(duration: 0.2))
                                        {
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
                    .frame(height: 10)
                    .padding(.horizontal, -20)

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
            .padding(.horizontal, 20)
            .navigationDestination(for: String.self) { route in
                if route == "search" {
                    SearchView(navigationPath: $navigationPath)
                }
            }
        }
    }

    private var filterSheetContent: some View {
        VStack {
            Text(AppStrings.Home.category)
                .font(.titleSmall)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(RecipeCategory.allCases) { category in
                        CategoryButton(
                            buttonText: category.rawValue,
                            isSelected: filterCategory == category,
                            buttonAction: {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    filterCategory = category
                                }
                            }
                        )
                    }
                }
            }
            .padding(.bottom, 10)

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
            .padding(.bottom, 20)

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

            Slider(value: $sliderValue, in: 0...60, step: 1)
                .tint(Color.appGreen)
                .padding(.horizontal)
                .padding(.bottom, 20)
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
                    RecipeCard(imageSize: itemGridWidth - 20)
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
                        withAnimation(.easeInOut(duration: 0.3)) {
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
                            .padding(.bottom, 20)
                            .overlay(
                                Rectangle()
                                    .fill(Color.green)
                                    .frame(width: 60, height: 3)
                                    .offset(y: 4)
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
