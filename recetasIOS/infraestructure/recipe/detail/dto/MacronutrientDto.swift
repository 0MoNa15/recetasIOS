//
//  MacronutrientDto.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

struct MacronutrientDto: Codable {
    let calories: Int
    let proteins: Int
    let fats: Int
    let carbohydrates: Int

    enum CodingKeys: String, CodingKey {
        case calories = "calorias"
        case proteins = "proteinas"
        case fats = "grasas"
        case carbohydrates = "carbohidratos"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        calories = try container.decode(Int.self, forKey: .calories)
        proteins = try container.decode(Int.self, forKey: .proteins)
        fats = try container.decode(Int.self, forKey: .fats)
        carbohydrates = try container.decode(Int.self, forKey: .carbohydrates)
    }
}
