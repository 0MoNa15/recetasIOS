//
//  RecipeAlamofireRepository.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import Combine

internal class RecipeAlamofireRepository : RecipeRepository {
    private let httpClient: HttpClient
    
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    func getAllRecipes() -> AnyPublisher<[Recipe], Error> {
        let request = GetAllRecipesRequest(object: nil)
        
        return httpClient.requestGeneric(request: request,
                                         entity: RecipesDto.self,
                                         queue: .global(),
                                         retries: 1)
            .tryMap { recipes in
                return try recipes.recipes.compactMap { recipeDto in
                    do {
                        return try RecipeTranslator.fromDtoToDomain(recipeDto: recipeDto)
                    } catch {
                        throw error
                    }
                }
            }
            .eraseToAnyPublisher()
    }

    func getRecipesByCountry(nameCountry: String) -> AnyPublisher<[Recipe], Error> {
        fatalError("Not implemented")
    }

    func getRecipeDetail(recipeId: String?) -> AnyPublisher<RecipeDetail, Error> {
        let request = GetRecipeDetailRequest(object: recipeId)

        return httpClient.requestGeneric(request: request,
                                         entity: RecipeDetailDto.self,
                                         queue: .global(),
                                         retries: 1)
            .tryMap { recipeDetailDto in
                do {
                    return try RecipeDetailTranslator.fromDtoToDomain(recipeDetailDto: recipeDetailDto)
                } catch {
                    throw error
                }
            }
            .eraseToAnyPublisher()
    }
}
