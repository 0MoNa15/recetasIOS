//
//  RecipeDetail.swift
//  domain
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

public struct RecipeDetail: Equatable {
    let id: String
    let name: String
    let description: String
    let image: String
    let ingredients: [Ingredient]
    let macronutrients: Macronutrient
    let location: Location
    let preparationTimeMinutes: Int
    let slices: Int
    let difficulty: String
    let instructions: [String]

    init(id: String, name: String, description: String, image: String, ingredients: [Ingredient], macronutrients: Macronutrient, location: Location, preparationTimeMinutes: Int, slices: Int, difficulty: String, instructions: [String]) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.ingredients = ingredients
        self.macronutrients = macronutrients
        self.location = location
        self.preparationTimeMinutes = preparationTimeMinutes
        self.slices = slices
        self.difficulty = difficulty
        self.instructions = instructions
    }
}
