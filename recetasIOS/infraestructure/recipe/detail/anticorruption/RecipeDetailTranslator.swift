//
//  RecipeDetailTranslator.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

struct RecipeDetailTranslator {
    
    static func fromDtoToDomain(recipeDetailDto: RecipeDetailDto) throws -> RecipeDetail {
        
        let location = try LocationTranslator.fromDtoToDomain(locationDto: recipeDetailDto.location)
        let macronutrient = try MacronutrientTranslator.fromDtoToDomain(macronutrientDto: recipeDetailDto.macronutrients)
        let ingredientsList = try IngredientTranslator.fromListDtoToListDomain(listIngredientsDto: recipeDetailDto.ingredients)
        
        let recipeDetail = try RecipeDetail(
            id: recipeDetailDto.id,
            name: recipeDetailDto.name,
            description: recipeDetailDto.description,
            image: recipeDetailDto.image,
            ingredients: ingredientsList,
            macronutrients: macronutrient,
            location: location,
            preparationTimeMinutes: recipeDetailDto.preparationTimeMinutes,
            slices: recipeDetailDto.slices,
            difficulty: recipeDetailDto.difficulty,
            instructions: recipeDetailDto.instructions
        )
        return recipeDetail
    }
}
