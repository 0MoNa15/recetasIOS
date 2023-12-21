//
//  RecipeRepository.swift
//  domain
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import Combine

protocol RecipeRepository {
    func getAllRecipes() -> AnyPublisher<[Recipe], Error>
    func getRecipesByCountry(nameCountry: String) -> AnyPublisher<[Recipe], Error>
    func getRecipeDetail(recipeId: String?) -> AnyPublisher<RecipeDetail, Error>
}
