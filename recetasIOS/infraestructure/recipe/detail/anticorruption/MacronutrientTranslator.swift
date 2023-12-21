//
//  MacronutrientTranslator.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation


struct MacronutrientTranslator {
    
    static func fromDtoToDomain(macronutrientDto: MacronutrientDto) throws -> Macronutrient {
        let macronutrient = try Macronutrient(
            calories: macronutrientDto.calories,
            proteins: macronutrientDto.proteins,
            fats: macronutrientDto.fats,
            carbohydrates: macronutrientDto.carbohydrates
        )
        return macronutrient
    }
}
