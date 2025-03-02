//
//  RecipeCard.swift
//  Recipe
//
//  Created by saurav upreti on 2/28/25.
//

import SwiftUI

struct RecipeCard: View {
    @State private var isFavorite: Bool = false
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("potrait")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(.circle)
                    .padding(.horizontal, 10)

                Text("Ram Krishna")
                    .font(.caption)
            }
            .padding(.bottom, 10)

            ZStack(alignment: .topTrailing) {
                Image("pancake")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .padding(.bottom, 10)

                GlassMorphicButton(iconName: isFavorite ? "heart.fill" : "heart", size: 50)
                    .padding([.top, .trailing], 10)
                    .scaleEffect(animationAmount)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5), value: 2)
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

            Text("Pancake")
                .font(.custom("Inter", size: 18))
                .fontWeight(.semibold)
                .foregroundStyle(Color.appMain)
                .padding(.bottom, 5)

            HStack {
                Text("Food")
                    .font(.caption)
                    .foregroundStyle(Color.appSecondary)

                Text(">")
                    .font(.caption)
                    .foregroundStyle(Color.appSecondary)

                Text("20 mins")
                    .font(.caption)
                    .foregroundStyle(Color.appSecondary)
            }


        }
    }
}

#Preview {
    RecipeCard()
}
