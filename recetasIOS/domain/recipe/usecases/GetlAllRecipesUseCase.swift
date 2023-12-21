//
//  GetlAllRecipesUseCase.swift
//  domain
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Combine

protocol GetAllRecipesUseCase {
    func invoke() -> AnyPublisher<[Recipe], Error>
}

final class GetAllRecipesUseCaseImpl: GetAllRecipesUseCase {
    private let recipeRepository: RecipeRepository
    
    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }
    
    func invoke() -> AnyPublisher<[Recipe], Error> {
        return recipeRepository.getAllRecipes()
    }
}
