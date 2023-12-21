//
//  GetRecipeDetailUseCase.swift
//  domain
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Combine

protocol GetRecipeDetailUseCase {
    func invoke(recipeId: String?) -> AnyPublisher<RecipeDetail, Error>
}

final class GetRecipeDetailUseCaseImpl: GetRecipeDetailUseCase {
    private let recipeRepository: RecipeRepository
    
    init(recipeRepository: RecipeRepository) {
        self.recipeRepository = recipeRepository
    }
    
    func invoke(recipeId: String?) -> AnyPublisher<RecipeDetail, Error> {
        return recipeRepository.getRecipeDetail(recipeId: recipeId)
    }
}
