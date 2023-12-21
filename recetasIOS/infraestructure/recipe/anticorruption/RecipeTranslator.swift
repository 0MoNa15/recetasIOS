//
//  RecipeTranslator.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

struct RecipeTranslator {
    
    static func fromDtoToDomain(recipeDto: RecipeDto) throws -> Recipe {
        let recipe = try Recipe(
            id: recipeDto.id,
            name: recipeDto.name,
            ingredients: recipeDto.ingredients,
            urlImage: recipeDto.urlImage
        )
        return recipe
    }
}
