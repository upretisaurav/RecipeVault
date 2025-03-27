//
//  OnboardingView.swift
//  Recipe
//
//  Created by saurav upreti on 2/21/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var navigateToSignIn: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("food")
                    .resizable()
                    .scaledToFit()

                Text(AppStrings.Onboarding.title)
                    .font(.titleMedium)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.appMain)
                    .slideInAnimation(delay: 0)

                Text(AppStrings.Onboarding.subTitle)
                    .font(.body)
                    .foregroundStyle(Color.appSecondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .slideInAnimation(delay: 0.2)

                HStack {
                    AppButton(
                        title: AppStrings.Onboarding.btnTitle,
                        backgroundColor: Color.appGreen, action: {
                            navigateToSignIn = true
                        })
                    .slideInAnimation(delay: 0.4)
                }
                .padding([.horizontal, .vertical])

                Spacer()
            }
            .navigationDestination(isPresented: $navigateToSignIn, destination: {
                SignInVIew(viewModel: SignInViewModel())
            })
        }

    }
}

#Preview {
    OnboardingView()
}
