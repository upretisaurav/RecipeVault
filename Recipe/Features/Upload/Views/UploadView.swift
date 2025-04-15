//
//  UploadView.swift
//  Recipe
//
//  Created by saurav upreti on 4/11/25.
//

import SwiftData
import SwiftUI

struct UploadView: View {
    @State var navigateToRecipeBasicView: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Recipe.foodName) private var recipes: [Recipe]
    typealias SaveSuccessAction = () -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(AppStrings.Upload.myCookbooks)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Spacer()

                Button {
                    navigateToRecipeBasicView = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                }
            }
            .padding()
            if recipes.isEmpty {
                ContentUnavailableView(
                    AppStrings.Upload.noRecipeYet,
                    systemImage: "book.closed",
                    description: Text(AppStrings.Upload.tapToAddRecipe)
                )
            } else {
                List {
                    ForEach(recipes) { recipe in
                        RecipeRowView(recipe: recipe)  
                            .listRowInsets(
                                EdgeInsets(
                                    top: 8, leading: 16, bottom: 8, trailing: 16
                                )
                            )  
                            .listRowSeparator(.hidden)  
                            .listRowBackground(Color.clear)  
                    }
                }
                .listStyle(.plain)  
                .background(Color(UIColor.systemGroupedBackground))  
                .padding(.top, -8)  
            }
        }
        .navigationDestination(isPresented: $navigateToRecipeBasicView) {
            RecipeBasicInfoView(onSaveSuccess: {
                    navigateToRecipeBasicView = false 
                })
        }
    }
}

struct RecipeRowView: View {
    let recipe: Recipe

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(recipe.foodName)
                .font(.headline)
                .foregroundColor(.primary)  

            Text(recipe.desc)
                .font(.subheadline)
                .foregroundColor(.secondary)  
                .lineLimit(2)

            
            Text("Duration: \(recipe.duration) min")
                .font(.caption)
                .foregroundColor(.orange)  
                .padding(.top, 2)
        }
        .padding()  
        .frame(maxWidth: .infinity, alignment: .leading)  
        .background(Color(UIColor.secondarySystemGroupedBackground))  
        .clipShape(RoundedRectangle(cornerRadius: 10))  
        
        
    }
}

#Preview {
    UploadView()
}
