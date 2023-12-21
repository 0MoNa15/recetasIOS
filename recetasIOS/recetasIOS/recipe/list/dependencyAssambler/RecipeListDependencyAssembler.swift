//
//  RecipeListDependencyAssembler.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import Swinject

class RecipeListDependencyAssembler: Assembly {
    
    func assemble(container: Container) {
        container.register(GetAllRecipesUseCaseImpl.self) { container in
            GetAllRecipesUseCaseImpl(recipeRepository: container.resolve(RecipeRepository.self)!)
        }
        .inObjectScope(.container)
        
        container.register(RecipeListViewModel.self) { container in
            RecipeListViewModel(getAllRecipesUseCase: container.resolve(GetAllRecipesUseCaseImpl.self)!)
        }
    }
}
