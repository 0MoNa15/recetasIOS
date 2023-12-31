//
//  RecipeDetailDependencyAssembler.swift
//  recipesIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import Swinject

class RecipeDetailDependencyAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(GetRecipeDetailUseCaseImpl.self) { container in
            GetRecipeDetailUseCaseImpl(recipeRepository: container.resolve(RecipeRepository.self)!)
        }
        .inObjectScope(.container)
        
        container.register(RecipeDetailViewModel.self) { (container, idRecipe: String) in
            RecipeDetailViewModel(getRecipeDetailUseCase: container.resolve(GetRecipeDetailUseCaseImpl.self)!, idRecipe: idRecipe)
        }
    }
}
