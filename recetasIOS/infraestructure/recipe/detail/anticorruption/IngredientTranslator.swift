//
//  IngredientTranslator.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

struct IngredientTranslator {
    
    static func fromDtoToDomain(ingredientDto: IngredientDto) throws -> Ingredient {
        
        let ingredient = try Ingredient(
            name: ingredientDto.name,
            amount: ingredientDto.amount,
            presentation: ingredientDto.presentation
        )
        return ingredient
    }
    
    static func fromListDtoToListDomain(listIngredientsDto: [IngredientDto]) throws -> [Ingredient] {
        
        return try listIngredientsDto.map { try fromDtoToDomain(ingredientDto: $0) }
    }
}
