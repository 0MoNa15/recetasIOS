//
//  Macronutrient.swift
//  domain
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

class Macronutrient {
    let calories: Int
    let proteins: Int
    let fats: Int
    let carbohydrates: Int

    init(calories: Int, proteins: Int, fats: Int, carbohydrates: Int) {
        self.calories = calories
        self.proteins = proteins
        self.fats = fats
        self.carbohydrates = carbohydrates
    }
}
