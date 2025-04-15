//
//  RecipeApp.swift
//  Recipe
//
//  Created by saurav upreti on 2/21/25.
//

import SwiftUI
import SwiftData

@main
struct RecipeApp: App {
    let modelContainer: ModelContainer

    init() {
        do {
            modelContainer = try ModelContainer(for: User.self, Recipe.self)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .modelContainer(modelContainer)
        }
    }
}
