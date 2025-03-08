//
//  DotGridView.swift
//  Recipe
//
//  Created by saurav upreti on 3/6/25.
//

import SwiftUI

struct DotGridView: View {
    var body: some View {
        Grid(horizontalSpacing: 5, verticalSpacing: 5) {
            GridRow {
                DotView()
                DotView()
            }
            GridRow {
                DotView()
                DotView()
            }
            GridRow {
                DotView()
                DotView()
            }
        }
    }
}


struct DotView: View {
    var body: some View {
        Circle()
            .fill(Color(.systemGray4))
            .frame(width: 5, height: 5)
    }
}

#Preview {
    DotGridView()
}
