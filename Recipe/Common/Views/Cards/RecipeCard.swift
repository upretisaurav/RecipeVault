//
//  RecipeCard.swift
//  Recipe
//
//  Created by saurav upreti on 2/28/25.
//

import SwiftUI

struct RecipeCard: View {
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

            ZStack {
                Image("pancake")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .padding(.bottom, 10)

                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 35, height: 35)
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
