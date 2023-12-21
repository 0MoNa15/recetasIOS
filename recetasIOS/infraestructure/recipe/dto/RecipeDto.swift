//
//  RecipeDto.swift
//  infraestructure
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import Foundation

struct RecipeDto: Codable {
    let id: String
    let name: String
    let ingredients: [String]
    let urlImage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nombre"
        case ingredients = "ingredientes"
        case urlImage = "imagen"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let id = try container.decode(String.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let ingredients = try container.decode([String].self, forKey: .ingredients)
        let urlImage = try container.decode(String.self, forKey: .urlImage)
        
        self.id = id
        self.name = name
        self.ingredients = ingredients
        self.urlImage = urlImage
    }
}

