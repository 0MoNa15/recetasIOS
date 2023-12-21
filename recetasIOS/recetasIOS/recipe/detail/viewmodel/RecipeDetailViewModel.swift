//
//  RecipeDetailViewModel.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import Combine

final class RecipeDetailViewModel {
    private let getRecipeDetailUseCase: GetRecipeDetailUseCaseImpl
    private var cancellables = Set<AnyCancellable>()
    @Published var state = RecipeDetailStateView<RecipeDetail>.LOADING
    var idRecipe: String = ""
    
    init(getRecipeDetailUseCase: GetRecipeDetailUseCaseImpl, idRecipe: String) {
        self.getRecipeDetailUseCase = getRecipeDetailUseCase
        self.idRecipe = idRecipe
    }
}

extension RecipeDetailViewModel: RecipeDetailViewModelObservable {
    
    func getRecipeDetail() {
        state = .LOADING
        getRecipeDetailUseCase.invoke(recipeId: self.idRecipe)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                self.state = .FAILURE(error: error.localizedDescription)
            }, receiveValue: { recipes in
                self.state = .SUCCESS(data: recipes)
            }) .store(in: &cancellables)
        
    }
}
