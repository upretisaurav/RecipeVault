//
//  FilterSheet.swift
//  Recipe
//
//  Created by saurav upreti on 3/4/25.
//

import SwiftUI

struct FilterSheet<Content: View>: View {
    @Binding var isPresented: Bool
    let title: String
    let content: Content
    let onDone: () -> Void
    let onCancel: () -> Void

    init(isPresented: Binding<Bool>, title: String, onDone: @escaping () -> Void, onCancel: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.title = title
        self.content = content()
        self.onDone = onDone
        self.onCancel = onCancel
    }

    var body: some View {
        VStack {
            Text(title)
                .font(.titleSmall)
                .fontWeight(.bold)
                .foregroundStyle(Color.appMain)
                .padding([.top, .bottom], 30)

            content
                .padding(.bottom, 20)

            HStack {
                AppButton(title: "Cancel", backgroundColor: Color.appSecondary, action: onCancel)
                Spacer()
                AppButton(title: "Done", backgroundColor: Color.appGreen, action: onDone)
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .presentationDetents([.medium])
        .presentationCornerRadius(40)
        .onDisappear(perform: {
            if isPresented {
                isPresented = false;
            }
        })
    }
}
