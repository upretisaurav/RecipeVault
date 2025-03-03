//
//  SearchView.swift
//  Recipe
//
//  Created by saurav upreti on 3/3/25.
//

import SwiftUI

struct SearchView: View {
    @State private var search: String = ""
    @Binding var navigationPath: [String]

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
                            RoundedRectangle(cornerRadius: 50)
                                .fill(Color.appGrey)
                        )
                        .padding([.top, .bottom], 24)
                        .padding(.trailing, 10)

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
                    action: {},
                    label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .foregroundStyle(Color.appSecondary)
                    })
            }

            Rectangle()
                .foregroundStyle(Color.appGrey)
                .frame(height: 10)
                .padding(.horizontal, -20)

            SearchHistoryItem(text: AppStrings.Search.calumLewis)
                .padding()

            SearchHistoryItem(text: AppStrings.Search.salad)
                .padding()

            Rectangle()
                .foregroundStyle(Color.appGrey)
                .frame(height: 10)
                .padding(.horizontal, -20)

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
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
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
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Capsule().fill(Color(.systemGray6)))
            .foregroundColor(.appSecondary)
    }
}
