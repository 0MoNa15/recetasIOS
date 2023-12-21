//
//  Ingredient.swift
//  domain
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

class Ingredient {
    let name: String
    let amount: Int
    let presentation: String

    init(name: String, amount: Int, presentation: String) {
        self.name = name
        self.amount = amount
        self.presentation = presentation
    }
}
