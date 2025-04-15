//
//  UploadViewModel.swift
//  Recipe
//
//  Created by saurav upreti on 2/27/25.
//

import Foundation
import SwiftData
import SwiftUI
import _PhotosUI_SwiftUI

enum RecipeValidationError: LocalizedError {
    case missingImage
    case missingFoodName
    case missingDescription
    case noIngredients
    case missingNote
    case other(String)

    var errorDescription: String? {
        switch self {
        case .missingImage:
            return "Please select a cover image for your recipe."
        case .missingFoodName:
            return "Please enter a name for your recipe."
        case .missingDescription:
            return "Please enter a description for your recipe."
        case .noIngredients:

            return "Please add at least one valid ingredient."
        case .missingNote:
            return "Please add a note for your recipe."
        case .other(let message):
            return message
        }
    }
}

class UploadViewModel: ObservableObject {

    @Published var imageName: String = ""
    @Published var selectedImage: Image?
    @Published var foodName: String = ""
    @Published var desc: String = ""
    @Published var duration: Double = 30
    @Published var ingredients: [String] = ["", ""]
    @Published var note: String = ""

    @Published var imageSelection: [PhotosPickerItem] = [] {
        didSet {
            Task { @MainActor in
                guard let item = imageSelection.first else {
                    self.selectedImage = nil
                    self.imageName = ""
                    return
                }
                do {
                    let data = try await item.loadTransferable(type: Data.self)
                    guard let data, let uiImage = UIImage(data: data) else {
                        print("Failed to load image data.")
                        self.selectedImage = nil
                        self.imageName = ""
                        return
                    }
                    self.selectedImage = Image(uiImage: uiImage)
                    self.imageName =
                        item.itemIdentifier ?? UUID().uuidString + ".jpg"
                    print("Selected image name: \(self.imageName)")

                } catch {
                    print("Failed to load transferable: \(error)")
                    self.selectedImage = nil
                    self.imageName = ""
                }
            }
        }
    }

    @Published var validationError: RecipeValidationError? = nil
    @Published var isSaving: Bool = false
    @Published var showSuccessAlert: Bool = false

    private func validateRecipe() -> RecipeValidationError? {

        let trimmedFoodName = foodName.trimmingCharacters(
            in: .whitespacesAndNewlines)
        let trimmedDesc = desc.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedNote = note.trimmingCharacters(in: .whitespacesAndNewlines)
        let validIngredients =
            ingredients
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        guard !imageName.isEmpty else {
            return .missingImage
        }
        guard !trimmedFoodName.isEmpty else {
            return .missingFoodName
        }
        guard !trimmedDesc.isEmpty else {
            return .missingDescription
        }
        guard !validIngredients.isEmpty else {

            return .noIngredients
        }
        guard !trimmedNote.isEmpty else {
            return .missingNote
        }

        return nil
    }

    @MainActor
    func saveRecipe(modelContext: ModelContext) {
        isSaving = true
        validationError = nil

        if let error = validateRecipe() {
            validationError = error
            isSaving = false
            print("Validation failed: \(error.localizedDescription)")
            return
        }

        print("Validation successful. Proceeding to save...")

        let finalIngredients =
            ingredients
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        let recipe = Recipe(
            imageName: imageName,
            foodName: foodName.trimmingCharacters(in: .whitespacesAndNewlines),
            description: desc.trimmingCharacters(in: .whitespacesAndNewlines),
            duration: Int(duration),
            ingredients: finalIngredients,
            note: note.trimmingCharacters(in: .whitespacesAndNewlines)
        )

        modelContext.insert(recipe)
        print("Recipe inserted into ModelContext.")

        do {
            try modelContext.save()
            print("ModelContext saved successfully!")

            isSaving = false
            showSuccessAlert = true
            resetForm()
            print("Form reset after successful save.")

        } catch {

            print("Error saving ModelContext: \(error)")

            validationError = .other(
                "Failed to save recipe. Please try again. \(error.localizedDescription)"
            )
            isSaving = false

        }
    }

    @MainActor
    func resetForm() {
        imageName = ""
        selectedImage = nil
        foodName = ""
        desc = ""
        duration = 30
        ingredients = ["", ""]
        note = ""
        imageSelection = []
        validationError = nil
        isSaving = false

    }
}
