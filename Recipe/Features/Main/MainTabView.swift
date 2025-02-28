//
//  MainTabView.swift
//  Recipe
//
//  Created by saurav upreti on 2/27/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                    .ignoresSafeArea(.all, edges: .bottom)

                UploadView()
                    .tag(1)
                    .ignoresSafeArea(.all, edges: .bottom)

                Color.clear
                    .tag(2)
                    .ignoresSafeArea(.all, edges: .bottom)

                NotificationView()
                    .tag(3)
                    .ignoresSafeArea(.all, edges: .bottom)

                ProfileView()
                    .tag(4)
                    .ignoresSafeArea(.all, edges: .bottom)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    MainTabView()
}
