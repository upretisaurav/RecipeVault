//
//  Home.swift
//  Recipe
//
//  Created by saurav upreti on 2/27/25.
//

import SwiftUI

struct HomeView: View {
    @State private var search: String = ""
    @State private var selectedCategory: RecipeCategory = .all
    @State private var selectedTab: Int = 0

    private var gridItemWidth: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let padding: CGFloat = 40
        let spacing: CGFloat = 15
        return (screenWidth - padding - spacing) / 2
    }

    var body: some View {
        VStack {
            TextField(AppStrings.Home.search, text: $search)
                .padding()
                .disabled(true)
                .background(
                    
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color.appGrey)
                )
                .padding([.top, .bottom], 24)

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
                                    withAnimation(.easeInOut(duration: 0.2)) {
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
