//
//  RecipeDetailViewModelObservable.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

protocol RecipeDetailViewModelObservable: ObservableObject {
    var state: RecipeDetailStateView<RecipeDetail> { get }
    func getRecipeDetail()
}
