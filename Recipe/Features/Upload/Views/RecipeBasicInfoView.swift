//
//  RecipeBasicInfoView.swift
//  Recipe
//
//  Created by saurav upreti on 2/27/25.
//

import PhotosUI
import SwiftUI

struct RecipeBasicInfoView: View {
    let onSaveSuccess: UploadView.SaveSuccessAction

    @StateObject private var viewModel = UploadViewModel()
    @State private var navigateToDetails = false
    @Environment(\.dismiss) var dismiss
    @State private var isPresentingPhotoPicker = false

    var body: some View {
        NavigationStack {
            Text("")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(
                            action: {
                                dismiss()
                            },
                            label: {
                                Text(AppStrings.Upload.cancel)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.appRed)
                            })
                    }

                    ToolbarItem(placement: .topBarTrailing) {
                        Text("1/2")
                            .foregroundStyle(Color.appMain)
                    }
                })
                .padding(.bottom, Constants.itemMediumBottomPadding)

            ZStack {
                GeometryReader { geometry in
                    DottedRoundedRectangle()
                        .frame(width: geometry.size.width, height: 200)
                }

                if(viewModel.imageName.isEmpty){
                    VStack {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                            .foregroundStyle(Color.appSecondary)
                            .padding(.bottom, Constants.itemMediumBottomPadding)

                        Text(AppStrings.Upload.addCoverPhoto)
                            .font(.titleSmall)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.appMain)
                            .padding(.bottom, Constants.itemSmallBottomPadding)

                        Text(AppStrings.Upload.uptoTwelveMb)
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundStyle(Color.appSecondary)
                    }
                } else {
                    if let image = viewModel.selectedImage {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .padding(.bottom, Constants.itemMediumBottomPadding)
            .onTapGesture {
                isPresentingPhotoPicker = true
            }
            .photosPicker(
                isPresented: $isPresentingPhotoPicker,
                selection: $viewModel.imageSelection, maxSelectionCount: 1,
                matching: .images
            )

            RecipeFormReusableTextField(
                text: $viewModel.foodName, label: AppStrings.Upload.foodName,
                placeholder: AppStrings.Upload.enterFoodName)

            RecipeFormReusableTextField(
                text: $viewModel.desc, label: AppStrings.Upload.description,
                placeholder: AppStrings.Upload.enterDescription,
                isMultiline: true)

            SliderWithLabels(sliderValue: $viewModel.duration)

            AppButton(
                title: "Next", backgroundColor: Color.appGreen,
                action: {
                    navigateToDetails = true
                })

            Spacer()

        }
        .padding(.horizontal, Constants.horizontalPadding)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(
            isPresented: $navigateToDetails,
            destination: {
                RecipeDetailsView(viewModel: viewModel, onSaveSuccess: onSaveSuccess)
            })
    }
}
