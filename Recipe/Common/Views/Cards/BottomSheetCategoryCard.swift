//
//  BottomSheetCategoryCard.swift
//  Recipe
//
//  Created by saurav upreti on 3/10/25.
//

import SwiftUI

struct BottomSheetCategoryCard: View {
    let imageName: String
    let cardName: String

    var body: some View {
        VStack(spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 15))

            Text(cardName)
                .font(.headline)
                .foregroundColor(.black)
        }
        .frame(width: 140, height: 180)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 3)
    }
}
