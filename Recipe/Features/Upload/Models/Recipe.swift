//
//  Recipe.swift
//  Recipe
//
//  Created by saurav upreti on 4/14/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Recipe {
    var imageName: String
    var foodName: String
    var desc: String
    var duration: Int
    var ingredients: [String]
    var note: String

    init(imageName: String, foodName: String, description: String, duration: Int, ingredients: [String], note: String) {
        self.imageName = imageName
        self.foodName = foodName
        self.desc = description
        self.duration = duration
        self.ingredients = ingredients
        self.note = note
    }
}
