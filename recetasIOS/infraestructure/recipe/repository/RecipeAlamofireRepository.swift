//
//  RecipeAlamofireRepository.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import Combine

internal class RecipeAlamofireRepository : RecipeRepository {
    func getAllRecipes() -> AnyPublisher<[Recipe], Error> {
        fatalError("Not implemented")
    }

    func getRecipesByCountry(nameCountry: String) -> AnyPublisher<[Recipe], Error> {
        fatalError("Not implemented")
    }

    func getRecipeDetail(recipeId: String?) -> AnyPublisher<RecipeDetail, Error> {
        fatalError("Not implemented")
    }
}
