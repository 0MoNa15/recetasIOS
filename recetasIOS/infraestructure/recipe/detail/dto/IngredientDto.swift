//
//  IngredientDto.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

struct IngredientDto: Codable {
    let name: String
    let amount: Int
    let presentation: String
    
    enum CodingKeys: String, CodingKey {
        case name = "nombre"
        case amount = "cantidad"
        case presentation = "presentacion"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        name = try container.decode(String.self, forKey: .name)
        amount = try container.decode(Int.self, forKey: .amount)
        presentation = try container.decode(String.self, forKey: .presentation)
    }
}
