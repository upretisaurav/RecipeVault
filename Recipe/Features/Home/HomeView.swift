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

    var body: some View {
        VStack {
            TextField("Search", text: $search)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color.appGrey)
                )
                .padding([.top, .bottom], 24)

            Text("Category")
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
                    RecipeContent()
                } else {

                    RightTabContent()
                }
            }

            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct RecipeContent: View {
    var body: some View {
        RecipeCard()
    }
}

struct RightTabContent: View {
    var body: some View {
        Text("Hello, world!")
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
