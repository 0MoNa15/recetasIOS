//
//  Recipe.swift
//  domain
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

class Recipe {
    let id: String
    let name: String
    let ingredients: [String]
    let urlImage: String

    init(id: String = "", name: String = "", ingredients: [String] = [], urlImage: String = "") {
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.urlImage = urlImage
    }
}

