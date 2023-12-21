//
//  RecipeDetailStateView.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

enum RecipeDetailStateView<T>: Equatable where T: Equatable {
    case LOADING
    case SUCCESS(data: T?)
    case FAILURE(error: String)
}

