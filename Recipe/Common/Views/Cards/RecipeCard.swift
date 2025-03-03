//
//  RecipeCard.swift
//  Recipe
//
//  Created by saurav upreti on 2/28/25.
//

import SwiftUI

struct RecipeCard: View {
    let authorName: String
    let authorImage: String
    let recipeImage: String
    let recipeName: String
    let category: String
    let cookingTime: String

    @State private var isFavorite: Bool = false
    @State private var animationAmount: CGFloat = 1

    var imageSize: CGFloat = 150

    init(
        authorName: String = "Ram Krishna",
        authorImage: String = "potrait",
        recipeImage: String = "pancake",
        recipeName: String = "Pancake",
        category: String = "Food",
        cookingTime: String = "20 mins",
        imageSize: CGFloat = 150,
        isFavorite: Bool = false
    ) {
        self.authorName = authorName
        self.authorImage = authorImage
        self.recipeImage = recipeImage
        self.recipeName = recipeName
        self.category = category
        self.cookingTime = cookingTime
        self.imageSize = imageSize
        self._isFavorite = State(initialValue: isFavorite)
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(authorImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
                    .padding(.horizontal, 5)

                Text(authorName)
                    .font(.caption)
            }
            .padding(.bottom, 5)

            ZStack(alignment: .topTrailing) {
                Image(recipeImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageSize, height: imageSize)
                    .cornerRadius(15)
                    .padding(.bottom, 5)

                GlassMorphicButton(iconName: isFavorite ? "heart.fill" : "heart", size: 40)
                    .padding([.top, .trailing], 5)
                    .scaleEffect(animationAmount)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5), value: animationAmount)
                    .onTapGesture {
                        animationAmount = 1.3

                        withAnimation(.easeInOut(duration: 0.2)) {
                            isFavorite.toggle()
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            animationAmount = 1
                        }
                    }
            }

            Text(recipeName)
                .font(.custom("Inter", size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(Color.appMain)
                .padding(.bottom, 2)

            HStack {
                Text(category)
                    .font(.caption)
                    .foregroundStyle(Color.appSecondary)

                Text(">")
                    .font(.caption)
                    .foregroundStyle(Color.appSecondary)

                Text(cookingTime)
                    .font(.caption)
                    .foregroundStyle(Color.appSecondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    RecipeCard()
}
