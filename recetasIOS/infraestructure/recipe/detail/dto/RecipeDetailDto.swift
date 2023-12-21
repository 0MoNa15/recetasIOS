//
//  RecipeDetailDto.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

struct RecipeDetailDto: Codable {
    let id: String
    let name: String
    let description: String
    let image: String
    let ingredients: [IngredientDto]
    let macronutrients: MacronutrientDto
    let location: LocationDto
    let preparationTimeMinutes: Int
    let slices: Int
    let difficulty: String
    let instructions: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nombre"
        case description = "descripcion"
        case image = "imagen"
        case ingredients = "ingredientes"
        case macronutrients = "macronutrientes"
        case location = "ubicacion"
        case preparationTimeMinutes = "tiempo_preparacion_minutos"
        case slices = "porciones"
        case difficulty = "dificultad"
        case instructions = "instrucciones"
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        image = try container.decode(String.self, forKey: .image)
        ingredients = try container.decode([IngredientDto].self, forKey: .ingredients)
        macronutrients = try container.decode(MacronutrientDto.self, forKey: .macronutrients)
        location = try container.decode(LocationDto.self, forKey: .location)
        preparationTimeMinutes = try container.decode(Int.self, forKey: .preparationTimeMinutes)
        slices = try container.decode(Int.self, forKey: .slices)
        difficulty = try container.decode(String.self, forKey: .difficulty)
        instructions = try container.decode([String].self, forKey: .instructions)
    }
}
