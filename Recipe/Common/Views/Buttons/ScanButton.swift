//
//  ScanButton.swift
//  Recipe
//
//  Created by saurav upreti on 2/27/25.
//

import SwiftUI

struct ScanButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .foregroundColor(.appGreen)
                    .frame(width: 60, height: 60)
                    .shadow(radius: 2)

                Image(systemName: "qrcode.viewfinder")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }
        }
        .offset(y: -20)
    }
}
