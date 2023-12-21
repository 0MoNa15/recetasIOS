//
//  RecipeListViewModelObservable.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Combine

protocol RecipeListViewModelObservable: ObservableObject {
    var state: RecipeListStateView<Recipe> { get }
    var idRecipe: String { get set }
    func getRecipes()
}
