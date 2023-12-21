//
//  RecipeListViewModel.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation
import Combine

final class RecipeListViewModel {
    private let getAllRecipesUseCase: GetAllRecipesUseCaseImpl
    private var cancellables = Set<AnyCancellable>()
    @Published var state = RecipeListStateView<Recipe>.LOADING
    var idRecipe: String = ""
    
    init(getAllRecipesUseCase: GetAllRecipesUseCaseImpl) {
        self.getAllRecipesUseCase = getAllRecipesUseCase
        self.getRecipes()
    }
}

extension RecipeListViewModel: RecipeListViewModelObservable {
    
    func getRecipes() {
        state = .LOADING
        getAllRecipesUseCase.invoke()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                guard case .failure(let error) = completion else { return }
                self.state = .FAILURE(error: error.localizedDescription)
            }, receiveValue: { recipes in
                self.state = .SUCCESS(data: recipes)
            }) .store(in: &cancellables)
        
    }
}
