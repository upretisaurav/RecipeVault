//
//  RecipeDetailsView.swift
//  Recipe
//
//  Created by saurav upreti on 3/6/25.
//

import SwiftUI

struct RecipeDetailsView: View {
    @ObservedObject var viewModel: UploadViewModel
    @State private var showDialog: Bool = false
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    let onSaveSuccess: UploadView.SaveSuccessAction

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
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
                                Text("2/2")
                                    .foregroundStyle(Color.appMain)
                            }
                        })
                        .padding(.bottom, Constants.itemMediumBottomPadding)

                    Text(AppStrings.Upload.ingredients)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.appMain)
                        .padding(.bottom, Constants.itemSmallBottomPadding)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    ForEach(0..<viewModel.ingredients.count, id: \.self) {
                        index in
                        HStack {
                            DotGridView()

                            RecipeFormReusableTextField(
                                text: $viewModel.ingredients[index], label: "",
                                placeholder: AppStrings.Upload.enterIngredients,
                                containsLabel: false)
                        }
                    }

                    Button(
                        action: {
                            viewModel.ingredients.append("")
                        },
                        label: {
                            Text(AppStrings.Upload.addIngredients)
                                .foregroundStyle(Color.appMain)
                        }
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .stroke(Color.appSecondary, lineWidth: 1)
                    }
                    .padding(
                        [.top, .bottom], Constants.itemMediumBottomPadding)

                    Rectangle()
                        .foregroundStyle(Color.appGrey)
                        .frame(height: Constants.rectangleSeperatorHeight)
                        .padding(.horizontal, -Constants.horizontalPadding)
                        .padding(.bottom, Constants.itemMediumBottomPadding)

                    Text(AppStrings.Upload.note)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.appMain)
                        .padding(.bottom, Constants.itemMediumBottomPadding)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    HStack(alignment: .top) {
                        VStack {
                            RoundedRectangle(
                                cornerRadius: Constants.cornerRadius * 2
                            )
                            .foregroundStyle(Color.appMain)
                            .frame(width: 30, height: 30)
                            .overlay {
                                Text("1")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundStyle(Color.white)
                            }
                            .padding(.bottom, Constants.itemSmallBottomPadding)

                            DotGridView()
                        }
                        .padding(.trailing, Constants.horizontalPadding)

                        VStack {
                            RecipeFormReusableTextField(
                                text: $viewModel.note, label: "",
                                placeholder: AppStrings.Upload
                                    .tellALittleAboutFood,
                                isMultiline: true, containsLabel: false)
                        }
                    }
                    .padding(.bottom, Constants.itemMediumBottomPadding)

                    Spacer()

                    AppButton(
                        title: viewModel.isSaving
                            ? "Saving..." : AppStrings.Common.done,
                        backgroundColor: viewModel.isSaving
                            ? Color.appSecondary : Color.appGreen,
                        action: {

                            viewModel.saveRecipe(modelContext: modelContext)
                        }
                    )
                    .disabled(viewModel.isSaving)
                }
                .padding(.horizontal, Constants.horizontalPadding)

                if showDialog {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showDialog = false
                        }

                    UploadSuccessAlert(
                        title: AppStrings.Upload.uploadSuccess,
                        message: AppStrings.Upload.yourRecipeHasBeenUploaded,
                        buttonText: AppStrings.Upload.backToHome,
                        onDismiss: { showDialog = false }
                    )
                }
            }

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .alert(
            AppStrings.Upload.missingInformation,
            isPresented: .constant(viewModel.validationError != nil),
            presenting: viewModel.validationError,
            actions: { _ in
                Button("OK") {
                    viewModel.validationError = nil
                }
            },
            message: { error in
                Text(error.localizedDescription)
            }
        )
        .alert(
            AppStrings.Upload.uploadSuccess,
            isPresented: $viewModel.showSuccessAlert,
            actions: {
                Button(AppStrings.Upload.backToHome) {
                    onSaveSuccess()
                }
            },
            message: {
                Text(AppStrings.Upload.yourRecipeHasBeenUploaded)
            }
        )

    }

}
