//
//  CustomTabBar.swift
//  Recipe
//
//  Created by saurav upreti on 2/27/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(imageName: "house.fill", title: "Home", isSelected: selectedTab == 0) {
                selectedTab = 0
            }

            TabBarButton(imageName: "pencil.line", title: "Upload", isSelected: selectedTab == 1) {
                selectedTab = 1
            }

            ScanButton {
                print("Scan button tapped")
            }

            TabBarButton(imageName: "bell.fill", title: "Notification", isSelected: selectedTab == 3) {
                selectedTab = 3
            }

            TabBarButton(imageName: "person.fill", title: "Profile", isSelected: selectedTab == 4) {
                selectedTab = 4
            }
        }
        .frame(height: 70)
        .background(Color.white)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray.opacity(0.3)),
            alignment: .top
        )
    }
}

