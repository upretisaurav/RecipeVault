//
//  DottedRectangle.swift
//  Recipe
//
//  Created by saurav upreti on 3/5/25.
//

import SwiftUI

struct DottedRoundedRectangle: View {
    let cornerRadius: CGFloat
    let dashPattern: [CGFloat]
    let lineWidth: CGFloat
    let color: Color

    init(cornerRadius: CGFloat = 10, dashPattern: [CGFloat] = [4, 4], lineWidth: CGFloat = 2, color: Color = .gray) {
        self.cornerRadius = cornerRadius
        self.dashPattern = dashPattern
        self.lineWidth = lineWidth
        self.color = color
    }

    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(style: StrokeStyle(lineWidth: lineWidth, dash: dashPattern))
            .foregroundColor(Color.appSecondary)
    }
}

